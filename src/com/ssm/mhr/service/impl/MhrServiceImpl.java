package com.ssm.mhr.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssm.mhr.mapper.MhrMapper;
import com.ssm.mhr.service.MhrService;

@Service
public class MhrServiceImpl implements MhrService{
	@Resource
	private MhrMapper mhrMapper;

}
