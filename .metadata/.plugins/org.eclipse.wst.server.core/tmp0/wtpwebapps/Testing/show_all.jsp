<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="com.mycompany.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show_All</title>
<style>
body{
      color:white;
      background: yellow;
}
</style>
</head>
<body>

<h1>All Viewers</h1>
<table border="2">
<tr>
<td>Rollno</td>
<td>Name</td>
<td>Percent</td>
</tr>
<%
      Configuration cfg=new Configuration();
      cfg.configure();
     SessionFactory sf=cfg.buildSessionFactory();
      Session sess=sf.openSession();
      
      Query q=sess.createQuery("From Student");
      List<Student> li =q.list();
      for(Student st:li)
      {
    	  %>
    	  <tr><td><%= st.getId()%></td>
    	 
    	 <td><%= st.getName()%></td>
    	 <td><%= st.getPercent()%></td>
    	 </tr>
    	  
    	  <% 
      }
      
      %>
      

</table>
</body>
</html>