<%-- 
    Document   : healthview
    Created on : 8 May 2022, 08:51:37
    Author     : mutanganaedgar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*" %>
<% Class.forName("com.mysql.cj.jdbc.Driver");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>eHealth | View Health information</title>
        <link rel="stylesheet" href="./style.css"/>
    </head>
    <body>
        <div style="margin: 10px auto;display: flex;flex-direction: row;justify-content: center;background-color: antiquewhite">
            <h1 style="font-family: sans-serif; font-size: 1.4em; color: darkblue">e-Health System created by Mutangana Edgar, 21810</h1>
        </div>
        <%
            try {
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ehealthdb?autoReconnect=true&useSSL=false","root","ibaraza23798");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from citizens");
            
        %>
        <table border="1">
            <thead>
                <tr>
                    <td>Names(Last,First)</td>
                    <td>Height</td>
                    <td>Weight</td>
                    <td>BMI</td>
                    <td>Health Condition</td>
                </tr>
            </thead>
            <tbody>
                <%while(rs.next()){ %>
                <% 
                            double bmi = 0.0;
                            Double height = Double.valueOf(rs.getString(5));
                            Integer weight = Integer.valueOf(rs.getString(4));
                            Double newWeight = Double.valueOf(weight);
                            bmi = (newWeight)/(height*height);
                           
                            String healthCondition = "";
                            if(bmi<18.5) {
                                healthCondition = "Underweight";
                            }
                            if(18.5<=bmi && bmi<25.0) {
                                healthCondition = "Normal";
                            }
                            if(25.0<=bmi && bmi<30.0) {
                                healthCondition = "Overweight";
                            }
                            if(bmi>=30.0) {
                                healthCondition = "Obese";
                            }
                     %>
                <tr>
                    <td><%out.println(rs.getString(2));%><%out.println(rs.getString(3));%></td>
                    <td><%out.println(rs.getString(5));%>m</td>
                    <td><%out.println(rs.getString(4));%>kg</td>
                    <td><%
                        Double sBmi = Double.valueOf(bmi);
                        //out.println(sBmi.shortValue());
                        out.println(sBmi);
                    %></td>
                    <td><%out.println(healthCondition);%></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <%
            }catch(Exception ex) {
                  out.println(ex.getMessage());
            }
        %>
        <br><br><br>
        <form class="formClass" action="newchecking.jsp" method="GET">
            <input type="submit" name="" value="Insert New Record" /><br>
        </form>
    </body>
</html>
