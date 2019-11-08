package com.ssm.csf.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
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
import com.ssm.pojo.PageInfo;

@Controller
@RequestMapping("csf")
public class CsfController {
	Logger logger = Logger.getLogger(getClass());
	@Resource
	private CsfService csfService;
	private static Article article;

	@RequestMapping("showArticleContent")
	public String singleArticle(HttpServletRequest request) {
		int article_id = 1;// 设置一个默认查看的博文id
		String article_idStr = request.getParameter("id");
		if (article_idStr != null) {// 如果请求中的博文id不为空则设置为请求值
			article_id = Integer.parseInt(article_idStr);
		}
		article = csfService.selectArticleById(article_id);
		article.setHTMLContent(CSFUtil.trimPLabel(article.getHTMLContent()));
		csfService.updateBrowse(article_id, article.getBrowse() + 1);// 更新浏览量加一
		request.setAttribute("article", article);
		// 设置文章的层级路径值
		request.setAttribute("path", CSFUtil.getNavPath(csfService.selectAllMenu(), article.getMenu_id()));
		CSFUtil.setAside(request, csfService, (PageInfo) request.getSession().getAttribute("pageInfo"));
		return "csf/showArticleContent";
	}

	@RequestMapping("addNewArticle")
	public String addNewArticle(HttpServletRequest request) {
		request.setAttribute("article", new Article());
		request.setAttribute("types", csfService.selectAllTypes());
		request.setAttribute("add", "true");// 用于判断是否为新增的标志位
		CSFUtil.setAside(request, csfService, (PageInfo) request.getSession().getAttribute("pageInfo"));
		return "csf/editArticle";
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
		request.setAttribute("add", "false");// 用于判断是否为新增的标志位
		CSFUtil.setAside(request, csfService, (PageInfo) request.getSession().getAttribute("pageInfo"));
		return "csf/editArticle";
	}

	@SuppressWarnings({ "deprecation" })
	@RequestMapping("updateArticle")
	public String saveContent(HttpServletRequest request) {
		article = new Article();
		String menuId_Type = request.getParameter("menuId_Type");
		String[] mt = menuId_Type.split("-");
		String tempPicUri = request.getParameter("picUri");// 从编辑页中获取到的图片路径
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
		if (tempPicUri.startsWith("temp/")) {// 在客户端修改过博文图片
			String picUri = csfService.selectPicUriById(article.getId());
			if (!"block.jpg".equals(picUri)) {// 如果原图片不是默认的图片，则删除原图片
				new File(request.getRealPath("images/" + picUri)).delete();
			}
			picUri = tempPicUri.replace("temp/", "");// 获取暂存区中上传的文件名
			CSFUtil.copyFile(request.getRealPath(tempPicUri), request.getRealPath("images/" + picUri));
			new File(request.getRealPath(tempPicUri)).delete();// 删除暂存区中的文件
			article.setPicUri(picUri);
		} else {
			article.setPicUri(tempPicUri.replace("images/", ""));// 去除路径，仅存文件名
		}
		int result;
		if ("true".equals(request.getParameter("add"))) {// 对新增还是更新标志位进行判断
			result = csfService.insertNewArticle(article);
		} else {
			result = csfService.updateArticle(article);
		}
		if (result > 0) {
			request.setAttribute("article", csfService.selectArticleById(article.getId()));
			// 获取该博文对应类型的层级路径
			request.setAttribute("path", CSFUtil.getNavPath(csfService.selectAllMenu(), article.getMenu_id()));
			request.setAttribute("next", "main");// 设置下一次success页面中自动跳转的路径
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
			FileUtils.copyInputStreamToFile(picFile.getInputStream(), new File(path, fileName));// 写入图片到服务器
			return fileName;// 返回保存到暂存区的文件名
		} catch (IOException e) {
			logger.error(e.getMessage());
		}
		return "block.jpg";// 返回默认的博文图片
	}
}
