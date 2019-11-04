package com.ssm.mhr.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.csf.service.CsfService;
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
		PageInfo pageInfo=csfService.selectArticles(new PageInfo());
		request.setAttribute("pageInfo", pageInfo);
		return "mhr/main";
	}

}
