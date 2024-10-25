package com.playstore.ApplicationModule.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.playstore.ApplicationModule.DTO.ApplicationDTO;
import com.playstore.ApplicationModule.service.ApplicationService;

@RestController
@RequestMapping("/api/applications")
public class ApplicationController {
    
    @Autowired
    private ApplicationService applicationService;
    
    @PostMapping
    public ResponseEntity<ApplicationDTO> createApplication(@RequestBody ApplicationDTO applicationDTO) {
        try {
            ApplicationDTO createdApp = applicationService.createApplication(applicationDTO);
            return new ResponseEntity<>(createdApp, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping
    public ResponseEntity<List<ApplicationDTO>> getAllApplications() {
        try {
            List<ApplicationDTO> applications = applicationService.getAllApplications();
            return new ResponseEntity<>(applications, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<ApplicationDTO> updateApplication(@PathVariable Long id, @RequestBody ApplicationDTO applicationDTO) {
        try {
            applicationDTO.setId(id);
            ApplicationDTO updatedApp = applicationService.updateApplication(applicationDTO);
            return new ResponseEntity<>(updatedApp, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<ApplicationDTO> getApplicationById(@PathVariable Long id) {
        try {
            ApplicationDTO application = applicationService.getApplicationById(id);
            return new ResponseEntity<>(application, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteApplication(@PathVariable Long id) {
        try {
            applicationService.deleteApplication(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
