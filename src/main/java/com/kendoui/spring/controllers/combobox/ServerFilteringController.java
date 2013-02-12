package com.kendoui.spring.controllers.combobox;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kendoui.spring.models.DataSourceRequest;
import com.kendoui.spring.models.DataSourceResult;
import com.kendoui.spring.models.ProductDao;

@Controller("combobox-serverfiltering-controller")
@RequestMapping(value="/web/combobox/")
public class ServerFilteringController {
    @Autowired 
    private ProductDao product;

    @RequestMapping(value = "/serverfiltering", method = RequestMethod.GET)
    public String index() {
        return "web/combobox/serverfiltering";
    }
    
    @RequestMapping(value = "/remote-data/read", method = RequestMethod.POST)
    public @ResponseBody DataSourceResult read(@RequestBody DataSourceRequest request) {
        return product.getList(request);
    }
}