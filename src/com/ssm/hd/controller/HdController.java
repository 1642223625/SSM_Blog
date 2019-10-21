package com.ssm.hd.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import com.ssm.hd.service.HdService;

@Controller
public class HdController {
	Logger logger = Logger.getLogger(getClass());
	@Resource
	private HdService hdService;

}
