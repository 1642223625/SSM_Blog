package com.ssm.csf.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssm.csf.mapper.CsfMapper;
import com.ssm.csf.service.CsfService;

@Service
public class CsfServiceImpl implements CsfService{
	@Resource
	private CsfMapper csfMapper;

}
