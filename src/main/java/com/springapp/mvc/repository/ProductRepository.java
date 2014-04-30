package com.springapp.mvc.repository;


import com.springapp.mvc.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

@Repository("productRepo")
public interface ProductRepository extends JpaRepository<Product, Long> {
    public final static String FIND_BY_MULTIPLE_CRITERIA = "select prd from Product prd where prd.name = :name or " +
            "prd.unitPrice <= :price or prd.brand = :brand or prd.currentOffer = :offer or prd.displaySize = :display";

    @Query(FIND_BY_MULTIPLE_CRITERIA)
    List<Product> findAllByMultipleCriteria(@Param("name") String name,
                                              @Param("price") BigDecimal price,
                                              @Param("brand") String brand,
                                              @Param("offer") String offer,
                                              @Param("display") int display);

    List<Product> findAllByName(String name);
    List<Product> findAllByUnitPriceLessThanOrUnitPrice(BigDecimal unitPrice, BigDecimal unitPrice2);
    List<Product> findAllByBrand(String brand);
    List<Product> findAllByCurrentOffer(String currentOffer);
    List<Product> findAllByDisplaySize(int displaySize);

    @Modifying(clearAutomatically = true)
    @Query("update Product p set p.inStockQty = ?2 where p.productId = ?1")
    int setNewProductQty(long productId, int qty);
}
