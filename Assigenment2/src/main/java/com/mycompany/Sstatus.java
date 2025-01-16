package com.mycompany;

import java.io.IOException;
import java.io.PrintWriter;

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
 * Servlet implementation class Sstatus
 */
@WebServlet("/Sstatus")
public class Sstatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Sstatus() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pt = response.getWriter();
		int id = Integer.parseInt(request.getParameter("id"));
		int currentstatus =Integer.parseInt(request.getParameter("status"));
		
		
		try {
			int newstatus = (currentstatus == 0) ? 1 : 0;

			Configuration cfg = new Configuration();
			cfg.configure();

			SessionFactory sf = cfg.buildSessionFactory();
			Session sess = sf.openSession();
//	    	
			Todo st = (Todo) sess.get(Todo.class, id);
			st.setStatus(newstatus);

			Transaction tx = sess.beginTransaction();
			sess.update(st);
			tx.commit();

			sess.close();
			response.sendRedirect("index.jsp");
		} catch (Exception e) {
			// TODO: handle exception
			pt.print(e.getMessage());
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
