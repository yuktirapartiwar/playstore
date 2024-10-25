package com.playstore.AdminModule.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
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

    public ApplicationDTO getApplicationById(Long id) {
        String url = applicationServiceUrl + "/api/applications/" + id;
        return restTemplate.getForObject(url, ApplicationDTO.class);
    }

    public ApplicationDTO updateApplication(ApplicationDTO applicationDTO) {
        String url = applicationServiceUrl + "/api/applications/" + applicationDTO.getId();
        return restTemplate.exchange(
            url, 
            HttpMethod.PUT, 
            new HttpEntity<>(applicationDTO), 
            ApplicationDTO.class
        ).getBody();
    }

    public void deleteApplication(Long id) {
        String url = applicationServiceUrl + "/api/applications/" + id;
        restTemplate.delete(url);
    }

    public ApplicationDTO updateVisibility(Long id, boolean visibility) {
        String url = applicationServiceUrl + "/api/applications/" + id + "/visibility?visibility=" + visibility;
        return restTemplate.exchange(
            url, 
            HttpMethod.PUT, 
            null, 
            ApplicationDTO.class
        ).getBody();
    }
}
