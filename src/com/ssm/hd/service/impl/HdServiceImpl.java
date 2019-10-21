package com.ssm.hd.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssm.hd.mapper.HdMapper;
import com.ssm.hd.service.HdService;

@Service
public class HdServiceImpl implements HdService{
	@Resource
	private HdMapper hdMapper;

}
