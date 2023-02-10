<%-- 
    Document   : index
    Created on : 19-Aug-2022, 8:36:13 pm
    Author     : Ankush
--%>
<%@page import="java.sql.*"%>
<%@page import="com.tech.blog.helper.Connection_db" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Index_page</title>
    <!-- CSS Bootstrap4 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <!-- JS Bootstrap4 -->
    <script
        src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="JS/myjs.js" type="text/javascript"></script>

    <!<!-- normal_navebar -->
    <%@include file="normal_navbar.jsp" %>

    <!-- Banner -->
    <div class="clip" sizes="21vw">
        <div class="container-fluid m-0 p-0">
            <div class="jumbotron primary-background text-white">
                <div class="container">
                    <h3 class="display-3">Welcome to TechBlog</h3>
                    <p>A programming language is any set of rules that converts strings, 
                        or graphical program elements in the case of visual programming languages, 
                        to various kinds of machine code output.[citation needed] Programming languages 
                        are one kind of computer language, and are used in computer programming to implement algorithms.
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="card text-center text-dark">
        <div class="card-publish" style="background-image:url('img/Tiny content.jpg');">
            <div class="card-body">
                <h3 class="card-title-publish display-4">Publish your passions, your way</h3>
                <div class="card-text-publish">
                    <p class="card-text">
                        Create a unique and beautiful blog easily <br>
                        Get tones of categories to explore and post on<br>
                        Express your ideas views and contribute to community.
                    </p>
                </div>
                <a href="register_page.jsp" class="btn btn-outline-primary btn-lg"><span class="fa fa-caret-square-o-right"></span> Create Your Post!</a>
            </div>
        </div>
    </div>

    <div class="card text-center">
        <div class="card-know" style="background-image:url('img/audience2.jpg');">
            <div class="card-body">
                <h3 class="card-title-know display-4">Know your audience</h3>
                <div class="card-text-know">
                    <p class="card-text">
                        Find out which posts are a hit with Blogger’s built-in<br>
                        analytics. You’ll see where your audience is coming from and<br> 
                        what they’re interested in. You can even connect your blog<br>
                        directly to Google Analytics for a more detailed look.
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="card text-center">
        <div class="card-join" style="background-image: url('img/community.jpg')">
            <div class="card-body">
                <h3 class="card-title-join display-4">Join millions of others</h3>
                <div class="card-text-join">
                    <p class="card-text">
                        Whether sharing your expertise, breaking news,or<br>
                        whatever’s on your mind, you’re in good company on<br> 
                        Blogger.Sign up to discover why millions of people have<br>
                        published their passions here.
                    </p>
                </div>
            </div>
        </div>
    </div>
</body>