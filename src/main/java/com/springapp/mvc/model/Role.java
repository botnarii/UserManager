package com.springapp.mvc.model;



public enum Role {
    ROLE_USER("ROLE_USER"),
    ROLE_ADMIN("ROLE_ADMIN");

    private String role;

    Role(String role_user) {
        this.role = role_user;
    }



    public String getRole() {
        return role;
    }


}
