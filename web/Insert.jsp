<%-- 
    Document   : Insert
    Created on : 8 May 2022, 09:51:13
    Author     : mutanganaedgar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*" %>
<% Class.forName("com.mysql.cj.jdbc.Driver");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ehealthdb?autoReconnect=true&useSSL=false","root","ibaraza23798");
                Statement st = con.createStatement();
                if(request.getParameter("identity").isEmpty() || request.getParameter("first").isEmpty() || request.getParameter("last").isEmpty() || request.getParameter("w").isEmpty() || request.getParameter("h").isEmpty()) {
                    out.println("Failed to record health information, please check that all values are entered because all values are required.");
                }else {
                    Integer idNo = Integer.valueOf(request.getParameter("identity"));
                String first = request.getParameter("first");
    
                String last = request.getParameter("last");
                Integer w = Integer.valueOf(request.getParameter("w"));
                Double h = Double.valueOf(request.getParameter("h"));
                
                 double bmi = 0.0;
                 Double newWeight = Double.valueOf(w);
                 bmi = (newWeight)/(h*h);
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
                
                
                st.execute("insert into citizens values('"+idNo+"','"+first+"','"+last+"','"+w+"','"+h+"','"+healthCondition+"')");
        out.println("Health Information recorded");
                }
                
                }catch(Exception ex) {
                  out.println(ex.getMessage());
            }
            %>
            <form class="formClass" action="newchecking.jsp" method="GET">
            <input type="submit" name="" value="Insert New Record" /><br>
        </form>
            <form class="formClass" action="healthview.jsp" method="GET">
            <input type="submit" name="" value="View All Records" /><br>
        </form>
    </body>
</html>
