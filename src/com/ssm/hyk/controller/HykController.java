package com.ssm.hyk.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import com.ssm.hyk.service.HykService;

@Controller
public class HykController {
	Logger logger = Logger.getLogger(getClass());
	@Resource
	private HykService hykService;

}
