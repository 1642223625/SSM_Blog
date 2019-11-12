package com.ssm.mhr.controller;

import java.util.HashMap;
import java.util.Map;

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
		if (request.getSession().getAttribute("pageInfo") == null) {
			// 默认的PageInfo中默认为页面信息为第一页，每页显示十条
			request.getSession().setAttribute("pageInfo", new PageInfo());
			// 设置一个初始化博文点赞Map
			Map<Integer, Boolean> map = new HashMap<Integer, Boolean>();
			for (int i = 0; i < csfService.selectTableCount("article");) {
				map.put(++i, true);// 每一个新会话都会重新初始化点赞Map状态
			}
			request.getSession().setAttribute("heartMap", map);
		}
		request.setAttribute("collect", csfService.selectCollectArticles());
		CSFUtil.setContent(request, csfService, (PageInfo) request.getSession().getAttribute("pageInfo"));
		CSFUtil.setAside(request, csfService, (PageInfo) request.getSession().getAttribute("pageInfo"));
		return "mhr/main";
	}

}
