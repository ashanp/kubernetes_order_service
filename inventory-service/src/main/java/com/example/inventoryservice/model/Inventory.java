package com.example.inventoryservice.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;
import org.springframework.stereotype.Component;

@Component
@Entity
@Data
public class Inventory {

    @Id
    private Long id;
    private int quantity;
}
