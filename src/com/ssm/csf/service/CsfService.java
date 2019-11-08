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

	/**
	 * 选择所有的博文类型
	 * 
	 * @return
	 */
	List<Menu> selectAllTypes();

	Article selectArticleById(int id);

	/**
	 * 根据传入的表名查询表的记录数
	 * 
	 * @param tableName 传入的表名
	 * @return
	 */
	Integer selectTableCount(String tableName);

	/**
	 * 分页查询所有的文章信息，一次返回十条记录数
	 * 
	 * @param pageInfo
	 * @return
	 */
	PageInfo selectArticles(PageInfo pageInfo);

	/**
	 * 根据条件，查询所有文章的粗略时间字段，仅包含年份+月份信息，内部已去重
	 * 
	 * @param pageInfo
	 * @return
	 */
	List<String> selectAllArticleDate(PageInfo pageInfo);

	/**
	 * 查询最受欢迎的前五条文章，以收藏总数进行排序
	 * 
	 * @return
	 */
	List<Article> selectCollectArticles();

	/**
	 * 根据条件，查询所有的标签，并按照总数从大到小排序
	 * 
	 * @param pageInfo
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

	/**
	 * 根据传入的博文信息对博文进行更新
	 * 
	 * @param article
	 * @return
	 */
	Integer updateArticle(Article article);

	/**
	 * 根据传入的博文信息新增一条博文记录
	 * 
	 * @param article
	 * @return
	 */
	Integer insertNewArticle(Article article);

	/**
	 * 根据传入的id查找对应文章的图片
	 * 
	 * @param id
	 * @return
	 */
	String selectPicUriById(int id);

	/**
	 * 更新对应博文的浏览量
	 * 
	 * @param article_id
	 * @param browse
	 * @return
	 */
	Integer updateBrowse(int article_id, int browse);

	/**
	 * 更新对应博文的评论数
	 * 
	 * @param article_id
	 * @param comment
	 * @return
	 */
	Integer updateComment(int article_id, int comment);

	/**
	 * 更新对应博文的收藏量
	 * 
	 * @param article_id
	 * @param collect
	 * @return
	 */
	Integer updateCollect(int article_id, int collect);

	/**
	 * 根据博文id删除对应的博文
	 * 
	 * @param article_id
	 * @return
	 */
	Integer deleteArticleById(int article_id);

	/**
	 * 更新HTMLContent的内容
	 * 
	 * @param article
	 * @return
	 */
	Integer updateHTMLContent(Article article);
}
