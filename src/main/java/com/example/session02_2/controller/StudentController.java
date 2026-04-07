package com.example.session02_2.controller;


import com.example.session02_2.model.Student;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.*;

@Controller
public class StudentController {

    private List<Student> getMockData() {
        return Arrays.asList(
                new Student("SV001", "Nguyễn Minh Anh", "Khoa học máy tính", 3, 3.8),
                new Student("SV002", "Lê Thị Hồng Ngát", "Kế toán", 2, 3.2),
                new Student("SV003", "Trần Văn Cường", "Công nghệ thực phẩm", 4, 3.9)
        );
    }

    @GetMapping("/students")
    public String list(Model model) {
        model.addAttribute("students", getMockData());
        return "student-list";
    }

    @GetMapping("/student/{id}")
    public String card(@PathVariable String id, Model model) {
        Student find = getMockData().stream()
                .filter(s -> s.getId().equals(id))
                .findFirst()
                .orElse(null);

        model.addAttribute("student", find);
        return "student";
    }
}