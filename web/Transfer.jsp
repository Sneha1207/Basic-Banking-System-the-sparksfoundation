<%-- 
    Document   : Transfer.jsp
    Created on : Feb 17, 2021, 10:30:01 PM
    Author     : KIRAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*" %>
<%

String driver = "com.mysql.jdbc.Driver";
String userid = "root";
String password = "Admin@123";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection con = null;
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
           <a class="active" href="Transfer.jsp"><b>Transfer Money</b></a>
           <a href="user.jsp"><b>View Users</b></a>
            <a href="index.html"><b>Home</b></a>
       </div>
        <div class="hero-content1">
            
           <form name=Form1 method="Post" action="">
               <label for = "Sender" > Transfer From:</label>
               <select name="from">
                   <option value="Sneha">Sneha</option>
                   <option value="Shubham">Shubham</option>
                   <option value="Disha">Disha</option>
                   <option value="Sejal">Sejal</option>
                   <option value="gauri">Gauri</option>
                   <option value="Ankita">Ankita</option>
                   <option value="Krutika">Krutika</option>
                   <option value="Neha">Neha</option>
                   <option value="Anaya">Anaya</option>
                   <option value="Sarika">Sarika</option>
               </select>
               <br><br>
               <label for = "Sender">Transfer Amount:</label>
               <input type="text" name="amount">
               <br><br>
            <label for = "Sender"> Transfer To:</label>
               <select name="to">
                   <option value="Sneha">Sneha</option>
                   <option value="Shubham">Shubham</option>
                   <option value="Disha">Disha</option>
                   <option value="Sejal">Sejal</option>
                   <option value="gauri">Gauri</option>
                   <option value="Ankita">Ankita</option>
                   <option value="Krutika">Krutika</option>
                   <option value="Neha">Neha</option>
                   <option value="Anaya">Anaya</option>
                   <option value="Sarika">Sarika</option>
               </select>
            <br><br>
            <input class = "butt but"type="submit" value="Send Money" onclick="Alert()">
        
         <%
             
             String Name1 = request.getParameter("from");
             String num=request.getParameter("amount");
             int iamount = 0;
             try{
                 iamount =Integer.parseInt(num);
             }catch(NumberFormatException e){
                 }
	    
             String Name2 = request.getParameter("to");
             try{
               con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users_info", userid, password);
               statement=con.createStatement();
               resultSet = statement.executeQuery("select current_balance from users_info where Name='"+ Name1 +"'");
               int balance1 = 0;
               while(resultSet.next()){
                   balance1=resultSet.getInt("current_balance");
               }
               
               resultSet = statement.executeQuery("select current_balance from users_info where Name='"+ Name2 +"'"); 
               int balance2 = 0;
               while(resultSet.next()){
               balance2 = resultSet.getInt("current_balance");
                  }
               int bal1=balance1-iamount;
               int bal2=balance2+iamount;
               statement.addBatch("update users_info set current_balance=" + bal1 + " where Name='"+ Name1 +"'");
               statement.addBatch("update users_info set current_balance="+ bal2 +" where Name='"+ Name2 +"'");
               statement.executeBatch();
               
             
             }
             catch (Exception e) {
             e.printStackTrace();
             }
             if(Name1!=null && Name2!=null && num!=null){
                 if(Name1!="" && Name2!="" && num!="") {
             try{
                 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users_info", userid, password);
                 Statement st=con.createStatement();
                 int i = 0;
                 try{
                 i = st.executeUpdate("insert into trans_history(Sender, Receiver, Amount)values('" +Name1+ "','" +Name2+ "','" +iamount+ "')");
                 }catch(NumberFormatException e){
                     }
                
             }catch(Exception e){
               e.printStackTrace();
                       
             }
             finally{
                 con.close(); 
             }
                 }}
             %>
             </table>
             <script>
                 function Alert(){
                     alert('transaction successful');
}
</script>
        </div>

        
    </body>
</html>
