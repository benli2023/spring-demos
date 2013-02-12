package com.kendoui.spring.controllers.timepicker;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("timepicker-events-controller")
@RequestMapping(value="/web/timepicker/")
public class EventsController {
    
    @RequestMapping(value = {"/events"}, method = RequestMethod.GET)
    public String index() {       
        return "web/timepicker/events";
    }
}