package com.kendoui.spring.controllers.bubblecharts;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kendoui.spring.models.ChartDataRepository;
import com.kendoui.spring.models.CrimeData;

@Controller("dataviz-bubble_charts_remote_data-controller")
@RequestMapping(value="/dataviz/bubble-charts/")
public class RemoteDataController {
    @RequestMapping(value = "/remote-data", method = RequestMethod.GET)
    public String index() {
        return "/dataviz/bubble-charts/remote-data";
    }
    
    @RequestMapping(value = "/remote-data/read", method = RequestMethod.POST)
    public @ResponseBody List<CrimeData> read() {
        return ChartDataRepository.CrimeStats();
    }
}
