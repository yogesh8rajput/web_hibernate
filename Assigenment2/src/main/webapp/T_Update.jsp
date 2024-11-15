<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.mycompany.Todo"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
</head>
<body><form action="Todo_Update" method="post">
<pre>
<% int t_id = Integer.parseInt(request.getParameter("id")); 
Configuration cfg=new Configuration();
cfg.configure();
SessionFactory sf=cfg.buildSessionFactory();
Session sess=sf.openSession();

Query q=sess.createQuery("From Todo where id=:na");
q.setParameter("na",t_id);
List<Todo> li =q.list();

for(Todo d:li)
{

%>

<input type="text" name="id" placeholder="Title____" value="<%out.print(t_id);%>">
<input type="text" name="name" placeholder=" Your  Title_Name" value="<%=d.getName()%>">
 
<textarea rows="6" cols="10" name="msg"  value="<%=d.getMsg()%>"> Msg</textarea>


<input type="submit" value="ok"> 

</pre>
</form>
<% }%>


<a href="Insert.jsp">Insert</a>
<a href="Show_all_task.jsp">All_Task</a>

</body>


</body>
</html>