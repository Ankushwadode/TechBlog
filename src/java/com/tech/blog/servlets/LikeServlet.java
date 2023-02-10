package com.tech.blog.servlets;

/**
 *
 * @author Ankush
 */
import com.tech.blog.dao.LikeDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.Connection_db;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LikeServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String operation = request.getParameter("operation");
            int uid = Integer.parseInt(request.getParameter("uid"));
            int pid = Integer.parseInt(request.getParameter("pid"));

//            out.println("data from servlet");
//            out.println(operation);
//            out.println(uid);
//            out.println(pid);
            LikeDao ld = new LikeDao(Connection_db.getConnection());
            if (ld.isLiked(pid, uid)) {
                boolean f=ld.deletelike(pid, uid);
                out.println(f);
            } else if(operation.equals("like")) {
                boolean f=ld.insertLike(pid, uid);
                out.println(f);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
