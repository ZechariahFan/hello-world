package com.dj.demo.model;

public class UsrInfo {
	
	private String operator;
	private String name;
	private String position;
	private String line;
	private String num;
	private String sj;
	private String shift;
	private String control;
	private String classify;
	private String jdsc;
	public UsrInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getControl() {
		return control;
	}

	public void setControl(String control) {
		this.control = control;
	}


	public String getClassify() {
		return classify;
	}

	public void setClassify(String classify) {
		this.classify = classify;
	}

	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getLine() {
		return line;
	}
	public void setLine(String line) {
		this.line = line;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getSj() {
		return sj;
	}
	public void setSj(String sj) {
		this.sj = sj;
	}
	public String getShift() {
		return shift;
	}
	public void setShift(String shift) {
		this.shift = shift;
	}

	public String getJdsc() {
		return jdsc;
	}

	public void setJdsc(String jdsc) {
		this.jdsc = jdsc;
	}

	@Override
	public String toString() {
		return "UsrInfo [operator=" + operator + ", name=" + name + ", position=" + position + ", line=" + line
				+ ", num=" + num + ", sj=" + sj + ", shift=" + shift + ", control=" + control + ", classify=" + classify
				+ ", jdsc=" + jdsc + "]";
	}


	
	
	
}
