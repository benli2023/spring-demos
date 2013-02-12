package com.kendoui.spring.controllers.panelbar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("panelbar-ajax-controller")
@RequestMapping(value="/web/panelbar/")
public class AjaxController {
    
    @RequestMapping(value = "/ajax", method = RequestMethod.GET)
    public String index() {       
        return "web/panelbar/ajax";
    }
    
    @RequestMapping(value = "/content/{page}", method = RequestMethod.GET)
    public String content(@PathVariable int page) {       
        return "web/panelbar/content" + page;
    }
}