package com.ssm.pojo;

public class Test {
	private Integer id;
	private String name;
	private String portrait;

	public Test() {
	}

	public Test(Integer id, String name, String portrait) {
		super();
		this.id = id;
		this.name = name;
		this.portrait = portrait;
	}

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

	public String getPortrait() {
		return portrait;
	}

	public void setPortrait(String portrait) {
		this.portrait = portrait;
	}
}
