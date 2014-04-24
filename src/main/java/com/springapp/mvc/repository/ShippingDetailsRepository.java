package com.springapp.mvc.repository;


import com.springapp.mvc.model.ShippingDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("ShippingDetailsRepo")
public interface ShippingDetailsRepository extends JpaRepository<ShippingDetails, Long> {

}
