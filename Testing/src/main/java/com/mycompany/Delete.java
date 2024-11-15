package com.mycompany;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.annotation.WebServlet;

/**
 * Servlet implementation class Delete
 */
@WebServlet(name = "Deletee", urlPatterns = { "/Deletee" })
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Delete() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String id = request.getParameter("id");
	      int did=Integer.parseInt(id);
			Configuration cfg=new Configuration();
			cfg.configure();
			SessionFactory sf=cfg.buildSessionFactory();
			Session sess=sf.openSession();
			//Query q=sess.createQuery("from Student");
			//Student s=sess.get(Student.class, id);
			
		Student s = new Student();
		s.setId(did);
			Transaction tx=sess.beginTransaction();
	    	sess.delete(s);
	    	tx.commit();
	}


}
