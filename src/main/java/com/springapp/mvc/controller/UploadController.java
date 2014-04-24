package com.springapp.mvc.controller;

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
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;


@Controller
public class UploadController {

    @Autowired
    private ProductService productService;

    UploadItem uploadedImg;
    public UploadController(){
        System.out.println("init RestController");
        uploadedImg = new UploadItem();
    }

    @RequestMapping(value = "/addProduct")
    public String addProduct(Model model) {
        if (isAdmin()) {
            model.addAttribute("article", new Product());
            return "addProduct";
        }
        return "home";
    }

//    @RequestMapping(value = "/get/{value}", method = RequestMethod.GET)
//    public void get(HttpServletResponse response, @PathVariable String value){
//        try {
//
//            response.setContentType(ufile.type);
//            response.setContentLength(ufile.length);
//            FileCopyUtils.copy(ufile.bytes, response.getOutputStream());
//
//        } catch (IOException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        }
//    }

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String upload(@ModelAttribute("article") Product article, @RequestParam("imgfile") MultipartFile file) {
        Date today = new Date();
        if (!file.isEmpty()) {
            try {
                Blob blob = getBlobData(file);

                article.setImage(blob);
                article.setDateTime(new Timestamp(today.getTime()));
                productService.save(article);

            } catch (IOException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return "redirect:/addProduct";
    }

    @RequestMapping("/download/{fileId}")
    public String download(@PathVariable("fileId")
                           Long fileId, HttpServletResponse response) {

//        File doc = fileDao.get(fileId);
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

    public Blob getBlobData(MultipartFile file) throws IOException, SQLException {
        byte[] bytes = file.getBytes();
        return new SerialBlob(bytes);
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
