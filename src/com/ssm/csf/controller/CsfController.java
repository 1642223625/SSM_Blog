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

	@ResponseBody
	@RequestMapping("uploadArticlePic")
	public String uploadArticlePic(HttpServletRequest request, int id, MultipartFile fileName) {
		String path = request.getServletContext().getRealPath("articlePics");
		File articlePics = new File(path + "/" + id);
		if (!articlePics.exists()) {
			articlePics.mkdir();
		}
		String picFile = fileName.getOriginalFilename();
		try {
			String suffix = picFile.substring(picFile.lastIndexOf('.'));
			picFile = UUID.randomUUID().toString() + suffix;
			FileUtils.copyInputStreamToFile(fileName.getInputStream(), new File(articlePics, picFile));// 写入图片到服务器
			return CSFUtil.getReturnJson("articlePics/" + id + "/" + picFile);
		} catch (IOException e) {
			logger.error(e.getMessage());
		}
		return CSFUtil.getReturnJson("articlePics/" + id + "/" + picFile, 1);// 第二个参数非0代表发生错误，默认为0
	}

	@RequestMapping("showArticleContent")
	public String singleArticle(HttpServletRequest request, int id) {
		Article article = CSFUtil.getArticle(request);
		article = csfService.selectArticleById(id);
		csfService.updateBrowse(id, article.getBrowse() + 1);// 更新浏览量加一
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
	public String editArticle(HttpServletRequest request, int id) {
		request.setAttribute("article", csfService.selectArticleById(id));
		request.setAttribute("types", csfService.selectAllTypes());
		request.setAttribute("add", "false");// 用于判断是否为新增的标志位
		CSFUtil.setAside(request, csfService, (PageInfo) request.getSession().getAttribute("pageInfo"));
		return "csf/editArticle";
	}

	@RequestMapping("deleteArticle")
	public String deleteArticle(HttpServletRequest request, int id) {
		if (csfService.deleteArticleById(id) > 0) {
			File file = new File(request.getServletContext().getRealPath("articlePics/") + id);
			if (file.exists()) {
				CSFUtil.deleteDictionary(file);
			}
			request.setAttribute("next", "main");
			return "csf/success";
		}
		return "csf/error";
	}

	@RequestMapping("updateArticle")
	public String saveContent(HttpServletRequest request, Article article) {
		String menuId_Type = request.getParameter("menuId_Type");// 该参数通过POST请求发送，不能在方法中直接赋值
		String[] mt = menuId_Type.split("-");
		String tempPicUri = article.getPicUri();
		article.setMenu_id(Integer.parseInt(mt[0]));
		article.setType(mt[1]);
		article.setDate(CSFUtil.getDate(new Date()));
		article.setDetailDate(CSFUtil.getDetailDate(new Date()));
		article.setHTMLContent(CSFUtil.trimPLabel(article.getHTMLContent()));
		if (tempPicUri.startsWith("temp/")) {// 在客户端修改过博文图片
			String picUri = csfService.selectPicUriById(article.getId());
			if (!"block.jpg".equals(picUri)) {// 如果原图片不是默认的图片，则删除原图片
				new File(request.getServletContext().getRealPath("images/" + picUri)).delete();
			}
			picUri = tempPicUri.replace("temp/", "");// 获取暂存区中上传的文件名
			CSFUtil.copyFile(request.getServletContext().getRealPath(tempPicUri),
					request.getServletContext().getRealPath("images/" + picUri));
			new File(request.getServletContext().getRealPath(tempPicUri)).delete();// 删除暂存区中的文件
			article.setPicUri(picUri);
		} else {
			article.setPicUri(tempPicUri.replace("images/", ""));// 去除路径，仅存文件名
		}
		int result;
		if ("true".equals(request.getParameter("add"))) {// 对新增还是更新标志位进行判断
			result = csfService.insertNewArticle(article);// 新增操作后会自动为该文章的主键值赋值
			File srcFile = new File(request.getServletContext().getRealPath("articlePics/0"));
			if (srcFile.exists()) {// 0目录为临时存放新博文中图片的目录，如果该目录存在则说明在新增博文的时候网博文中添加了图片
				File destFile = new File(request.getServletContext().getRealPath("articlePics/") + article.getId());
				CSFUtil.copyDictionary(srcFile, destFile);// 拷贝临时的博文图片
				CSFUtil.deleteDictionary(srcFile);// 删除临时存放文件夹
				article.setHTMLContent(
						article.getHTMLContent().replace("articlePics/0", "articlePics/" + article.getId()));
				csfService.updateHTMLContent(article);// 更新修改过图片路径的HTMLContent
			}
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

	@ResponseBody
	@RequestMapping("changeHeart")
	public String changeHeart(HttpServletRequest request, int article_id, int count) {
		return CSFUtil.getBooleanJson(csfService.updateCollect(article_id, count) > 0);
	}
}
