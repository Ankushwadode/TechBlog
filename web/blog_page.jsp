<%@page import="com.tech.blog.dao.LikeDao"%>
<%-- 
    Document   : More_page.jsp
    Created on : 03-Sep-2022, 8:03:41 pm
    Author     : Ankush
--%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.Connection_db"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp"%>

<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>

<%
    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao pd = new PostDao(Connection_db.getConnection());

    Post p = pd.getPostByUserId(postId);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getPtitle()%>-TechBlog</title>

        <!-- CSS Bootstrap4 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .clip{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 90%, 72% 100%, 32% 90%, 0 100%, 0 0);
            }

            .post-title{
                font-weight: 100;
                font-size: 28px;
            }

            .post-content{
                font-weight: 100;
                font-size: 18px;
            }

            .post-date{
                font-style: italic;
                font-weight: bold;
            }

            .post-user-info{
                font-size: 18px;
            }

            body{
                background: url(img/blog-2.jpeg);
                background-size: cover;
                background-attachment: fixed;
            }
        </style> 
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="JS/myjs.js" type="text/javascript"></script>
        <script>
                $(document).ready(function () {
                    let editStatus = false;
                    $('#edit-profile-botton').click(function () {
                        if (editStatus === false) {
                            $("#profile-details").hide();
                            $("#profle-edit").show();
                            editStatus = true;
                            $(this).text("Back");
                        } else {
                            $("#profile-details").show();
                            $("#profle-edit").hide();
                            editStatus = false;
                            $(this).text("Edit");
                        }
                    });
                });
        </script>

        <!--add post js-->
        <script>
            $(document).ready(function (e) {
                $("#add-post-form").on("submit", function (event) {
                    //code is called when form is submit
                    event.preventDefault();
                    console.log("you clicked submit button");
                    let Form = new FormData(this);
                    //requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: Form,
                        success: function (data, textStatus, jqXHR) {
                            //request success...
                            console.log(data);
                            if (!data === false) {
                                swal("Done!", "Posted", "success");
                            } else {
                                swal("Unsuccessfully!", "Something went wrong...", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //request error...
                            swal("Unsuccessfully!", "Something went wrong...", "error");
                        },
                        processData: false
                        , contentType: false
                    });
                });
            });
        </script>

        <!--loading post using ajax-->


        <!-- navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span> Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="Profile.jsp"><span class="fa fa-cogs"></span> Learn Code<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-check-square-o"></span> Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming language</a>
                            <a class="dropdown-item" href="#">Project Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structure</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-address-book-o"></span> Contact Us.</a>
                    </li>   
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-pencil-square-o"></span> Post</a>
                    </li>   
                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user-circle-o"></span> <%=user.getName()%></a>
                    </li>  
                    <li class="nav-item">
                        <a class="nav-link" href=LogoutServlet> <span class="fa fa-sign-out"></span> Log Out.</a>
                    </li>  
                </ul>
            </div>
        </nav>
        <!-- end of navbar -->

        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>
        <div class="alert <%=m.getCssClass()%>" role="alert">
            <%= m.getContent()%>
        </div>
        <%
                session.removeAttribute("msg");
            }
        %>

        <!--main content of the body-->
        <div class="container">
            <div class="row my-3">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header primary-background text-white">
                            <h4 class="post-title"><%= p.getPtitle()%></h4>
                        </div>
                        <div class="card-body">
                            <img class="card-img-top my-2" src="blog_pic/<%= p.getPpic()%>" alt="Card image cap">
                            <div class="row my-2 row-user">
                                <div class="col-md-8">
                                    <p class="post-user-info">Posted By:-<a href="#!"><%= pd.getUserByUserId(p.getUserid()).getName()%></a></p>
                                </div>
                                <div class="col-md-4">
                                    <p class="post-date">&nbsp;&nbsp;&nbsp;&nbsp;<%= DateFormat.getDateTimeInstance().format(p.getPdate())%></p>
                                </div>
                            </div>
                            <p class="post-content"><%= p.getPcontent()%></p><br>
                            <div class="post-code">
                                <pre><%= p.getPcode()%></pre>
                            </div>
                        </div>
                        <div class="card-footer primary-background">
                            <%LikeDao ld = new LikeDao(Connection_db.getConnection());%>
                            <a href="#!" onclick="dolike(<%= p.getPid()%>,<%= user.getId()%>)" class="btn btn-outline-light btn-sm"> <i class="fa fa-thumbs-up"></i> <span><%= ld.countlike(p.getPid())%></span> </a>
                            <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-comment-o"></i><span> </span></a>&nbsp;
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--end of main content of the body-->

        <!-- Profile model -->
        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-center text-white">
                        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="Pic/<%= user.getProfile()%>" width="150" height="150" class="img-fluid"/><br>
                            <h5 class="modal-title" id="exampleModalLabel"><%= user.getName()%></h5>
                            <div id="profile-details">
                                <!--details table-->
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <th scope="row">Registration Date:</th>
                                            <td><%= user.getDatetime().toString()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">ID:</th>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Email:</th>
                                            <td><%= user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender:</th>
                                            <td><%= user.getGender().toUpperCase()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Phone No:</th>
                                            <td><%= user.getPhoneno()%></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!--profile edit--> 
                            <div id="profle-edit" style="display: none">
                                <h3 class="mt-2">Edit Profile</h3>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>Change Profile Picture:</td>
                                            <td><input type="file" name="image" class="form-control"></td>
                                        </tr>
                                        <tr>
                                            <td>ID:</td>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Name:</td>
                                            <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Email:</td>
                                            <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Password</label>
                                            </td>
                                            <td>
                                                <input type="password"  name="user_password"  class="form-control"  aria-describedby="passwordHelpInline" value="<%= user.getPassword()%>" >
                                                <small id="passwordHelpInline" class="text-muted">
                                                    Please enter password again and must be 8-20 characters long.
                                                </small>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Gender:</td>
                                            <td><%= user.getGender().toUpperCase()%></td>
                                        </tr>
                                        <tr>
                                            <td>Phone No:</td>
                                            <td><input type="phone" class="form-control" name="user_phone" value="<%= user.getPhoneno()%>"></td>
                                        </tr>
                                    </table>
                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!--end of detail table-->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-botton" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>
        <!--end of profile model-->

        <!--start of model-->
        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Post Details...</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-form" action="AddPostServlet" method="post">
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>--Select--</option>
                                    <% PostDao postd = new PostDao(Connection_db.getConnection());
                                        ArrayList<Category> list = postd.getAllCategorys();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getCname()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text" name="ptitle" placeholder="Enter title here..." class="form-control"/>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" name="pcontent" style="height: 200px"  placeholder="Enter Content here..."></textarea>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" name="pcode" style="height: 200px"  placeholder="Enter Code here (if any)"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Choose Pic/file: </label>
                                <input type="file" name="pic" />
                            </div>
                            <div class="container text-center">
                                <button class="btn-outline-primary" type="submit">Post</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--end of post model-->
    </body>
</html>
