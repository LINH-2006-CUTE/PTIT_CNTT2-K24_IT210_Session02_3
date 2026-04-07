package com.example.session02_2.model;


public class Employee {
    private String id;
    private String name;
    private String department;
    private double salary;
    private String joinDate;
    private int status;

    public Employee(String id, String name, String department, double salary, String joinDate, int status) {
        this.id = id;
        this.name = name;
        this.department = department;
        this.salary = salary;
        this.joinDate = joinDate;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public String getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(String joinDate) {
        this.joinDate = joinDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}