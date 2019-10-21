package com.ssm.lsd.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import com.ssm.lsd.service.LsdService;

@Controller
public class LsdController {
	Logger logger = Logger.getLogger(getClass());
	@Resource
	private LsdService lsdervice;

}
