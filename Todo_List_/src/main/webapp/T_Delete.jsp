<%@page import="org.hibernate.Transaction"%>
<%@page import="com.mycompany.Todo"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	delete
	<%
     int t_id = Integer.parseInt(request.getParameter("id"));
	  //String i=request.getParameter("t_id");
     Configuration cfg = new Configuration();
     cfg.configure();
     SessionFactory sf = cfg.buildSessionFactory();
     Session sess = sf.openSession();
     Todo t=new Todo();
     t.setId(t_id);
     Transaction tx=sess.beginTransaction();
 	sess.delete(t);
 	tx.commit();
 	//System.out.println("Deleted");
     response.sendRedirect("index.jsp");
     
     
%>
       <a href="Show_all_task.jsp">Home</a>
</body>
</html>