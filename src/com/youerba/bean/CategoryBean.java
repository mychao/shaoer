package com.youerba.bean;

/**
 * 分类
 * @author mychao
 *
 */
public class CategoryBean extends BaseBean{
	
	private String url;
	private int sort;
	private boolean hidden;
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public boolean isHidden() {
		return hidden;
	}
	public void setHidden(boolean hidden) {
		this.hidden = hidden;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
}
