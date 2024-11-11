package com.mycompany;

import java.io.IOException;
import java.io.PrintWriter;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;





import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class serv
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
		// TODO Auto-generated method stub
		PrintWriter	pw=response.getWriter();
//		pw.print("done");
		int id=Integer.parseInt(request.getParameter("id"));
		String name= request.getParameter("name");
		double percent=Double.parseDouble(request.getParameter("percent"));
		Configuration cfg=new Configuration();
		cfg.configure();
		
		org.hibernate.SessionFactory sf=cfg.buildSessionFactory();
		
		Session sess=sf.openSession();
		
		Student s=new Student();
		s.setId(id);
		s.setName(name);
		s.setPercent(percent);
		
		Transaction tx=sess.beginTransaction();
		sess.save(s);
		tx.commit();
		sess.close();
		sf.close();
		pw.print("Data Entered");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
