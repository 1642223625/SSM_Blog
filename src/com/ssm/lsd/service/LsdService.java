package com.ssm.lsd.service;

import java.util.List;

import com.ssm.pojo.Comment;;

public interface LsdService {
	
	List<Comment> loadComment(String articleId);
}
