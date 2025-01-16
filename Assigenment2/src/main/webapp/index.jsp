<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <style>
        /* General body styles */
        body {
            font-family: Arial, sans-serif;
           
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            text-align: center;
        }

        h1 {
            margin-bottom: 20px;
            color: #0277BD; /* Blue */
        }

        /* Link styles */
        a {
            color: #0277BD;
            text-decoration: none;
            font-size: 18px;
            margin: 10px;
            display: inline-block;
        }

        a:hover {
            text-decoration: none;
        }

        /* Container for the links and form */
        .container {
            background-color: wheat; /* Green */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 500px;
        }

        /* Search form styles */
        .search-form {
            margin-top: 20px;
        }

        .search-form input[type="text"] {
            padding: 10px;
            width: 80%;
            margin-right: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .search-form input[type="submit"] {
            padding: 10px 20px;
            margin-top:20px;
            background-color: #0277BD;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .search-form input[type="submit"]:hover {
            background-color: #01579B;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Welcome to Task Manager</h1>

        <!-- Navigation Links -->
        <div>
            <a href="Insert.jsp">Insert Task</a>
            <a href="Show_all_task.jsp">All Tasks</a>
        </div>

        <!-- Search Form -->
        <form action="Search" method="post" class="search-form">
            <input type="text" name="name" placeholder="Search tasks..." required>
            <input type="submit" value="Search">
        </form>
    </div>
    
     <%@include file="Show_all_task.jsp"%>

</body>
</html>
