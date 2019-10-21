package com.ssm.lg.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssm.lg.mapper.LgMapper;
import com.ssm.lg.service.LgService;

@Service
public class LgServiceImpl implements LgService{
	@Resource
	private LgMapper lgMapper;

}
