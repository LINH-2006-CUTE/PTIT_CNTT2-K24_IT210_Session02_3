package com.example.session02_2.model;

public class Student {
    private String fullName;
    private int score;

    public Student() {
    }

    public Student(String fullName, int score) {
        this.fullName = fullName;
        this.score = score;
    }

    public Student(String sv001, String nguyễnMinhAnh, String khoaHọcMáyTính, int i, double v) {
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }


}