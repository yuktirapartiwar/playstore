package com.playstore.UserModule.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.playstore.UserModule.DTO.ApplicationDTO;

import java.util.Arrays;
import java.util.List;

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
}
