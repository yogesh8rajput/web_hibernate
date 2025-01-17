<%@page import="org.hibernate.Session"%>
<%@page import="com.mycompany.Todo"%>
<%@page import="org.hibernate.Transaction"%>
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
<%

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
	
}


%>

</body>
</html>