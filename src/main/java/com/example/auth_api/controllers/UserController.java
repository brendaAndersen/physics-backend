package com.example.auth_api.controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;

@CrossOrigin
@RestController
@RequestMapping("/user")
public class UserController {
    @GetMapping()
    public ResponseEntity<String> getUser() {
        return ResponseEntity.ok("Success!");
    }
}
    
