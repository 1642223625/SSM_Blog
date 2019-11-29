package com.ssm.lsd.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssm.lsd.mapper.LsdMapper;
import com.ssm.lsd.service.LsdService;
import com.ssm.pojo.Comment;

@Service
public class LsdServiceImpl implements LsdService {
	@Resource
	private LsdMapper lsdMapper;
	private int rowStart;

	@Override
	public List<Comment> selectComment(int id, int pageNumber, int pageSize) {
		rowStart = (pageNumber - 1) * pageSize;
		return lsdMapper.selectComment(id, rowStart, pageSize);
	}

}
