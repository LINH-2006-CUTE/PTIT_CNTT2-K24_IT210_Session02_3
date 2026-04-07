package com.example.session02_2.controller;

import jakarta.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OrderController {

    @Autowired
    private ServletContext application;

    @GetMapping("/orders")
    public String showOrders(Model model) {
        synchronized (application) {
            Integer count = (Integer) application.getAttribute("visitCount");
            if (count == null) count = 0;
            application.setAttribute("visitCount", count + 1);
        }

        model.addAttribute("totalRevenue", 100000);
        return "orders";
    }
}