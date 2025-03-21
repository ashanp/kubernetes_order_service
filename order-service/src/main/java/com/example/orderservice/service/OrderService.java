package com.example.orderservice.service;

import com.example.orderservice.model.Order;
import com.example.orderservice.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private RestTemplate restTemplate;

    private final String PRODUCT_CATALOG_URL = "http://product-catalog-service-svc.default.svc.cluster.local:8081/productcatalog/";
    private final String INVENTORY_URL = "http://inventory-service-svc.default.svc.cluster.local:8080/inventory/";
    private final String INVENTORY_URL_1 = "http://inventory-service-svc.default.svc.cluster.local:8080/inventory";

    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }

    public Optional<Order> getOrderById(Long id) {
        return orderRepository.findById(id);
    }

    public Order createOrder(Order order) {
        ResponseEntity<Map> productResponse = restTemplate.getForEntity(PRODUCT_CATALOG_URL + order.getProductId(), Map.class);
        ResponseEntity<Map> inventoryResponse = restTemplate.getForEntity(INVENTORY_URL + order.getProductId(), Map.class);

        if (productResponse.getStatusCode().is2xxSuccessful() && inventoryResponse.getStatusCode().is2xxSuccessful()) {
            // Logic to check inventory and update it
            Map inventoryBody = inventoryResponse.getBody();
            int currentQuantity = (int)inventoryBody.get("quantity");
            int orderedQuantity = order.getQuantity();
            if (currentQuantity >= orderedQuantity) {
                int newQuantity = currentQuantity - orderedQuantity;
                Map<String, Object> updatedInventory = Map.of("id",order.getProductId(),"quantity", newQuantity);
                restTemplate.put(INVENTORY_URL_1, updatedInventory);
                return orderRepository.save(order);
            }
            else {
                //insufficient Quantity
                return null;
            }
        }
        return null;
    }

    public void deleteOrder(Long id) {
        orderRepository.deleteById(id);
    }
}