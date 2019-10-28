package com.ssm.csf.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssm.csf.mapper.CsfMapper;
import com.ssm.csf.service.CsfService;
import com.ssm.pojo.Article;
import com.ssm.pojo.Menu;

@Service
public class CsfServiceImpl implements CsfService{
	@Resource
	private CsfMapper csfMapper;

	@Override
	public List<Menu> selectAllMenu() {
		return csfMapper.selectAllMenus(0);
	}

	@Override
	public Article selectArticleById(int id) {
		return csfMapper.selectArticleById(id);
	}

}
