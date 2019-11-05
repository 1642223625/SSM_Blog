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
	public List<String> selectAllArticleDate() {
		return csfMapper.selectAllArticleDate();
	}

	@Override
	public List<Article> selectCollectArticles() {
		return csfMapper.selectCollectArticles();
	}

	@Override
	public List<Tag> selectAllTags() {
		return csfMapper.selectAllTags();
	}

	@Override
	public List<Article> selectCommentArticles() {
		return csfMapper.selectCommentArticles();
	}

	@Override
	public List<Link> selectAllLinks() {
		return csfMapper.selectAllLinks();
	}

}
