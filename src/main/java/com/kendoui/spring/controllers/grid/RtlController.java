package com.kendoui.spring.controllers.grid;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kendoui.spring.models.ProductDao;

@Controller("grid-rtl-controller")
@RequestMapping(value="/web/grid/")
public class RtlController {
    @Autowired 
    private ProductDao product;
    
    @RequestMapping(value = "/rtl", method = RequestMethod.GET)
    public String index(Locale locale, Model model) {
        model.addAttribute("products", product.getList());
        
        return "web/grid/rtl";
    }
}