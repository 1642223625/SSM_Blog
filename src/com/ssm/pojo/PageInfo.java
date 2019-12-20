package com.ssm.pojo;

import java.io.Serializable;
import java.util.List;

public class PageInfo implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer pageNumber = 1;// 默认第一页
	private Integer rowStart;
	private Integer pageSize = 8;// 默认每页八条数据
	private Integer totalPage;
	private String type;
	private String date;
	private String search;
	private List<?> list;

	public Integer getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(Integer pageNumber) {
		this.pageNumber = pageNumber;
	}

	public Integer getRowStart() {
		return rowStart;
	}

	public void setRowStart(Integer rowStart) {
		this.rowStart = rowStart;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}	

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public List<?> getList() {
		return list;
	}

	public void setList(List<?> list) {
		this.list = list;
	}
}
