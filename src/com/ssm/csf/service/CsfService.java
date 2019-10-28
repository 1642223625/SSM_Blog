package com.ssm.csf.service;

import java.util.List;

import com.ssm.pojo.Article;
import com.ssm.pojo.Menu;

public interface CsfService {
	List<Menu> selectAllMenu();

	Article selectArticleById(int id);

}
