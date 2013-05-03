package com.youerba.bean;

import com.google.appengine.api.datastore.Key;

/**
 * 
 * @author mychao
 *
 */
//@PersistenceCapable
public class BaseBean {
	
//	@PrimaryKey
//	@Persistent(valueStrategy=IdGeneratorStrategy.IDENTITY)
	private Key key;
//	@Persistent
	private int id;
//	@Persistent
	private String name;
	
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
	public Key getKey() {
		return key;
	}
	public void setKey(Key key) {
		this.key = key;
	}

}
