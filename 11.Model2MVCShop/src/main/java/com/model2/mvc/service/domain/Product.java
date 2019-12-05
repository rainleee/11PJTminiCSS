package com.model2.mvc.service.domain;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Product {
	//Field
	private String fileName;
//	private MultipartFile[] fileName;
	private String manuDate;
	private int price;
	private String prodDetail;
	private String prodName;
	private int prodNo;
	private Date regDate;
	private String proTranCode;
	private List<String> fileNameList;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public String getFileName() {
		return fileName;
	}
	
	public List<String> getFileNameList() {
		return fileNameList;
	}
	
	//list������ �����Ͽ� split�� ���� ���� �� �ְ� ����. jsp���� �ϴ°� domain���� �� �� �ְԲ� ����
	public void setFileName(String fileName) {
		this.fileName = fileName;
		fileNameList = new ArrayList<String>();
		String[] fileNames = fileName.split(":");
		for(String a : fileNames) {
			this.fileNameList.add(a);
		}
	}

	public String getManuDate() {
		return manuDate;
	}

//	public MultipartFile[] getFileName() {
//		return fileName;
//	}
//
//	public void setFileName(MultipartFile[] fileName) {
//		this.fileName = fileName;
//	}

	public void setManuDate(String manuDate) {
		this.manuDate = manuDate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getProdDetail() {
		return prodDetail;
	}

	public void setProdDetail(String prodDetail) {
		this.prodDetail = prodDetail;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getProTranCode() {
		return proTranCode;
	}

	public void setProTranCode(String proTranCode) {
		this.proTranCode = proTranCode;
	}

	@Override
	public String toString() {
		return "Product : [fileName]" + fileName
				+ "[manuDate]" + manuDate+ "[price]" + price + "[prodDetail]" + prodDetail
				+ "[prodName]" + prodName + "[prodNo]" + prodNo;
	}
	
	
	
}
