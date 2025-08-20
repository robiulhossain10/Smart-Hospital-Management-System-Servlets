package com.methods.servlets.hospitalwithservlets.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "patient")
public class Patient {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;
    private int age;
    private String gender;
    private String contact;
    private String disease;

    public Patient() {}

    public Patient(String name, int age, String gender, String contact, String disease) {
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.contact = contact;
        this.disease = disease;
    }

    // Getters & Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }
    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }
    public String getContact() { return contact; }
    public void setContact(String contact) { this.contact = contact; }
    public String getDisease() { return disease; }
    public void setDisease(String disease) { this.disease = disease; }
}
