package com.playstore.AdminModule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.playstore.AdminModule.DTO.ApplicationDTO;
import com.playstore.AdminModule.service.ApplicationService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/api/admin/applications")
public class ApplicationRestController {
    
    @Autowired
    private ApplicationService applicationService;
    
    @PostMapping("/{id}/visibility")
    public ResponseEntity<String> toggleVisibility(@PathVariable Long id, 
                                                 @RequestParam boolean visibility,
                                                 HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("Admin") != null) {
            try {
                ApplicationDTO app = applicationService.getApplicationById(id);
                app.setVisibility(visibility);
                applicationService.updateApplication(app);
                return ResponseEntity.ok("Visibility updated successfully");
            } catch (Exception e) {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                                   .body("Failed to update visibility: " + e.getMessage());
            }
        }
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                           .body("Unauthorized access");
    }
}
