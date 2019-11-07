package com.ssm.csf.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ssm.csf.service.CsfService;
import com.ssm.csf.util.CSFUtil;
import com.ssm.pojo.Article;
import com.ssm.pojo.Menu;
import com.ssm.pojo.PageInfo;

@Controller
@RequestMapping("csf")
public class CsfController {
	Logger logger = Logger.getLogger(getClass());
	@Resource
	private CsfService csfService;

	@RequestMapping("menu")
	public String menu(HttpServletRequest request) {
		List<Menu> menus = csfService.selectAllMenu();
		request.getServletContext().setAttribute("menus", menus);
		request.setAttribute("menus", menus);
		return "csf/menu";
	}

	@RequestMapping("articleByPage")
	public String article(HttpServletRequest request) {
		String pageNumberStr = request.getParameter("pageNumber");
		PageInfo pageInfo = new PageInfo();
		if (pageNumberStr != null) {
			pageInfo.setPageNumber(Integer.parseInt(pageNumberStr));
		}
		csfService.selectArticles(pageInfo);
		request.setAttribute("pageInfo", pageInfo);
		Integer[] pageCount = new Integer[pageInfo.getTotalPage()];
		request.setAttribute("pageCount", pageCount);
		return "csf/article";
	}

	@RequestMapping("showArticleContent")
	public String singleArticle(HttpServletRequest request) {
		int article_id = 1;// 设置一个默认查看的博文id
		String article_idStr = request.getParameter("id");
		if (article_idStr != null) {// 如果请求中的博文id不为空则设置为请求值
			article_id = Integer.parseInt(article_idStr);
		}
		Article article = csfService.selectArticleById(article_id);
		request.setAttribute("article", article);
		// 设置文章的层级路径值
		request.setAttribute("path", CSFUtil.getNavPath(csfService.selectAllMenu(), article.getMenu_id()));
		CSFUtil.setAside(request, csfService, (PageInfo) request.getSession().getAttribute("pageInfo"));
		return "csf/showArticleContent";
	}

	@RequestMapping("editArticle")
	public String editArticle(HttpServletRequest request) {
		int article_id = 1;
		String article_idStr = request.getParameter("id");
		if (article_idStr != null) {
			article_id = Integer.parseInt(article_idStr);
		}
		request.setAttribute("article", csfService.selectArticleById(article_id));
		request.setAttribute("types", csfService.selectAllTypes());
		CSFUtil.setAside(request, csfService, (PageInfo) request.getSession().getAttribute("pageInfo"));
		return "csf/editArticle";
	}

	@RequestMapping("getArticleDate")
	public String getArticleDate(HttpServletRequest request) {
		request.setAttribute("articleDate", csfService.selectAllArticleDate(new PageInfo()));
		return "csf/articleDate";
	}

	@RequestMapping("collectArticle")
	public String collectArticle(HttpServletRequest request) {
		request.setAttribute("collect", csfService.selectCollectArticles());
		return "csf/collect";
	}

	@RequestMapping("tags")
	public String tags(HttpServletRequest request) {
		request.setAttribute("tags", csfService.selectAllTags(new PageInfo()));
		return "csf/tag";
	}

	@RequestMapping("commentArticle")
	public String commentArticle(HttpServletRequest request) {
		request.setAttribute("comment", csfService.selectCommentArticles());
		return "csf/comment";
	}

	@RequestMapping("links")
	public String links(HttpServletRequest request) {
		request.setAttribute("links", csfService.selectAllLinks());
		return "csf/links";
	}

	@SuppressWarnings("deprecation")
	@RequestMapping("saveContent")
	public String saveContent(HttpServletRequest request) {
		// System.out.println(request.getParameter("content"));
		Article article = new Article();
		String menuId_Type = request.getParameter("menuId_Type");
		String[] mt = menuId_Type.split("-");
		String tempPicUri = request.getParameter("picUri");
		article.setId(Integer.parseInt(request.getParameter("id")));
		article.setMenu_id(Integer.parseInt(mt[0]));
		article.setType(mt[1]);
		article.setTitle(request.getParameter("title"));
		article.setAuthor(request.getParameter("author"));
		article.setDate(CSFUtil.getDate(new Date()));
		article.setDetailDate(CSFUtil.getDetailDate(new Date()));
		article.setBrowse(Integer.parseInt(request.getParameter("browse")));
		article.setComment(Integer.parseInt(request.getParameter("comment")));
		article.setCollect(Integer.parseInt(request.getParameter("collect")));
		article.setContent(request.getParameter("content"));
		article.setHTMLContent(request.getParameter("HTMLContent"));
		String picUri = csfService.selectPicUriById(article.getId());
		if (!"block.jpg".equals(picUri)) {
			new File(request.getRealPath("images/" + picUri)).delete();
		}
		picUri = tempPicUri.replace("temp/", "");
		CSFUtil.copyFile(request.getRealPath(tempPicUri), request.getRealPath("images/" + picUri));
		new File(request.getRealPath(tempPicUri)).delete();
		article.setPicUri(picUri);
		if (csfService.updateArticle(article) > 0) {
			request.setAttribute("article", csfService.selectArticleById(article.getId()));
			request.setAttribute("path", CSFUtil.getNavPath(csfService.selectAllMenu(), article.getMenu_id()));
			request.setAttribute("next", "main");
			return "csf/success";
		} else {
			return "csf/error";
		}
	}

	@ResponseBody
	@RequestMapping("uploadPic")
	public String uploadPic(HttpServletRequest request, MultipartFile picFile) {
		String path = request.getServletContext().getRealPath("temp");// 获取temp临时文件夹路径
		File temp = new File(path);
		if (!temp.exists()) {// 如果临时文件夹不存在则新建
			temp.mkdir();
		}
		String fileName = picFile.getOriginalFilename();
		try {
			String suffix = fileName.substring(fileName.lastIndexOf('.'));// 获取文件后缀
			fileName = UUID.randomUUID().toString() + suffix;// 随机定义文件名
		} catch (Exception e) {
		}
		try {
			FileUtils.copyInputStreamToFile(picFile.getInputStream(), new File(path, fileName));// 写入图片到服务器
			return fileName;
		} catch (IOException e) {
			logger.error(e.getMessage());
		}
		return "block.jpg";
	}
}
