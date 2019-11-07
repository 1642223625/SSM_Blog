package com.ssm.csf.mapper;

import java.util.List;

import org.apache.ibatis.annotations.CacheNamespace;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ssm.pojo.Article;
import com.ssm.pojo.Link;
import com.ssm.pojo.Menu;
import com.ssm.pojo.PageInfo;
import com.ssm.pojo.Tag;

@CacheNamespace
public interface CsfMapper {
	@Results({ @Result(property = "id", column = "id", id = true),
			@Result(property = "subMenus", many = @Many(select = "selectAllMenus"), column = "id") })
	@Select("select * from menu where belong=#{belong}")
	List<Menu> selectAllMenus(int belong);

	@Select("select count(*) from ${tableName}")
	Integer selectTableCount(@Param("tableName") String tableName);

	List<Article> selectArticles(PageInfo pageInfo);

	Integer selectArticleCount(PageInfo pageInfo);

	@Select("select * from article where id=#{id}")
	Article selectArticleById(int id);

	List<String> selectAllArticleDate(PageInfo pageInfo);

	@Select("select * from article order by collect desc limit 0,5")
	List<Article> selectCollectArticles();

	List<Tag> selectAllTags(PageInfo pageInfo);

	@Select("select * from article order by comment desc limit 0,5")
	List<Article> selectCommentArticles();

	@Select("select * from link")
	List<Link> selectAllLinks();

	@Update("update article set menu_id=#{menu_id},type=#{type},title=#{title},author=#{author},date=#{date},"
			+ "detailDate=#{detailDate},content=#{content},htmlContent=#{HTMLContent},picUri=#{picUri} where id=#{id}")
	Integer updateArticle(Article article);

	@Select("select picUri from article where id=#{id}")
	String selectPicUriById(int id);
}
