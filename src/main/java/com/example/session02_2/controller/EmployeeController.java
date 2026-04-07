package com.example.session02_2.controller;

import com.example.session02_2.model.Employee;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
public class EmployeeController {
    @GetMapping("/login")
    public String showLogin() {
        return "login";
    }

    @PostMapping("/login")
    public String handleLogin(@RequestParam String username, @RequestParam String password,
                              HttpSession session, Model model) {
        if ("admin".equals(username) && "123".equals(password)) {
            session.setAttribute("user_role", "hr_manager");
            session.setAttribute("display_name", "Linh Admin");
            return "redirect:/employees";
        }
        model.addAttribute("error", "Thôngtin sai");
        return "login";
    }

    @GetMapping("/employees")
    public String listEmployees(Model model) {
        List<Employee> list = Arrays.asList(
                new Employee("NV001", "Nguyễn Thị Lan", "Kế toán", 15000000, "2020-01-01", 1),
                new Employee("NV002", "Trần Văn Nam", "Kỹ thuật", 18000000, "2021-05-15", 2),
                new Employee("NV003", "Lê Minh Kim", "Nhân sự", 12000000, "2022-11-20", 3)
        );
        model.addAttribute("empList", list);
        return "employees";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}