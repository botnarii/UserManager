package com.springapp.mvc.repository;


import com.springapp.mvc.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("customRepository")
public interface CustomerRepository extends JpaRepository<Customer, Long> {

    Customer findByEmail(String email);
    Customer findByUsername(String username);
    Customer findByUsernameAndPassword(String username, String password);
}
