package com.springapp.mvc.controller;

import com.springapp.mvc.model.AddProductForm;
import com.springapp.mvc.model.Product;
import com.springapp.mvc.model.UploadItem;
import com.springapp.mvc.service.ProductService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;


@Controller
public class ProductsController {

    @Autowired
    private ProductService productService;

    UploadItem uploadedImg;
    public ProductsController(){
        System.out.println("init RestController");
        uploadedImg = new UploadItem();
    }

    @RequestMapping(value = "/productManagement", method = RequestMethod.GET)
    public String addProduct(Model model) {
        model.addAttribute("productForm", new AddProductForm());
        if (isAdmin()) {
            return "productManagement";
        }
        return "home";
    }

    @RequestMapping(value = "/productManagementt/{value}", method = RequestMethod.GET)
    public String get(Model model, @PathVariable String value){
        if (value.equals("error")) {
            model.addAttribute("imgError", "Bad image file!");
            model.addAttribute("imgSuccess", "");
        } else if (value.equals("noerror")){
            model.addAttribute("imgSuccess", "Uploaded Successfully!");
            model.addAttribute("imgError", "");
        } else {
            model.addAttribute("imgSuccess", "");
            model.addAttribute("imgError", "");
        }
        return "redirect:/productManagement";
    }

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String upload(@Valid @ModelAttribute("productForm") AddProductForm product, BindingResult result, @RequestParam("imgfile") MultipartFile file) {

        if (file.isEmpty() || file.getSize() == 0) {
            result.rejectValue("image", "product.form.badimg");
            return "productManagement";
        } else {
            product.setImage(file);
        }
        if (result.hasErrors()) {
            System.out.println("has errors!");
            return "productManagement";
        } else {
            System.out.println("has no errors!");
            Product newProduct = productService.createProductFromModel(product);
            if (null != newProduct) {
                productService.save(newProduct);
            }
            return "redirect:/productManagement/noerror";
        }
    }

    @RequestMapping(value = "/search-product", method = RequestMethod.POST)
    public String loadProductsOnCriteria(@Valid @ModelAttribute AddProductForm article, Model model) {
        productService.findProductsFromModel(article);
        return "productManagement";
    }

    @RequestMapping("/download/{fileId}")
    public String download(@PathVariable("fileId") Long fileId, HttpServletResponse response) {
        Product product = productService.getProduct(fileId);
        Blob doc = product.getImage();

        try {
            response.setHeader("Content-Disposition", "inline;filename=\"" + product.getName() + "\"");
            OutputStream out = response.getOutputStream();
            response.setContentType("image/png");
            IOUtils.copy(doc.getBinaryStream(), out);
            out.flush();
            out.close();

        } catch (IOException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    private boolean isAdmin() {
        boolean isUserAdmin = false;
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        for (GrantedAuthority authority : auth.getAuthorities()) {
            if ("ROLE_ADMIN".equals(authority.getAuthority())) {
                isUserAdmin = true;
                break;
            }
        }
        return isUserAdmin;
    }

}