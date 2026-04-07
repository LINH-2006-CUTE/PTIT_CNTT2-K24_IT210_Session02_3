Mã nguồn lỗi bài 1 :
File 1: MyWebAppInitializer.java
package com.demo.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class MyWebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    protected Class<?>[] getRootConfigClasses() {
        return null;
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class<?>[] { WebConfig.class };
    }

    // LỖI ở đây — Servlet Mapping bị đặt sai
    @Override
    protected String[] getServletMappings() {
        return new String[] { "/api/*" };   // ← Chú ý dòng này
    }

}

File 2: WebConfig.java
package com.demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.demo.service")  // ← Chú ý dòng này
public class WebConfig {

    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        return resolver;
    }

}

File 3: WelcomeController.java
package com.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WelcomeController {

    @GetMapping("/welcome")
    public String showWelcome(Model model) {
        model.addAttribute("staffName", "Nguyễn Văn An");
        model.addAttribute("department", "Phòng Kỹ thuật");
        return "welcome";   // ViewResolver phải ghép: /WEB-INF/views/welcome.jsp
    }

}
Ghi chú thêm: File welcome.jsp đã tồn tại đúng vị trí tại /WEB-INF/views/welcome.jsp. Hãy tập trung vào code Java và cấu
hình.

* Lỗi 1 :
  vì trong MyWebAppInitializer.java có return new String[] { "/api/*" }
  mà DispatcherServlet chỉ nhận /api/ nên khi truy cập http://localhost:8080/context-path/welcome sẽ không tìm thấy
  nên trình duyệt báo 404 Not Found
  *Lỗi 2 :
  Tại WebConfig.java có @ComponentScan(basePackages = "com.demo.service") nên spring sẽ tìm các Bean trong service
  nên spring k tìm được WelcomeController, không tìm thấy URL /welcome

** sửa bài : MyWebAppInitializer,WebConfig