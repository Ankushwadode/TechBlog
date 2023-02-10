package com.tech.blog.entities;

import java.sql.Timestamp;

/**
 *
 * @author Ankush
 */
public class User {
    private int id;
    private String name;
    private String email;
    private String password;
    private String gender;
    private String phoneno;
    private Timestamp datetime;
    private String profile;

    public User(int id, String name, String email, String password, String gender, String phoneno, Timestamp datetime ,String profile) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.phoneno = phoneno;
        this.datetime = datetime;
        this.profile = profile;
    }

    public User() {
        
    }

    public User(String name, String email, String password, String gender, String phoneno) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.phoneno = phoneno;
    }
    
//    getters and setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhoneno() {
        return phoneno;
    }

    public void setPhoneno(String phoneno) {
        this.phoneno = phoneno;
    }

    public Timestamp getDatetime() {
        return datetime;
    }

    public void setDatetime(Timestamp datetime) {
        this.datetime = datetime;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
    
}
