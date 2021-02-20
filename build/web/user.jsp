<%-- 
    Document   : Data
    Created on : Feb 14, 2021, 5:58:39 PM
    Author     : KIRAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "users_info";
String userid = "root";
String password = "Admin@123";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Basic Banking System</title>
         <link href="https://fonts.googleapis.com/css2?family=Sansita+Swashed:wght@700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/user.css">
    </head>
    <body>
        <div class="topnav">
           <div class="logo">
               <a class="navbar-brand"><b>Spark Bank</b></a>
           </div>
           <a href="transaction_history.jsp"><b>Transaction History</b></a>
           <a href="Transfer.jsp"><b>Transfer Money</b></a>
            <a class="active" href="user.jsp"><b>View Users</b></a>
            <a href="index.html"><b>Home</b></a>
       </div>
        <div class="container content">
            <h1><b>*Customers*</b></h1>
           
        </div>
        

<table>
<tr>
<th>ID</th>
<th>Name</th>
<th>Email Id</th>
<th>Current Balance</th>

</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from users_info";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("Id") %></td>
<td><%=resultSet.getString("Name") %></td>
<td><%=resultSet.getString("Email_Id") %></td>
<td><%=resultSet.getString("current_balance") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<div>
    <p id="data"></p>
</div>
</body>
</html>
