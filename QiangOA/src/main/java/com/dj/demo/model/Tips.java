package com.dj.demo.model;

public class Tips {
	private String position;
	private String lines;
	private String alias;
	public Tips() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getLines() {
		return lines;
	}
	public void setLines(String line) {
		this.lines = line;
	}
	public String getAlias() {
		return alias;
	}
	public void setAlias(String alias) {
		this.alias = alias;
	}
	@Override
	public String toString() {
		return "Tips [position=" + position + ", lines=" + lines + ", alias=" + alias + "]";
	}
	
}
