package com.ssm.test.service;

import java.util.List;

import com.ssm.pojo.Test;

public interface TestService {
	List<Test> selectAll();

	Test selectById(int id);

	Test selectByName(Test test);

	int deleteByName(String name);

	int updateById(Test test);

	int insertNew(Test test);
}
