package com.ssm.pojo;

public class Article {
	private int id;
	private int menu_id;
	private String title;
	private String author;
	private String date;
	private int browse;
	private int collect;
	private String content;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getBrowse() {
		return browse;
	}

	public void setBrowse(int browse) {
		this.browse = browse;
	}

	public int getCollect() {
		return collect;
	}

	public void setCollect(int collect) {
		this.collect = collect;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
