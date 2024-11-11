package com.mycompany;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Student {
	@Id
	int id;
	String name;
	double percent;
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
	public double getPercent() {
		return percent;
	}
	public void setPercent(double percent) {
		this.percent = percent;
	}

}
