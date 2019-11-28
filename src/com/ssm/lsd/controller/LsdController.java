package com.ssm.lsd.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.csf.service.CsfService;
import com.ssm.lsd.service.LsdService;
@Controller
public class LsdController {
	Logger logger = Logger.getLogger(getClass());
	@Resource
	private LsdService lsdervice;
	@Resource
	private CsfService csfService;
	
	@RequestMapping("loadComment")
	public String loadComment(HttpServletRequest request) {
		Integer articleId = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("comments", lsdervice.selectComment(articleId));
		request.setAttribute("aid", articleId);
		return "lsd/Test";
	}
}
