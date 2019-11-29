package com.ssm.lsd.service;

import java.util.List;

import com.ssm.pojo.Comment;;

public interface LsdService {

	List<Comment> selectComment(int id, int pageNumber, int pageSize);
}
