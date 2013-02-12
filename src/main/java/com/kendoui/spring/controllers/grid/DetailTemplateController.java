package com.kendoui.spring.controllers.grid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kendoui.spring.models.DataSourceRequest;
import com.kendoui.spring.models.DataSourceRequest.FilterDescriptor;
import com.kendoui.spring.models.DataSourceResult;
import com.kendoui.spring.models.EmployeeDao;
import com.kendoui.spring.models.OrderDao;

@Controller("grid-detailtemplate-controller")
@RequestMapping(value="/web/grid/")
public class DetailTemplateController {
    @Autowired 
    private EmployeeDao employee;
    
    @Autowired 
    private OrderDao order;
    
    @RequestMapping(value = "/detailtemplate", method = RequestMethod.GET)
    public String index() {
        return "web/grid/detailtemplate";
    }
    
    @RequestMapping(value = "/detailtemplate/employees", method = RequestMethod.POST)
    public @ResponseBody DataSourceResult employees(@RequestBody DataSourceRequest request) {
        return employee.getList(request);
    }
    
    @RequestMapping(value = "/detailtemplate/orders", method = RequestMethod.POST)
    public @ResponseBody DataSourceResult orders(@RequestBody DataSourceRequest request) {        
        FilterDescriptor filter = new FilterDescriptor();
        filter.setField("employeeId");
        filter.setOperator("eq");
        filter.setValue(request.getData().get("employeeId"));        
        
        FilterDescriptor outer = new FilterDescriptor();
        outer.setLogic("and");        
        outer.getFilters().add(filter);
        
        request.setFilter(outer);
        
        return order.getList(request);        
    }      
}
