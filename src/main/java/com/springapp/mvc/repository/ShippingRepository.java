package com.springapp.mvc.repository;


import com.springapp.mvc.model.Shipping;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("ShippingRepo")
public interface ShippingRepository extends JpaRepository<Shipping, Long> {
}
