package com.example.orderservice.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "orders") //avoid reserved keyword.
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Long productId;
    private int quantity;
    private double totalPrice;
}