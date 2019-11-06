package com.ssm.csf.service;

import java.util.List;

import com.ssm.pojo.Article;
import com.ssm.pojo.Link;
import com.ssm.pojo.Menu;
import com.ssm.pojo.PageInfo;
import com.ssm.pojo.Tag;

public interface CsfService {
	/**
	 * 获取所有的菜单项
	 * 
	 * @return
	 */
	List<Menu> selectAllMenu();

	Article selectArticleById(int id);

	/**
	 * 根据传入的表名查询表的记录数
	 * 
	 * @param tableName 传入的表名
	 * @return
	 */
	Integer selectTableCount(String tableName);

	/**
	 * 分页查询文章的所有信息
	 * 
	 * @param pageInfo
	 * @return
	 */
	PageInfo selectArticles(PageInfo pageInfo);

	/**
	 * 查询所有文章的粗略信息，仅包含年份+月份信息，内部已去重
	 * 
	 * @return
	 */
	List<String> selectAllArticleDate(PageInfo pageInfo);

	/**
	 * 查询最受欢迎的前五条文章，以收藏数为依据
	 * 
	 * @return
	 */
	List<Article> selectCollectArticles();

	/**
	 * 查询所有的标签，并按照总数从大到小排序
	 * 
	 * @return
	 */
	List<Tag> selectAllTags(PageInfo pageInfo);

	/**
	 * 查询评论最多的前五条文章
	 * 
	 * @return
	 */
	List<Article> selectCommentArticles();

	/**
	 * 查询所有的友情链接
	 * 
	 * @return
	 */
	List<Link> selectAllLinks();
}
