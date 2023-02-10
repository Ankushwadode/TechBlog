package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.Connection_db;
import com.tech.blog.helper.Help;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Ankush
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");

            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
//fetch all data
            String userName = request.getParameter("user_name");
            String userEmail = request.getParameter("user_email");
            String userPassword = request.getParameter("user_password");
            String userPhone = request.getParameter("user_phone");
            Part part = request.getPart("image");
            String imageName = part.getSubmittedFileName();

//getting user from the session
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");
            user.setName(userName);
            user.setEmail(userEmail);
            user.setPassword(userPassword);
            user.setPhoneno(userPhone);
            String oldfile=user.getProfile();
            user.setProfile(imageName);

//update database...
            UserDao userDao = new UserDao(Connection_db.getConnection());
            boolean ans = userDao.updateUser(user);
            if (ans) {
                String path = request.getRealPath("/") + "pic" + File.separator  + user.getProfile();
//delete file...
                String oldpath = request.getRealPath("/") + "pic" + File.separator +oldfile;
                if(!oldfile.equals("default.png")){
                    Help.deletefile(oldpath);
                }
                if (Help.savefile(part.getInputStream(), path)) {
                    
                    Message msg = new Message("Profile details updated...", "success", "alert-success");
                    s.setAttribute("msg", msg);
                } else {
                    Message msg = new Message("Profile details updated....", "success", "alert-success+");
                    s.setAttribute("msg", msg);
                }
            } else {
                out.println("not updated to db");
                Message msg = new Message("Something went wrong...", "error", "alert-danger");
                s.setAttribute("msg", msg);
            }
            response.sendRedirect("Profile.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
