package com.ssm.lsd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.ssm.pojo.Comment;

public interface LsdMapper {

	@Select("select * from comment where article_id=#{id}")
	List<Comment> loadComment(String id);
}
