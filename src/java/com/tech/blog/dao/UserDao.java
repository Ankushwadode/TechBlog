/**
 *
 * @author Ankush
 */
package com.tech.blog.dao;

import java.sql.*;
import com.tech.blog.entities.User;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDao {

    private final Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    //method to insert User data in database
    public boolean saveUser(User user) {
        boolean f = false;
        try {
            //user-->datanase
            String query = "insert into user(name,email,password,gender,phone) values(?,?,?,?,?)";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getGender());
            ps.setString(5, user.getPhoneno());

            ps.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    //get user by email and passeword
    public User getUserByEmailAndPassword(String email, String password) {

        User user = null;
        try {
            String query = "select *from user where email=? and password=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);

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
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    //update user
    public boolean updateUser(User user) {
        boolean f = false;
        try {
            String query = "update user set name=? ,email=? , password=? , gender=? , phone=? , profile=? where id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getGender());
            ps.setString(5, user.getPhoneno());
            ps.setString(6, user.getProfile());
            ps.setInt(7, user.getId());

            ps.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public User getUserByPostId(int userId) {
        User user = null;

        String query = "select *form user where id=?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
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
