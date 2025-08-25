/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.methods.servlets.hospitalwithservlets.entity;

/**
 *
 * @author Faiyaz
 */

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false, unique = true)
    private String username;

    @Column(nullable = false)
    private String phone;
    
    @Column(nullable = false)
    private String Date_of_birth;
    
    @Column(nullable = false)
    private String password;
    
    @Column(name = "created_at")
    private LocalDateTime createdAt = LocalDateTime.now();
    
    @Column(name = "last_login")
    private LocalDateTime lastLogin;

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User(String username, String phone, String Date_of_birth) {
        this.username = username;
        this.phone = phone;
        this.Date_of_birth = Date_of_birth;
    }

    public User(String username, String phone, String Date_of_birth, String password) {
        this.username = username;
        this.phone = phone;
        this.Date_of_birth = Date_of_birth;
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

 
    
    

  

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(LocalDateTime lastLogin) {
        this.lastLogin = lastLogin;
    }

  
 
 
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDate_of_birth() {
        return Date_of_birth;
    }

    public void setDate_of_birth(String Date_of_birth) {
        this.Date_of_birth = Date_of_birth;
    }


}