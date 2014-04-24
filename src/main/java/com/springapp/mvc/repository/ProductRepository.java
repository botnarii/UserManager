package com.springapp.mvc.repository;


import com.springapp.mvc.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("productRepo")
public interface ProductRepository extends JpaRepository<Product, Long> {
}
