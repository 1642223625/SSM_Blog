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
		request.setAttribute("collect", csfService.selectCollectArticles());
		if (request.getSession().getAttribute("pageInfo") == null) {
			//默认的PageInfo中默认为页面信息为第一页，每页显示十条
			request.getSession().setAttribute("pageInfo", new PageInfo());
		}
		CSFUtil.setContent(request, csfService, (PageInfo) request.getSession().getAttribute("pageInfo"));
		CSFUtil.setAside(request, csfService, (PageInfo) request.getSession().getAttribute("pageInfo"));
		return "mhr/main";
	}

}
