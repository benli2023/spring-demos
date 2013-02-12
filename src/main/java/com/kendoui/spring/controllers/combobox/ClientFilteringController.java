package com.kendoui.spring.controllers.combobox;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kendoui.spring.models.ProductDao;

@Controller("combobox-clientfiltering-controller")
@RequestMapping(value="/web/combobox/")
public class ClientFilteringController {
    @Autowired 
    private ProductDao product;

    @RequestMapping(value = "/clientfiltering", method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("products", product.getList());
        return "web/combobox/clientfiltering";
    }
}