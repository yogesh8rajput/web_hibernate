<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert page</title>
<style>
    body {
        background-color: #f5f5f5; /* Light wheat background */
        font-family: Arial, sans-serif;
        color: #333;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    
    .container {
        background-color: #fff; /* White background for form */
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        width: 300px;
    }
    
    h2 {
        text-align: center;
        color: #4682B4; /* Steel blue */
    }
    
    form {
        display: flex;
        flex-direction: column;
    }
    
    input[type="text"], textarea {
        margin: 10px 0;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 16px;
    }

    input[type="text"]:focus, textarea:focus {
        outline: none;
        border-color: #4682B4; /* Highlight border on focus */
    }
    
    textarea {
        resize: none;
        height: 120px;
    }

    input[type="submit"] {
        background-color: #4682B4; /* Blue background */
        color: white;
        border: none;
        padding: 12px;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    
    input[type="submit"]:hover {
        background-color: #5a8fb1; /* Lighter blue on hover */
    }
</style>
</head>
<body>

<div class="container">
    <h2>Insert Todo</h2>
    <form action="Todo_insert" method="post">
        <input type="text" name="id" placeholder="Title____">
        <input type="text" name="name" placeholder=" Your Title Name">
        <textarea rows="2" cols="3" name="msg"></textarea>
        <input type="submit" value="OK">
    </form>
</div>

</body>
</html>
