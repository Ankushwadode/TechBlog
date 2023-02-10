 /**
 *
 * @author Ankush
 */
package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategorys() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            String query = "select *from categories";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                int cid = rs.getInt("cid");
                String cname = rs.getString("cname");
                String cdescription = rs.getString("cdescription");
                Category c = new Category(cid, cname, cdescription);
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean savepost(Post p) {
        boolean f = false;
        try {
            String query = "insert into post(ptitle,pcontent,pcode,ppic,cid,userid) values(?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareCall(query);
            ps.setString(1, p.getPtitle());
            ps.setString(2, p.getPcontent());
            ps.setString(3, p.getPcode());
            ps.setString(4, p.getPpic());
            ps.setInt(5, p.getCid());
            ps.setInt(6, p.getUserid());
            ps.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
//getting all the post    

    public List<Post> getAllPost() {
        List<Post> list = new ArrayList();
        //fetching all the post
        try {
            PreparedStatement ps = con.prepareStatement("select *from post order by pid desc");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int pid = rs.getInt("pid");
                String ptitle = rs.getString("ptitle");
                String pcontent = rs.getString("pcontent");
                String pcode = rs.getString("pcode");
                String ppic = rs.getString("ppic");
                Timestamp pdate = rs.getTimestamp("pdate");
                int cid = rs.getInt("cid");
                int userid = rs.getInt("userid");
                Post p = new Post(pid, ptitle, pcontent, pcode, ppic, pdate, cid, userid);

                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Post> getPostBycid(int cid) {
        List<Post> list = new ArrayList();
        //fetching post by ID
        //fetching all the post
        try {
            PreparedStatement ps = con.prepareStatement("select *from post where cid=?");
            ps.setInt(1, cid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int pid = rs.getInt("pid");
                String ptitle = rs.getString("ptitle");
                String pcontent = rs.getString("pcontent");
                String pcode = rs.getString("pcode");
                String ppic = rs.getString("ppic");
                Timestamp pdate = rs.getTimestamp("pdate");
                int userid = rs.getInt("userid");
                Post p = new Post(pid, ptitle, pcontent, pcode, ppic, pdate, cid, userid);

                list.add(p);
            }
        } catch (SQLException e) {
            Logger.getLogger(PostDao.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public Post getPostByUserId(int PostId) {

        Post post = null;
        String query = "select *from post where pid=?";
        PreparedStatement ps;
        try {
            ps = this.con.prepareStatement(query);
            ps.setInt(1, PostId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int pid = rs.getInt("pid");
                String ptitle = rs.getString("ptitle");
                String pcontent = rs.getString("pcontent");
                String pcode = rs.getString("pcode");
                String ppic = rs.getString("ppic");
                Timestamp pdate = rs.getTimestamp("pdate");
                int cid = rs.getInt("cid");
                int userid = rs.getInt("userid");
                post = new Post(pid, ptitle, pcontent, pcode, ppic, pdate, cid, userid);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return post;
    }

    public User getUserByUserId(int userId) {
        User user = null;
        try {
            String query = "select *from user where id=?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                //data from db
                String name = rs.getString("name");
                //set data to user object
                user.setName(name);
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setPhoneno(rs.getString("phone"));
                user.setGender(rs.getString("gender"));
                user.setDatetime(rs.getTimestamp("info"));
                user.setProfile(rs.getString("profile"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

}
