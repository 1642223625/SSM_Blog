package com.ssm.zl.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import com.ssm.zl.service.ZlService;

@Controller
public class ZlController {
	Logger logger = Logger.getLogger(getClass());
	@Resource
	private ZlService zlService;

}
