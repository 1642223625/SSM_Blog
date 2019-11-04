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

	@RequestMapping("article")
	public String article(HttpServletRequest request) {
		String pageNumberStr = request.getParameter("pageNumber");
		PageInfo pageInfo = new PageInfo();
		if (pageNumberStr != null) {
			pageInfo.setPageNumber(Integer.parseInt(pageNumberStr));
		}
		csfService.selectArticles(pageInfo);
		request.setAttribute("pageInfo", pageInfo);
		return "csf/article";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("singleArticle")
	public String singleArticle(HttpServletRequest request) {
		System.out.println("执行该方法如果报错，请先执行menu请求，然后在singleArticle后加上一个id参数");
		int article_id = Integer.parseInt(request.getParameter("id"));
		Article article = csfService.selectArticleById(article_id);
		request.setAttribute("article", article);
		request.setAttribute("path", CSFUtil.getNavPath((List<Menu>) request.getServletContext().getAttribute("menus"),
				article.getMenu_id()));
		return "csf/singleArticle";
	}

	@RequestMapping("getArticleDate")
	public String getArticleDate(HttpServletRequest request) {
		request.setAttribute("articleDate", csfService.selectAllArticleDate());
		return "csf/articleDate";
	}

	@RequestMapping("collectArticle")
	public String collectArticle(HttpServletRequest request) {
		request.setAttribute("collect", csfService.selectCollectArticles());
		return "csf/collect";
	}

	@RequestMapping("tags")
	public String tags(HttpServletRequest request) {
		request.setAttribute("tags", csfService.selectAllTags());
		return "csf/tag";
	}
}
