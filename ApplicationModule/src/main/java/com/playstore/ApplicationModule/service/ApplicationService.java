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
        return application;
    }
    
    private ApplicationDTO convertToDTO(Application entity) {
        return new ApplicationDTO(
            entity.getId(),
            entity.getName(),
            entity.getDescription(),
            entity.getReleaseDate(),
            entity.getVersion(),
            entity.getGenre(),
            entity.getOwnerId(),
            entity.getDownloadCount(),
            entity.getVisibility(),
            entity.getUrl()
        );
    }  

}
