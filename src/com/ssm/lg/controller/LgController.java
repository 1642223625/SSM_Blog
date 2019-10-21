package com.ssm.lg.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import com.ssm.lg.service.LgService;

@Controller
public class LgController {
	Logger logger = Logger.getLogger(getClass());
	@Resource
	private LgService lgService;

}
