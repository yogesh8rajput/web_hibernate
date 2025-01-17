package com.mycompany;

import java.io.IOException;
import java.io.PrintWriter;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Todo_update
 */
@WebServlet("/Todo_update")
public class Todo_update extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Todo_update() {
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
	protected void doPost(HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pt=response.getWriter();
		pt.print("yes");
		int id =Integer.parseInt(request.getParameter("id"));
		String na=request.getParameter("name");
		String ms=request.getParameter("msg");
		try {
			Configuration cfg=new Configuration();
			cfg.configure();
			SessionFactory sf=cfg.buildSessionFactory();
			Session sess=sf.openSession();
			
			
			Todo t =new Todo();
	        t.setId(id);
			t.setName(na);
			t.setMsg(ms);
			Transaction tx=sess.beginTransaction();
			sess.update(t);
			tx.commit();
			
			sess.close();
			
			sf.close();
			response.sendRedirect("index.jsp");
//			pt.print("Data Entered");
		} catch (Exception e) {
			// eTODO: handle exception
			pt.print(e.getMessage());
		}
	}

}
