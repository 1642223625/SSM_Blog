package com.ssm.mhr.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.csf.service.CsfService;
import com.ssm.csf.util.CSFUtil;
import com.ssm.mhr.service.MhrService;
import com.ssm.pojo.PageInfo;

@Controller
public class MhrController {
	Logger logger = Logger.getLogger(getClass());
	@Resource
	private MhrService mhrService;
	@Resource
	private CsfService csfService;

	@RequestMapping("main")
	public String main(HttpServletRequest request) {
		CSFUtil.setMenu(request, csfService);// 设置菜单
		String pageNumberStr = request.getParameter("pageNumber");
		PageInfo pageInfo = new PageInfo();
		pageInfo.setType(request.getParameter("type"));
		pageInfo.setDate(request.getParameter("date"));
		if (pageNumberStr != null) {
			pageInfo.setPageNumber(Integer.parseInt(pageNumberStr));
		}
		pageInfo = csfService.selectArticles(pageInfo);
		request.setAttribute("pageInfo", pageInfo);
		Integer[] pageCount = new Integer[pageInfo.getTotalPage()];// 该空数组只用于页码个数的迭代显示
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("collect", csfService.selectCollectArticles());
		request.setAttribute("comment", csfService.selectCommentArticles());
		request.setAttribute("articleDates", csfService.selectAllArticleDate(pageInfo));
		request.setAttribute("tags", csfService.selectAllTags(pageInfo));
		request.setAttribute("links", csfService.selectAllLinks());
		return "mhr/main";
	}

}
