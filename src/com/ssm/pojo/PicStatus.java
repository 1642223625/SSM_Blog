package com.ssm.pojo;

import java.io.Serializable;
import java.util.List;

public class PicStatus implements Serializable {
	private static final long serialVersionUID = 1L;
	private int errno;
	private List<String> data;

	public int getErrno() {
		return errno;
	}

	public void setErrno(int errno) {
		this.errno = errno;
	}

	public List<String> getData() {
		return data;
	}

	public void setData(List<String> data) {
		this.data = data;
	}
}
