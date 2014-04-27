package com.springapp.mvc.service;


import com.springapp.mvc.model.AddProductForm;
import com.springapp.mvc.model.Product;
import com.springapp.mvc.model.SearchModel;
import com.springapp.mvc.model.ShoppingCart;
import com.springapp.mvc.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.sql.rowset.serial.SerialBlob;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.*;

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

    @Override
    public List<Product> findProductsFromModel(SearchModel searchQuery) {
        /**Input declaration*/
        String name = searchQuery.getName();
        BigDecimal price = searchQuery.getUnitPrice();
        String brand = searchQuery.getBrand();
        String offer = searchQuery.getCurrentOffer();
        int display = searchQuery.getDisplaySize();

        /**Unsorted collections */
        List<Product> productsSortedByName = new ArrayList<Product>();
        List<Product> productsSortedByPrice = new ArrayList<Product>();
        List<Product> productsSortedByBrand = new ArrayList<Product>();
        List<Product> productsSortedByOffer = new ArrayList<Product>();
        List<Product> productsSortedByDisplay = new ArrayList<Product>();
        List<Product> allSortedProducts = new ArrayList<Product>();

        /**Validation*/
        if (!name.isEmpty()) {
            productsSortedByName = productRepository.findAllByName(name);
        }
        if (null != price) {
            productsSortedByPrice = productRepository.findAllByUnitPriceLessThanOrUnitPrice(price, price);
        }
        if (!brand.isEmpty()) {
            productsSortedByBrand = productRepository.findAllByBrand(brand);
        }
        if (!offer.isEmpty()) {
            productsSortedByOffer = productRepository.findAllByCurrentOffer(offer);
        }
        if (display != 0) {
            productsSortedByDisplay = productRepository.findAllByDisplaySize(display);
        }

        /**Group all together */
        allSortedProducts.addAll(productsSortedByName);
        allSortedProducts.addAll(productsSortedByPrice);
        allSortedProducts.addAll(productsSortedByBrand);
        allSortedProducts.addAll(productsSortedByOffer);
        allSortedProducts.addAll(productsSortedByDisplay);

        removeDuplicateWithOrder(allSortedProducts);
        return allSortedProducts;
    }

    @SuppressWarnings("unchecked")
    public static void removeDuplicateWithOrder(List<Product> list) {
        Set set = new HashSet();
        List newList = new ArrayList();
        for (Object element : list) {
            if (set.add(element))
                newList.add(element);
        }
        list.clear();
        list.addAll(newList);
    }
}
