package com.kendoui.spring.controllers.splitter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("splitter-events-controller")
@RequestMapping(value="/web/splitter/")
public class EventsController {
    
    @RequestMapping(value = {"/events"}, method = RequestMethod.GET)
    public String index() {
        return "web/splitter/events";
    }
}