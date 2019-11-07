package com.ssm.pojo;

public enum Month {
	January(1, "一月"), February(2, "二月"), March(3, "三月"), April(3, "四月"), May(3, "五月"), June(3, "六月"), July(3, "七月"),
	August(3, "八月"), September(3, "九月"), October(3, "十月"), November(3, "十一月"), December(3, "十二月");
	int key;
	String value;

	private Month(int key, String value) {
		this.key = key;
		this.value = value;
	}
}
