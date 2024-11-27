<%@page import="org.hibernate.query.Query"%>
<%@page import="com.mycompany.Todo"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Task Reminder</title>
    <style>
        body {
            padding: 0;
            margin: 0;
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h1 {
            margin-top: 20px;
            color: #333;
        }

        table {
            width: 80%;
            margin-top: 20px;
            border-collapse: collapse;
            background-color: white;
            color: #333;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #f4f4f4;
            color: #333;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        a {
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
     <div>
      <form action="Search" method="post" name="name"><input type="text" name="name" placeholder="search here">
	 <input type="submit" value="Submit......" >
		</form>
     </div>
    <h1>All Task Reminder</h1>

    <table>
        <thead>
            <tr>
                <th>No.</th>
                <th>Title</th>
                <th>Message</th>
                <th>Action</th>
                <th>Action 2</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Hibernate session and query setup
                Configuration cfg = new Configuration();
                cfg.configure(); // Configure Hibernate
                SessionFactory sf = cfg.buildSessionFactory();
                Session sess = sf.openSession();

                Query<Todo> query = sess.createQuery("FROM Todo");
                List<Todo> tasks = query.list();

                // Loop through the list and display tasks in the table
                for (Todo task : tasks) {
            %>
            <tr>
                <td><%= task.getId() %></td>
                <td><%= task.getName() %></td>
                <td><%= task.getMsg() %></td>
                <td><a href="T_Delete.jsp?id=<%= task.getId() %>">Delete</a></td>
                <td><a href="T_Update.jsp?id=<%= task.getId() %>">Edit</a></td>
            </tr>
            <%
                }
                sess.close();
            %>
        </tbody>
    </table>

</body>
</html>
