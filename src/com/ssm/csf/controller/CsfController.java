package com.ssm.csf.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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

	@RequestMapping("singleArticle")
	public String singleArticle(HttpServletRequest request) {
		int article_id = 1;
		String article_idStr = request.getParameter("id");
		if (article_idStr != null) {
			article_id = Integer.parseInt(article_idStr);
		}
		Article article = csfService.selectArticleById(article_id);
		request.setAttribute("article", article);
		request.setAttribute("path", CSFUtil.getNavPath(csfService.selectAllMenu(), article.getMenu_id()));
		return "csf/singleArticle";
	}

	@RequestMapping("editArticle")
	public String editArticle(HttpServletRequest request) {
		int article_id = 1;
		String article_idStr = request.getParameter("id");
		if (article_idStr != null) {
			article_id = Integer.parseInt(article_idStr);
		}
		Article article = csfService.selectArticleById(article_id);
		request.setAttribute("article", article);
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

	@RequestMapping("saveContent")
	public String saveContent(HttpServletRequest request) {
		//System.out.println(request.getParameter("content"));
		request.setAttribute("content", request.getParameter("content"));
		return "csf/showContent";
	}
}
