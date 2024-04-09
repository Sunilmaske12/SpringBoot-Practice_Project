package com.excel.excel;

import java.io.ByteArrayInputStream;
import java.io.IOException;
//import java.util.ArrayList;
import java.util.List;

//import org.apache.poi.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
//
//import com.google.gson.Gson;
//import com.google.gson.JsonObject;

import org.springframework.core.io.Resource;

@RestController
public class ProductController {
	
	@Autowired
	private ProductHelper productHelper;
	

	@PostMapping("/saveProductList")
	public String saveProductList(MultipartFile file) {
		if(file==null) {
			return "Please select file";
		}
		if(this.productHelper.validateExcelFile(file) == false) {
			return "Please upload excel file only";
		}
		try {
		 List<Product> prodList = productHelper.getProductFromExcel(file.getInputStream());
		 if(productHelper.saveProductList(prodList)) {
			return "Data uploaded successfully";
		 }
		} catch (IOException e) {
			e.printStackTrace();
		}	
		return "Error";
	}
	
	@GetMapping("/allProduct")
	public List<Product> getAllProduct(){
		return this.productHelper.getAllProducts();
	}
	
	
	@GetMapping("/downloadExcel")
	public ResponseEntity<Resource> downloadExcel(){
		
		List<Product> allProd = this.productHelper.getAllProducts();
		
		String fileName = "productExcel.xlsx";
		ByteArrayInputStream actualData = this.productHelper.dataToExcel(allProd);
		InputStreamResource file=new InputStreamResource(actualData);
		
		ResponseEntity<Resource> body = ResponseEntity.ok()
			.header(HttpHeaders.CONTENT_DISPOSITION, 
					"attachment; filename="+fileName)
			.contentType(MediaType.parseMediaType("application/vnd.ms-excel"))
			.body(file);
		return body;
		
	}
	
//	String testing() {
//		try {
//			int i = 10/0;
//			List<Product> p=this.productHelper.getAllProducts();
//			JsonObject jo=new JsonObject();
//			Gson g=new Gson();
//			jo.addProperty("p1", g.toJson(p));
//			
//			JsonObject jsonObject=new JsonObject();
//			 jsonObject.add("arrayList", jo);
//			 return g.toJson(jsonObject);
//			
//		}catch(Exception e) {
//			return  "ERROR : "+ e.getMessage();
//		}
//		
//		
//	}
	
//	@GetMapping("/t")
//	void testing2() {
//		String  s = this.testing();
//		System.out.println(s);
//		if(s.contains("ERROR")) {
//			System.out.println("error");
//			
//		}else {
//			System.out.println("no error");
//		}
//	}
	
	
	
//	MResponse mResponse = mWebServiceUtil.get(ModuleConstant.MEDNET, "/api/otBilling/loadPatientDataForOTScheduler", null, queryParamsMap);
//
//    if (mResponse != null && mResponse.getResponseCode() == 200 && StringUtils.isNotBlank(mResponse.getData()) && !StringUtils.contains(mResponse.getData(), "ERROR")) {
//        return Clazz.getObjectMapper().readValue(mResponse.getData(), JSONObject.class);
//    } else if(StringUtils.contains(mResponse.getData(), "ERROR ")) {
//        throw new Exception(mResponse.getData());
//    } else {
//        throw new Exception("ERROR Something went wrong !!");
//    }
	
	
	
	
	
	
	
	
	
	
	
	
	
}
