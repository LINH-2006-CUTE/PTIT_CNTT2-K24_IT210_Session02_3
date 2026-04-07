package com.example.session02_2.model;

public class Student {
    private String id;
    private String name;
    private String major;
    private int year;
    private double gpa;

    public Student(String id, String name, String major, int year, double gpa) {
        this.id = id;
        this.name = name;
        this.major = major;
        this.year = year;
        this.gpa = gpa;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getMajor() {
        return major;
    }

    public int getYear() {
        return year;
    }

    public double getGpa() {
        return gpa;
    }
}