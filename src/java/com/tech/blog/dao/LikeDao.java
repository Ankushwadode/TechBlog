/**
 *
 * @author Ankush
 */
package com.tech.blog.dao;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LikeDao {

    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }

    public boolean insertLike(int pid, int uid) {
        boolean f = false;
        try {
            String query = "insert into ulike(pid,uid) values(?,?)";
            PreparedStatement ps = this.con.prepareStatement(query);
            //setting values...
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ps.executeUpdate();
            f = true;
        } catch (SQLException e) {
            Logger.getLogger(LikeDao.class.getName()).log(Level.SEVERE, null, e);
        }
        return f;
    }
//  counter for liek coutn
    public int countlike(int pid) {
        int count = 0;

        String q = "select count(*) from ulike where pid=?";
        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, pid);
            ResultSet set = p.executeQuery();
            if (set.next()) {
                count = set.getInt("count(*)");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    public boolean deletelike(int pid,int uid) {
        boolean f = false;
        try {
            PreparedStatement ps = this.con.prepareStatement("delete from ulike where pid=? and uid=?");
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ps.executeUpdate();
            f=true;
        } catch (SQLException ex) {
            Logger.getLogger(LikeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return f;
    }
//    check constrain
        public boolean isLiked(int pid, int uid) {
        boolean f = false;
        try {
            PreparedStatement ps = this.con.prepareStatement("select *from ulike where pid=? and uid=?");
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                f = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(LikeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return f;
    }
}
