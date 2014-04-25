package com.springapp.mvc.service;


import com.springapp.mvc.model.AddProductForm;
import com.springapp.mvc.model.Product;
import com.springapp.mvc.model.ShoppingCart;
import com.springapp.mvc.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.sql.rowset.serial.SerialBlob;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Service("productService")
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private ShoppingCart shoppingCart;

    @Override
    public ShoppingCart getShoppingCart() {
        return shoppingCart;
    }

    @Override
    @Transactional
    public Product save(Product product) {
        return productRepository.save(product);
    }

    @Override
    public List<Product> getProducts() {
        return productRepository.findAll();
    }

    @Override
    public List<Product> getRecommendations() {
        return null;
    }

    @Override
    public Product getProduct(long productId) {
        return productRepository.findOne(productId);
    }

    @Override
    public List<String> getShippingOptions() {
        return null;
    }

    @Override
    public void deleteAllProducts() {
        productRepository.deleteAll();
    }

    @Override
    public void deleteOneProduct(long productId) {
        productRepository.delete(productId);
    }

    @Override
    public Product createProductFromModel(AddProductForm article) {
        Product newProduct = null;
        Date today = new Date();
        MultipartFile imageFile = article.getImage();
        if (null != article.getImage()) {
            try {
                Blob image = getBlobData(imageFile);
                newProduct = new Product(article.getName(), article.getDescription(), article.getUnitPrice(), article.getInStockQty(), image,
                        article.getBrand(), article.getCurrentOffer(), article.getDisplaySize(), new Timestamp(today.getTime()));
            } catch (IOException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return newProduct;
    }

    public Blob getBlobData(MultipartFile file) throws IOException, SQLException {
        byte[] bytes = file.getBytes();
        return new SerialBlob(bytes);
    }
}
