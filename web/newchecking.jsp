<%-- 
    Document   : newchecking
    Created on : 8 May 2022, 09:43:06
    Author     : mutanganaedgar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                background: black;
                color: white;
            }
            .formClass {
                margin:50px 500px;
            }
        </style>
    </head>
    <body>
        <div style="margin: 10px auto;display: flex;flex-direction: row;justify-content: center;background-color: antiquewhite">
            <h1 style="font-family: sans-serif; font-size: 1.4em; color: darkblue">e-Health System created by Mutangana Edgar, 21810</h1>
        </div>
        <form class="formClass" action="Insert.jsp" method="POST">
            Identity Number: <input name="identity" placeholder="Enter your id number" /><br><br><br>
            First Name: <input name="first" placeholder="Enter your last name" /><br><br><br>
            Last Name: <input name="last" placeholder="Enter your first name" /><br><br><br>
            Weight(kg(Kilograms)): <input name="w" placeholder="Enter your weight in kg (kilograms)" /><br><br><br>
            Height(m(Meters)): <input name="h" placeholder="Enter your height in m (meters)" /><br><br><br>
            <input type="submit" name="" value="Enter Record" /><br>
        </form>
        <form class="formClass" action="healthview.jsp" method="GET">
            <input type="submit" name="" value="View All Records" /><br>
        </form>
    </body>
</html>
