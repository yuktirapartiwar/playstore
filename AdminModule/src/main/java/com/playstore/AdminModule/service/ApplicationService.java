package com.playstore.AdminModule.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.playstore.AdminModule.DTO.ApplicationDTO;

@Service
public class ApplicationService {
    
    @Value("${application.service.url}")
    private String applicationServiceUrl;
    
    @Autowired
    private RestTemplate restTemplate;
    
    public ApplicationDTO addApplication(ApplicationDTO applicationDTO) {
        String url = applicationServiceUrl + "/api/applications";
        return restTemplate.postForObject(url, applicationDTO, ApplicationDTO.class);
    }

    public List<ApplicationDTO> getAllApplications() {
        String url = applicationServiceUrl + "/api/applications";
        ResponseEntity<ApplicationDTO[]> response = restTemplate.getForEntity(url, ApplicationDTO[].class);
        return Arrays.asList(response.getBody());
    }
}
