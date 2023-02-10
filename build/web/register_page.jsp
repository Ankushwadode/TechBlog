<%-- 
    Document   : register_page
    Created on : 20-Aug-2022, 6:28:05 pm
    Author     : Ankush
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REGISTER_PAGE</title>
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
        <!-- JS Bootstrap4 -->
        <script
            src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
            crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="JS/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

        <!-- navbar -->
        <%@include file="normal_navbar.jsp" %>

        <div class="clip">
            <main class="primary-background" style="padding-bottom:85px;">
                <div class="container">
                    <div class="col-md-6 offset-md-3">
                        <div class="card">
                            <div class="card-header text-center primary-background text-white">
                                <span class="fa-3x fa fa-user-circle"></span><br>
                                Register Here...
                            </div>
                            <div class="card-body">
                                <form action="RegisterServlet" method="post" id="reg_form">
                                    <div class="form-group">
                                        <label for="user_name">User</label>
                                        <input type="text" name="user_name" class="form-control" id="user_name"  placeholder="Enter name">
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" name="user_email" class="form-control" id="user_email" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>

                                    <div class="form-group">
                                        <label for="phone">Enter a phone number</label><br>
                                        <input type="tel" name="user_phone" class="form-control" id="user_phone" name="phone" placeholder="123-45-678" required><br>
                                        <small>Format: 123-45-678</small> 
                                    </div>                                    

                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" name="user_password" class="form-control" id="user_password" placeholder="Password">
                                    </div>

                                    <div class="form-group">
                                        <label for="gender">Select Gender</label><br>
                                        <input type="radio"  id="gender" name="gender" value="male"> Male
                                        <input type="radio"  id="gender" name="gender" value="female"> Female
                                    </div>

                                    <div class="form-check">
                                        <input type="checkbox"  name="check"  class="form-check-input" id="checkbox">
                                        <label class="form-check-label" for="exampleCheck1">Agree Terms and Conditions.</label>
                                    </div>

                                    <br>
                                    <div class="container text-center" id="loader" style="display: none;">
                                        <span class="fa fa-refresh fa-spin fa-2x"></span><br>
                                        <h3>Please Wait...</h3>
                                    </div>
                                    <button id="submit_btn" type="submit" class="btn btn-primary">Submit</button>

                                </form>                                
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <script>
                $(document).ready(function () {
                    console.log("loaded");
                    $('#reg_form').on('submit', function (event) {
                        event.preventDefault();

                        let form = new FormData(this);
                        $("#submit_btn").hide();
                        $("#loader").show();

                        //sending to register servlet
                        $.ajax({
                            url: "RegisterServlet"
                            , type: 'post'
                            , data: form
                            , success: function (data, textStatus, jqXHR) {
                                console.log(data);

                                $("#submit_btn").show();
                                $("#loader").hide();

                                if (data.trim() === 'done') {
                                    swal("Registered successfully... Redirecting to login page.")
                                            .then((value) => {
                                                window.location = "login_page.jsp";
                                            });
                                }else{
                                    swal(data);
                                }
                            }
                            , error: function (jqXHR, textStatus, errorThrown) {

                                $("#submit_btn").show();
                                $("#loader").hide();
                                swal("Something went wrong... Please try again.");

                            }
                            , processData: false
                            , contentType: false
                        });
                    });
                });
        </script>
    </body>
</html>
