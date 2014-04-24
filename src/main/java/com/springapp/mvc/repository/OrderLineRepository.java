package com.springapp.mvc.repository;


import com.springapp.mvc.model.OrderLine;
import com.springapp.mvc.model.OrderLineId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("OrderLineRepo")
public interface OrderLineRepository extends JpaRepository<OrderLine, OrderLineId> {

    public final static String FIND_BY_ORDERID_QUERY = "select ol from OrderLine ol where ol.pk.order.id = :id";

    @Query(FIND_BY_ORDERID_QUERY)
    List<OrderLine> findAllByOrderId(@Param("id") long id);
}
