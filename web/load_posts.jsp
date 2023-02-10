<%-- 
    Document   : load_posts
    Created on : 03-Sep-2022, 8:49:28 am
    Author     : Ankush
--%>

<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.Connection_db"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<div class="row">
    <%
        User u = (User) session.getAttribute("currentUser");
        Thread.sleep(1000); //only use it on local hosting 
        PostDao d = new PostDao(Connection_db.getConnection());
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> post = null;
        if (cid == 0) {
            post = d.getAllPost();
        } else {
            post = d.getPostBycid(cid);
        }
        if (post.size() == 0) {
            out.println("<h4 class='display-3 text-center'>No Post Available Currently In This Category...</h4>");
            return;
        }
        for (Post p : post) {
    %>

    <div class="col-md-6 mt-2">
        <div class="card">
            <img class="card-img-top" src="blog_pic/<%= p.getPpic()%>" alt="Card image cap" height="250px">
            <div class="card-body">
                <h4><%= p.getPtitle()%></h4>
                <p><%= p.getPcontent()%></p>
            </div>

            <div class="card-footer primary-background text-center">
                <% LikeDao ld = new LikeDao(Connection_db.getConnection());%>
                <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= u.getId()%>)" class="btn btn-outline-light btn-sm"> <i class="fa fa-thumbs-up"></i> <span class="like-counter"><%= ld.countlike(p.getPid())%></span> </a>
                <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-comment-o"></i><span> </span></a>&nbsp;
                <a href="blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light btn-sm">More...</a>
            </div>
        </div>
    </div>

    <%
        }
    %>
</div>