package com.kendoui.spring.models;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.kendoui.spring.models.DataSourceRequest.FilterDescriptor;

@Transactional
@Component
public class OrderDaoImpl implements OrderDao {
    @Autowired
    private SessionFactory sessionFactory;
    
    
    @Override
    public DataSourceResult getList(DataSourceRequest request) {
        return request.toDataSourceResult(sessionFactory.getCurrentSession(), Order.class);
    }

    @Override
    public List<?> getListByProductId(DataSourceRequest request) {
        FilterDescriptor filter = request.getFilter().getFilters().get(0);
        
        return sessionFactory.getCurrentSession()
                      .createSQLQuery("select o.* from [ORDER DETAILS] od join ORDERS o on o.OrderID = od.OrderID where ProductID = :productId")
                      .addEntity(Order.class)
                      .setParameter(filter.getField(), filter.getValue())
                      .list();
    }    
}