package com.ssm.csf.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.ssm.pojo.Article;
import com.ssm.pojo.Menu;
import com.ssm.pojo.PageInfo;
import com.ssm.pojo.Tag;

public interface CsfMapper {
	@Results({ @Result(property = "id", column = "id", id = true),
			@Result(property = "subMenus", many = @Many(select = "selectAllMenus"), column = "id") })
	@Select("select * from menu where belong=#{belong}")
	List<Menu> selectAllMenus(int belong);

	@Select("select count(*) from ${tableName}")
	Integer selectTableCount(@Param("tableName") String tableName);

	@Select("select * from article order by detailDate desc limit #{rowStart},#{pageSize}")
	List<Article> selectArticles(PageInfo pageInfo);

	@Select("select * from article where id=#{id}")
	Article selectArticleById(int id);

	@Select("select distinct date from article")
	List<String> selectAllArticleDate();

	@Select("select * from article order by collect desc limit 0,5")
	List<Article> selectCollectArticles();

	@Results({ @Result(property = "count", column = "count(*)") })
	@Select("select count(*),type from article group by type order by count(*) desc")
	List<Tag> selectAllTags();
}
