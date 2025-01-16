package com.mycompany;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Todo {
	@Id
        int id;
        String name;
        String msg;
        private int status;
        
        
        
        
		public int getStatus() {
			return status;
		}
		public void setStatus(int status) {
			this.status = status;
		}
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
