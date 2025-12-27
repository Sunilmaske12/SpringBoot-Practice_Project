package com.sunil.SCM2.services;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UploadFileService {

	public String uploadImage(MultipartFile file) {
		
		if(file == null || file.isEmpty()) {
			return null;
		}
		
	    String baseDir = "C:/Users/maske/projectFiles/scm2";

	    File dir = new File(baseDir);
	    
	    if(!dir.exists()) {
	    	dir.mkdir();
	    }
	    
	    String uniqueFileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
	    
	    File destination = new File(dir, uniqueFileName);
	    
	    try {
	    	file.transferTo(destination);
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
		
		return uniqueFileName;
	}
}
