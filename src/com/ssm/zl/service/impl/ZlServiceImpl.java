package com.ssm.zl.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssm.zl.mapper.ZlMapper;
import com.ssm.zl.service.ZlService;

@Service
public class ZlServiceImpl implements ZlService{
	@Resource
	private ZlMapper zlMapper;

}
