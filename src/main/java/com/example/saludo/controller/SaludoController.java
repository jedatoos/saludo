package com.example.saludo.controller;



import org.springframework.web.bind.annotation.*;

import java.util.Map;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api")
public class SaludoController {

    @GetMapping("/saludo")
    public Map<String, String> saludo() {
        return Map.of(
                "mensaje", "Hola 👋 este mensaje viene desde Spring Boot"
        );
    }
}

