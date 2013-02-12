package com.kendoui.spring.controllers.scattercharts;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("dataviz-scatter_charts-scatter_line-controller")
@RequestMapping(value="/dataviz/scatter-charts/")
public class ScatterLineController {
    @RequestMapping(value = "/scatter-line", method = RequestMethod.GET)
    public String index() {
        return "/dataviz/scatter-charts/scatter-line";
    }
}
