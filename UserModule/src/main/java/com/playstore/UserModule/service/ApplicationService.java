package com.playstore.UserModule.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriUtils;

import com.playstore.UserModule.DTO.ApplicationDTO;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;
import java.util.ArrayList;

@Service
public class ApplicationService {

    @Value("${application.service.url}")
    private String applicationServiceUrl;

    @Autowired
    private RestTemplate restTemplate;

    public List<ApplicationDTO> getAllVisibleApplications() {
        String url = applicationServiceUrl + "/api/applications/visible";
        ResponseEntity<ApplicationDTO[]> response = restTemplate.getForEntity(url, ApplicationDTO[].class);
        return Arrays.asList(response.getBody());
    }

    public ApplicationDTO getApplicationById(Long id) {
        String url = applicationServiceUrl + "/api/applications/" + id;
        return restTemplate.getForObject(url, ApplicationDTO.class);
    }

    public void incrementDownloadCount(Long id) {
        String url = applicationServiceUrl + "/api/applications/" + id + "/download";
        restTemplate.postForObject(url, null, Void.class);
    }

    public ApplicationDTO searchApplicationsByName(String query) {
        String url = applicationServiceUrl + "/api/applications/search?name=" + query;
        ResponseEntity<ApplicationDTO> response = restTemplate.getForEntity(url, ApplicationDTO.class);
        return response.getBody();
    }

    public List<ApplicationDTO> getApplicationsByGenre(String genre) {
        try {
            System.out.println("Fetching applications for genre: " + genre);
            System.out.println("Service URL: " + applicationServiceUrl);
            
            String url = applicationServiceUrl + "/applications/genre/" + genre;
            System.out.println("Full URL: " + url);
            
            ResponseEntity<ApplicationDTO[]> response = restTemplate.getForEntity(url, ApplicationDTO[].class);
            System.out.println("Response status: " + response.getStatusCode());
            
            if (response.getBody() != null) {
                return Arrays.asList(response.getBody());
            }
            return new ArrayList<>();
            
        } catch (Exception e) {
            System.out.println("Error in ApplicationService: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Failed to fetch applications: " + e.getMessage());
        }
    }
}
