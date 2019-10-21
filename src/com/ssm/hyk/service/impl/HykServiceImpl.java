package com.ssm.hyk.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssm.hyk.mapper.HykMapper;
import com.ssm.hyk.service.HykService;

@Service
public class HykServiceImpl implements HykService{
	@Resource
	private HykMapper hykMapper;

}
