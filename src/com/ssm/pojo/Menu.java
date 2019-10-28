package com.ssm.pojo;

import java.util.List;

public class Menu {
	private int id;
	private String name;
	private int belong;
	private List<Menu> subMenus;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getBelong() {
		return belong;
	}

	public void setBelong(int belong) {
		this.belong = belong;
	}

	public List<Menu> getSubMenus() {
		return subMenus;
	}

	public void setSubMenus(List<Menu> subMenus) {
		this.subMenus = subMenus;
	}
}
