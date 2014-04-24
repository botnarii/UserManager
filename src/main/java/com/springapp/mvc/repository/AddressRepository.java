package com.springapp.mvc.repository;


import com.springapp.mvc.model.Address;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository(value = "addressRepo")
public interface AddressRepository extends JpaRepository<Address, Long> {
    @Override
    void delete(Long addressID);
}
