package com.ssm.pojo;

import java.io.Serializable;
import java.util.List;

public class Menu implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String name;
	private Integer belong;
	private List<Menu> subMenus;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getBelong() {
		return belong;
	}

	public void setBelong(Integer belong) {
		this.belong = belong;
	}

	public List<Menu> getSubMenus() {
		return subMenus;
	}

	public void setSubMenus(List<Menu> subMenus) {
		this.subMenus = subMenus;
	}
}
