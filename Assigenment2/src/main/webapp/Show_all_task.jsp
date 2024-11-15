<%@page import="org.hibernate.query.Query"%>
<%@page import="com.mycompany.Todo"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.*" %>
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
<title>Show_All</title>
<style>
body{
      color:wheat;
      background: black;
}
</style>
</head>
<body>

<h1>All Task Reminder</h1>
<table border="3">
<tr>
<td>No.</td>
<td>Title_Name</td>
<td>Message </td>
<td>Action </td>
<td>Action_2 </td>
</tr>
<%
      Configuration cfg=new Configuration();
      cfg.configure();
      SessionFactory sf=cfg.buildSessionFactory();
      Session sess=sf.openSession();
      
      Query q=sess.createQuery("From Todo");
      List<Todo> li =q.list();
      
      for(Todo d:li)
      {
    	  %>
    	  <tr><td><%= d.getId()%></td>
    	 
    	 <td><%= d.getName()%></td>
    	 <td><%= d.getMsg()%></td>
    	 
    	 <td>
    	 <a href="T_Delete.jsp?id=<%= d.getId()%>">Delete</a>
    	 </td>
    	 <td><a href="T_Update.jsp?id=<%= d.getId()%>">Edit!!!</a></td>
    	 </tr>
    	  
    	  <% 
    	  
      }
     
      
      %>
      

</table>
</body>
</html>


</body>
</html>