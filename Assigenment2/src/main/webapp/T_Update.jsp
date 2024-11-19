<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="com.mycompany.Todo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Task</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 20px;
        }

        .container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: auto;
        }

        h1 {
            text-align: center;
            color: #007bff;
        }

        .input-field {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 1em;
        }

        .input-field:focus {
            border-color: #007bff;
            outline: none;
        }

        .submit-btn {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1.1em;
            cursor: pointer;
        }

        .submit-btn:hover {
            background-color: #0056b3;
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            text-decoration: none;
            color: #007bff;
            font-size: 1.1em;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Update Task</h1>

        <form action="Todo_update" method="post">
            <%
                // Retrieve the task ID from the URL parameters
                int t_id = Integer.parseInt(request.getParameter("id"));

                // Hibernate session setup
                Configuration cfg = new Configuration().configure();
                SessionFactory sessionFactory = cfg.buildSessionFactory();
                Session sess = sessionFactory.openSession();

                // Retrieve the Todo object based on the provided task ID
                Query<Todo> query = sess.createQuery("FROM Todo WHERE id = :na", Todo.class);
                query.setParameter("na", t_id);
                List<Todo> todoList = query.list();

                // Iterate through the Todo list and populate the form with the current task data
                for (Todo todo : todoList) {
            %>

            <!-- Pre-filled form fields with current task data -->
            <input type="hidden" name="id" value="<%= todo.getId() %>">
            <input type="text" name="name" class="input-field" placeholder="Task Title" value="<%= todo.getName() %>" required>
            <input type="text" name="msg" class="input-field" placeholder="Task Message" value="<%= todo.getMsg() %>" required>

            <input type="submit" value="Update Task" class="submit-btn">

            <% 
                }
                  // Ensure the session is closed after use
            %>
        </form>
    </div>

    <div class="back-link">
        <!-- Links to navigate back to the task management pages -->
        <a href="Insert.jsp">Insert New Task</a> | 
        <a href="Show_all_task.jsp">View All Tasks</a>
    </div>

</body>
</html>
