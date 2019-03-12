package com.dj.demo.model;

import java.util.Date;

public class Operator {
	
	private String operator;
	private String name;
	private String skill;
	private Date o_Date;
	private String del;
	private String op_Shift;
	private String password;
	private int role_Id;
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
	public String getSkill() {
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
	}
	public Date getO_Date() {
		return o_Date;
	}
	public void setO_Date(Date o_Date) {
		this.o_Date = o_Date;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	public String getOp_Shift() {
		return op_Shift;
	}
	public void setOp_Shift(String op_Shift) {
		this.op_Shift = op_Shift;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getRole_Id() {
		return role_Id;
	}
	public void setRole_Id(int role_Id) {
		this.role_Id = role_Id;
	}
	public Operator() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Operator [operator=" + operator + ", name=" + name + ", skill=" + skill + ", o_Date=" + o_Date
				+ ", del=" + del + ", op_Shift=" + op_Shift + ", password=" + password + ", role_Id=" + role_Id + "]";
	}
	
	
}
