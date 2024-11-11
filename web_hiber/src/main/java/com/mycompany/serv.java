package com.mycompany;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.module.Configuration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.hibernate.*;

import org.hibernate.Transaction;

/**
 * Servlet implementation class serv
 */
@WebServlet("/serv")
public class serv extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public serv() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	PrintWriter	pw=response.getWriter();
	pw.print("done");
	
	int roll=Integer.parseInt(request.getParameter("roll"));
	String name=request.getParameter("name");
	float per=Float.parseFloat(request.getParameter("percent"));
	
	 Configuration cfg=new Configuration();
     cfg.configure();
     
     SessionFactory sf=cfg.buildSessionFactory();
     
     Session sess=sf.openSession();
  
     
     Student s=new Student();
     s.setRoll(roll);
     s.setName(name);
     s.setPercent(per);
  
     
  Transaction tx=sess.beginTransaction();
  
  sess.save(s);//persistent state
    
  tx.commit();
  sess.close();//detached state
    	sf.close();
    	pw.println("done");



}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
