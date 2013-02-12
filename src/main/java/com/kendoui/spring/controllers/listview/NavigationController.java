package com.kendoui.spring.controllers.listview;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kendoui.spring.models.DataSourceRequest;
import com.kendoui.spring.models.DataSourceResult;
import com.kendoui.spring.models.Product;
import com.kendoui.spring.models.ProductDao;

@Controller("listview-navigation-controller")
@RequestMapping(value="/web/listview/")
public class NavigationController {
    @Autowired 
    private ProductDao product;
    
    @RequestMapping(value = "navigation", method = RequestMethod.GET)
    public String index() {        
        
        return "web/listview/navigation";
    }
    
    @RequestMapping(value = "/navigation/read", method = RequestMethod.POST)
    public @ResponseBody DataSourceResult read(@RequestBody DataSourceRequest request) {

        return product.getList(request);
    }
    
    @RequestMapping(value = "/navigation/update", method = RequestMethod.POST)
    public @ResponseBody Product update(@RequestBody Map<String, Object> model) {
        Product target = new Product();
        
        target.setProductId((Integer)model.get("productId"));
        target.setProductName((String)model.get("productName"));
        target.setUnitPrice(Double.parseDouble(model.get("unitPrice").toString()));
        target.setUnitsInStock((Integer)model.get("unitsInStock"));
        target.setDiscontinued((Boolean)model.get("discontinued"));        
        
        product.saveOrUpdate(target);
        
        return target;
    }
    
    @SuppressWarnings("serial")
    @RequestMapping(value = "/navigation/create", method = RequestMethod.POST)
    public @ResponseBody Map<String,Object> create(@RequestBody Map<String, Object> model) {
        final Product target = new Product();
        
        target.setProductName((String)model.get("productName"));
        target.setUnitPrice(Double.parseDouble(model.get("unitPrice").toString()));
        target.setUnitsInStock((Integer)model.get("unitsInStock"));
        target.setDiscontinued((Boolean)model.get("discontinued"));        
        
        product.saveOrUpdate(target);        
        
        
        return new HashMap<String, Object>() {{
            put("data", target);
        }};      
    }
    
    @RequestMapping(value = "/navigation/destroy", method = RequestMethod.POST)
    public @ResponseBody Product destroy(@RequestBody Map<String, Object> model) {
        Product target = new Product();
        
        target.setProductId((Integer)model.get("productId"));
        
        product.delete(target);
        
        return target;
    }    
}

