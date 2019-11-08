package com.ssm.csf.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssm.csf.mapper.CsfMapper;
import com.ssm.csf.service.CsfService;
import com.ssm.pojo.Article;
import com.ssm.pojo.Link;
import com.ssm.pojo.Menu;
import com.ssm.pojo.PageInfo;
import com.ssm.pojo.Tag;

@Service
public class CsfServiceImpl implements CsfService {
	@Resource
	private CsfMapper csfMapper;

	@Override
	public List<Menu> selectAllMenu() {
		return csfMapper.selectAllMenus(0);
	}

	@Override
	public List<Menu> selectAllTypes() {
		return csfMapper.selectAllMenus(3);
	}

	@Override
	public Article selectArticleById(int id) {
		return csfMapper.selectArticleById(id);
	}

	@Override
	public Integer selectTableCount(String tableName) {
		return csfMapper.selectTableCount(tableName);
	}

	@Override
	public PageInfo selectArticles(PageInfo pageInfo) {
		pageInfo.setRowStart((pageInfo.getPageNumber() - 1) * pageInfo.getPageSize());
		int articleCount = csfMapper.selectArticleCount(pageInfo);
		pageInfo.setTotalPage(articleCount % pageInfo.getPageSize() == 0 ? articleCount / pageInfo.getPageSize()
				: articleCount / pageInfo.getPageSize() + 1);
		pageInfo.setList(csfMapper.selectArticles(pageInfo));
		return pageInfo;
	}

	@Override
	public List<String> selectAllArticleDate(PageInfo pageInfo) {
		return csfMapper.selectAllArticleDate(pageInfo);
	}

	@Override
	public List<Article> selectCollectArticles() {
		return csfMapper.selectCollectArticles();
	}

	@Override
	public List<Tag> selectAllTags(PageInfo pageInfo) {
		return csfMapper.selectAllTags(pageInfo);
	}

	@Override
	public List<Article> selectCommentArticles() {
		return csfMapper.selectCommentArticles();
	}

	@Override
	public List<Link> selectAllLinks() {
		return csfMapper.selectAllLinks();
	}

	@Override
	public Integer updateArticle(Article article) {
		return csfMapper.updateArticle(article);
	}

	@Override
	public Integer insertNewArticle(Article article) {
		return csfMapper.insertNewArticle(article);
	}

	@Override
	public String selectPicUriById(int id) {
		return csfMapper.selectPicUriById(id);
	}

	@Override
	public Integer updateBrowse(int article_id, int browse) {
		return csfMapper.updateBrowse(article_id, browse);
	}

	@Override
	public Integer updateComment(int article_id, int comment) {
		return csfMapper.updateComment(article_id, comment);
	}

	@Override
	public Integer updateCollect(int article_id, int collect) {
		return csfMapper.updateCollect(article_id, collect);
	}
}
