package com.ssm.csf.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.ssm.pojo.Article;
import com.ssm.pojo.Menu;

public interface CsfMapper {
	@Results({ @Result(property = "id", column = "id", id = true),
			@Result(property = "subMenus", many = @Many(select = "selectAllMenus"), column = "id") })
	@Select("select * from menu where belong=#{belong}")
	List<Menu> selectAllMenus(int belong);

	@Select("select * from article where id=#{id}")
	Article selectArticleById(int id);
	
}
