package com.kendoui.spring.controllers.api;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kendoui.spring.models.ChartDataRepository;
import com.kendoui.spring.models.ElectricityProduction;

@Controller("dataviz-api-events-controller")
@RequestMapping(value="/dataviz/api/")
public class EventsController {
    @RequestMapping(value = "/events", method = RequestMethod.GET)
    public String index() {
        return "/dataviz/api/events";
    }
    
    @RequestMapping(value = "/events/read", method = RequestMethod.POST)
    public @ResponseBody List<ElectricityProduction> read() {
        return ChartDataRepository.SpainElectricityProduction();
    }
}
