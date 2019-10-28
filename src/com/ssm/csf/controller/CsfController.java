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

@Controller
public class CsfController {
	Logger logger = Logger.getLogger(getClass());
	@Resource
	private CsfService csfService;

	@RequestMapping("menu")
	public String menu(HttpServletRequest request) {
		List<Menu> menus=csfService.selectAllMenu();
		request.getServletContext().setAttribute("menus", menus);
		request.setAttribute("menus", menus);
		return "csf/menu";
	}

	@RequestMapping("article")
	public String article(HttpServletRequest request) {
		int article_id = Integer.parseInt(request.getParameter("id"));
		Article article = csfService.selectArticleById(article_id);
		request.setAttribute("article", article);
		request.setAttribute("path", CSFUtil.getNavPath((List<Menu>)request.getServletContext().getAttribute("menus"), article.getMenu_id()));
		return "csf/article";
	}
}
