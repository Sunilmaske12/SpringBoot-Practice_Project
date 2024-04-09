package com.excel.excel;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
public class ProductHelper {
	
	@Autowired
	private ProductRepo productRepo;
	
	//validation file type excel
	public boolean validateExcelFile(MultipartFile file) {		
		String contentType = file.getContentType();
		System.out.println(contentType);
		if(contentType.equals("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")) {
			return true;
		}		
		return false;
	}
	
	//reading excel file and giving list<product>
	public List<Product> getProductFromExcel(InputStream is){
		
		List<Product> listProd = new ArrayList<Product>();
		
		try {
			
			//creating object of XSSWorkBook
			XSSFWorkbook workbook=new XSSFWorkbook(is);
			
			//getting pericular sheet
			XSSFSheet sheet= workbook.getSheet("sheet1");
			
			int rowNum = 0;
			Iterator<Row> iterator = sheet.iterator();
			while(iterator.hasNext()) {
				Row row = iterator.next();
				
				//skiping header data
				if(rowNum==0) {
					rowNum++;
					continue;
				}
				
				Product product=new Product();
				product.setPname(row.getCell(1)!=null ? row.getCell(1).getStringCellValue(): null);
				product.setCategory(row.getCell(2)!=null ? row.getCell(2).getStringCellValue() : null);
				product.setQuantity(row.getCell(3)!=null ? (int)row.getCell(3).getNumericCellValue() : 0);
				product.setPrice(row.getCell(4)!=null ?  (int)row.getCell(4).getNumericCellValue() : 0);
				
				listProd.add(product);		
				rowNum++;
			}	
			workbook.close();
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return listProd;
	}
	
	public boolean saveProductList(List<Product> products) {
		if(products.size()>0 && products!=null) {
			List<Product> result = this.productRepo.saveAllAndFlush(products);
			if(result.size()>0) {
				return true;
			}
		}
		return false;
	}	
	
	public List<Product> getAllProducts(){
		return this.productRepo.findAll();
	}
	
	public ByteArrayInputStream dataToExcel(List<Product> list) {
		
		//creating workbook
		Workbook workbook=new XSSFWorkbook();
		ByteArrayOutputStream out=new ByteArrayOutputStream();
		
		
		try {
				//create sheet
				Sheet sheet = workbook.createSheet(ProductConstant.SHEETNAME);
				
				//create row for header
				Row headerRow = sheet.createRow(0);
				for(int i=0; i<ProductConstant.HEADER.length; i++) {
					Cell cell = headerRow.createCell(i);
					cell.setCellValue(ProductConstant.HEADER[i]);
				}
				
				//create row for data
				int rowNum = 1;
				List<Product> products = this.productRepo.findAll();
				for(Product p:products) {
					Row dataRow = sheet.createRow(rowNum);
					dataRow.createCell(0).setCellValue(rowNum);
					dataRow.createCell(1).setCellValue(p.getPname());
					dataRow.createCell(2).setCellValue(p.getCategory());
					dataRow.createCell(3).setCellValue(p.getQuantity());
					dataRow.createCell(4).setCellValue(p.getPrice());
					rowNum++;
				}
			
				//writing workbook into ByteArrayOutputStream
				workbook.write(out);
				return new ByteArrayInputStream(out.toByteArray());			
			
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("Error while downloading excel");
				return null;
			}
			finally{
				try {
					workbook.close();
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
	}
}
