package com.mycompany;

import java.io.IOException;
import java.io.PrintWriter;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Serv
 */
@WebServlet("/Serv")
public class Serv extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Serv() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter pw=response.getWriter();
		//pw.println("Hello");
		
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
