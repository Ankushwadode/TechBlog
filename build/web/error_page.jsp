<%-- 
    Document   : error_page
    Created on : 21-Aug-2022, 11:42:25 am
    Author     : Ankush
--%>

<%@page isErrorPage="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Something went wrong...</title>
        
        <!-- CSS Bootstrap4 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .clip{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 90%, 72% 100%, 32% 90%, 0 100%, 0 0);
            }
        </style>
        
    </head>
    <body>
        <div class="container text-center">
            <img src="img/error.png" alt="error_img" class="img-fluid" width="400" height="200"/>
            <h3 class="display-3">Sorry! Something went wrong....</h3>
            <%=exception%>
            <a href="index.jsp" class="btn primary-background text-white btn-lg mt-3">Home</a>
        </div>
    </body>
</html>
