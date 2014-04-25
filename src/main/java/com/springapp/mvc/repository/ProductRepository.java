package com.springapp.mvc.repository;


import com.springapp.mvc.model.OrderLine;
import com.springapp.mvc.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

@Repository("productRepo")
public interface ProductRepository extends JpaRepository<Product, Long> {
    public final static String FIND_BY_ORDERID_QUERY = "select prd from Product prd where prd.name = :name or " +
            "prd.unitPrice <= :price or prd.brand = :brand or prd.currentOffer = :offer or prd.displaySize = :display";

    @Query(FIND_BY_ORDERID_QUERY)
    List<OrderLine> findAllByMultipleCriteria(@Param("name") String name,
                                              @Param("price") BigDecimal price,
                                              @Param("brand") String brand,
                                              @Param("offer") String offer,
                                              @Param("display") int display);
}
