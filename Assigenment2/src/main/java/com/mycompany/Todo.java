package com.mycompany;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Todo {
	@Id
        int id;
        String name;
        String msg;
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
		public String getMsg() {
			return msg;
		}
		public void setMsg(String msg) {
			this.msg = msg;
		}
}
