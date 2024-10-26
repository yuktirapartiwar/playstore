package com.playstore.ApplicationModule.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import com.playstore.ApplicationModule.DTO.ApplicationDTO;
import com.playstore.ApplicationModule.model.Application;
import com.playstore.ApplicationModule.repository.ApplicationRepository;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ApplicationService {
    
    @Autowired
    private ApplicationRepository applicationRepository;
    
    public ApplicationDTO createApplication(ApplicationDTO applicationDTO) {
        Application application = convertToEntity(applicationDTO);
        Application savedApplication = applicationRepository.save(application);
        return convertToDTO(savedApplication);
    }
    
    private Application convertToEntity(ApplicationDTO dto) {
        Application application = new Application();
        application.setName(dto.getName());
        application.setDescription(dto.getDescription());
        application.setReleaseDate(dto.getReleaseDate());
        application.setVersion(dto.getVersion());
        application.setGenre(dto.getGenre());
        application.setOwnerId(dto.getOwnerId());
        application.setDownloadCount(dto.getDownloadCount());
        application.setVisibility(dto.getVisibility());
        application.setUrl(dto.getUrl());
        application.setLogoUrl(dto.getLogoUrl());
        return application;
    }
    
    private ApplicationDTO convertToDTO(Application application) {
        ApplicationDTO dto = new ApplicationDTO(
            application.getId(),
            application.getName(),
            application.getDescription(),
            application.getReleaseDate(),
            application.getVersion(),
            application.getGenre(),
            application.getOwnerId(),
            application.getDownloadCount(),
            application.getVisibility(),
            application.getUrl(),
            application.getLogoUrl()
        );
        
        dto.setAverageRating(application.getAverageRating());
        return dto;
    }  

    public List<ApplicationDTO> getAllApplications() {
        List<Application> applications = applicationRepository.findAll();
        return applications.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    public ApplicationDTO updateApplication(ApplicationDTO applicationDTO) {
        Application existingApplication = applicationRepository.findById(applicationDTO.getId())
                .orElseThrow(() -> new RuntimeException("Application not found with id: " + applicationDTO.getId()));
        
        // Update the existing application's fields
        existingApplication.setName(applicationDTO.getName());
        existingApplication.setDescription(applicationDTO.getDescription());
        existingApplication.setReleaseDate(applicationDTO.getReleaseDate());
        existingApplication.setVersion(applicationDTO.getVersion());
        existingApplication.setGenre(applicationDTO.getGenre());
        existingApplication.setVisibility(applicationDTO.getVisibility());
        existingApplication.setUrl(applicationDTO.getUrl());
        existingApplication.setLogoUrl(applicationDTO.getLogoUrl());
        
        // Save the updated application
        Application updatedApplication = applicationRepository.save(existingApplication);
        return convertToDTO(updatedApplication);
    }

    public ApplicationDTO getApplicationById(Long id) {
        Application application = applicationRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("Application not found"));
        return convertToDTO(application);
    }

    public void deleteApplication(Long id) {
        Application application = applicationRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("Application not found"));
        applicationRepository.delete(application);
    }

    public List<ApplicationDTO> getAllVisibleApplications() {
        List<Application> applications = applicationRepository.findByVisibilityTrue();
        return applications.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    public void incrementDownloadCount(Long id) {
        System.out.println("Incrementing download count for application with id: " + id);
        Application application = applicationRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("Application not found"));
        application.setDownloadCount(application.getDownloadCount() + 1);
        applicationRepository.save(application);
    }

    public ApplicationDTO updateVisibility(Long id, boolean visibility) {
        Application existingApplication = applicationRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Application not found with id: " + id));
        
        existingApplication.setVisibility(visibility);
        Application updatedApplication = applicationRepository.save(existingApplication);
        return convertToDTO(updatedApplication);
    }

    public ApplicationDTO searchApplicationsByName(String name) {
        Application application = applicationRepository.findFirstByNameContainingIgnoreCaseAndVisibilityTrue(name);
        return convertToDTO(application);
    }
}
