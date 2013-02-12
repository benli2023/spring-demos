package com.kendoui.spring.controllers.treeview;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("treeview-navigation-controller")
@RequestMapping(value="/web/treeview/")
public class NavigationController {
    
    @RequestMapping(value = {"/navigation"}, method = RequestMethod.GET)
    public String index() {       
        return "web/treeview/navigation";
    }    
}