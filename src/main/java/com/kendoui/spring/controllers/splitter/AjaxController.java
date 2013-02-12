package com.kendoui.spring.controllers.splitter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("splitter-ajax-controller")
@RequestMapping(value="/web/splitter/")
public class AjaxController {
    
    @RequestMapping(value = {"/ajax"}, method = RequestMethod.GET)
    public String index() {
        return "web/splitter/ajax";
    }
    
    @RequestMapping(value = "/content/{page}", method = RequestMethod.GET)
    public String content(@PathVariable int page) {       
        return "web/splitter/content" + page;
    }
}