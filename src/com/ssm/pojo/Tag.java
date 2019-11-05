package com.ssm.pojo;

import java.io.Serializable;

public class Tag implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer count;
	private String type;

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
