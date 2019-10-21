package com.ssm.lsd.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssm.lsd.mapper.LsdMapper;
import com.ssm.lsd.service.LsdService;

@Service
public class LsdServiceImpl implements LsdService{
	@Resource
	private LsdMapper lsdMapper;

}
