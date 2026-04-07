package com.example.session02_2.controller;


import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

    @PostMapping("/login")
    public String handleLogin(@RequestParam String username,
                              @RequestParam String password,
                              HttpSession session,
                              Model model) {

        if ("admin".equals(username) && "123456".equals(password)) {
            session.setAttribute("user", "Administrator");
            return "redirect:/orders";
        } else {
            model.addAttribute("error", "Thông tin sai");
            return "login";
        }
    }
}