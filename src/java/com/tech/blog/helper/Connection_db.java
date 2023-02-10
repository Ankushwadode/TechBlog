/**
 *
 * @author Ankush
 */
package com.tech.blog.helper;

import java.sql.*;

public class Connection_db {
    private static Connection con;
    public static Connection getConnection(){
        try{
            if(con==null){
             //load driver class
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            //creating a connection...
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","Root@123");
            
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
}
