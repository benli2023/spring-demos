package com.kendoui.spring.controllers.window;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("window-home-controller")
@RequestMapping(value="/web/window/")
public class IndexController {    
    
    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String index() {
        return "web/window/index";
    }
    
    @RequestMapping(value = {"/popup"}, method = RequestMethod.GET)
    public String popup() {
        return "web/window/popup";
    }
}

