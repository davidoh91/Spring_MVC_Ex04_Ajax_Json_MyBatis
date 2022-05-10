package mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    @RequestMapping("/")
    public String index() {
        return "index"; //WEB-INF/views/index.jsp 이동한다.
    }

    @RequestMapping("/{url}")
    public void url() {}

}
