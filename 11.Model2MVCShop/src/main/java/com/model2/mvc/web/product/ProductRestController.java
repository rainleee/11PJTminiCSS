package com.model2.mvc.web.product;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;


//==> ȸ������ Controller
@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method ���� ����
		
	public ProductRestController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml ���� �Ұ�
	//==> �Ʒ��� �ΰ��� �ּ��� Ǯ�� �ǹ̸� Ȯ�� �Ұ�
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	//.jsp�� �ȳ��� ���� ��� GET����� ����
//	@RequestMapping(value = "addProduct", method =RequestMethod.GET)
//	public String addProduct() throws Exception {
//
//		System.out.println("/product/addProduct : GET");
//		
//		return "redirect:/product/addProductView.jsp";
//	}
	
	//���� ����
	@RequestMapping(value = "json/addProduct", method = RequestMethod.POST)
	public String addProduct( @ModelAttribute("product") Product product,
								HttpServletRequest request,
								HttpServletResponse response,
								Model model) throws Exception {
		
		if(FileUpload.isMultipartContent(request)) {
			String temDir = "C:\\Users\\user\\git\\repository\\07PJTmini\\07.Model2MVCShop(URI,pattern)\\WebContent\\images\\uploadFiles";
			
			DiskFileUpload fileUpload = new DiskFileUpload();
			fileUpload.setRepositoryPath(temDir);
			fileUpload.setSizeMax(1024*1024*50);
			//gksqjsdp 100k������ �޸𸮿� ����
			fileUpload.setSizeThreshold(1024*100);
			
			if(request.getContentLength() < fileUpload.getSizeMax()) {
//				Product productImage = new Product();
				
				StringTokenizer token = null; 
				
				List fileItemList = fileUpload.parseRequest(request);
				int Size = fileItemList.size();
				for (int i = 0; i < Size; i++) {
					FileItem fileItem = (FileItem)fileItemList.get(i);
					//isFormField()�� ���ؼ� ������������ �Ķ�������� �����Ѵ�.
					//�Ķ���Ͷ�� true
					if(fileItem.isFormField()) {
						if (fileItem.getFieldName().equals("manuDate")) {
							token = new StringTokenizer(fileItem.getString("euc-kr"),"-" );
							String manuDate = token.nextToken() + token.nextToken() + 
									token.nextToken();
							product.setManuDate(manuDate);
						}
						else if(fileItem.getFieldName().equals("prodName")) 
							product.setProdName(fileItem.getString("euc-kr"));
						else if(fileItem.getFieldName().equals("prodDetail")) 
							product.setProdDetail(fileItem.getString("euc-kr"));
						else if(fileItem.getFieldName().equals("price")) 
							product.setPrice(Integer.parseInt(fileItem.getString("euc-kr")));
						
					}else {
						
						if(fileItem.getSize() > 0) {
							int idx = fileItem.getName().lastIndexOf("\\");
							
							if(idx == -1) {
								idx = fileItem.getName().lastIndexOf("/");
							}
							String fileName = fileItem.getName().substring(idx + 1);
							product.setFileName(fileName);
							try {
								File uploadedFile = new File(temDir,fileName);
								fileItem.write(uploadedFile);
							}catch(IOException e) {
								System.out.println(e);
							}
						}else {
							product.setFileName("../../images/empty.GIF");
						}
					}//else
				}//for
				
				productService.addProduct(product);
				
				request.setAttribute("product", product);
				model.addAttribute("product", product);
				
			}else {
				int overSize = (request.getContentLength() / 1000000);
				System.out.println("<script>alert('������ ũ��� 1MB���� �Դϴ�. �ø��� ���� �뷮��" + overSize + "MB�Դϴ�');");
				System.out.println("history.back(); </script>");
			}
		}else {
			System.out.println("���ڵ� Ÿ���� multipart/form-data�� �ƴմϴ�.");
		}
		
		//���� ���ε�� ���� ��ġ. �̰� ���..?
//		return "forward:/product/getProduct.jsp";
		
		System.out.println("/product/addProduct : POST");
		//Business Logic
//		productService.addProduct(product);
		
		//��� ������ �ѱ�����ؼ� redirect���� forward�� ����
		return "forward:/product/addProduct.jsp";
	}
	
	@RequestMapping(value = "json/getProduct/{prodNo}", method = RequestMethod.GET)
	public Product getProduct( @PathVariable int prodNo) throws Exception {
		
		System.out.println("/product/getProduct/{prodNo} : GET ");
		return productService.getProduct(prodNo);
		
		// Model �� View ����
		
		//��Ű������ @CookieValue�� ����ؼ� ���⼭ 
	}
	
	@RequestMapping(value = "json/updateProduct/{prodNo}", method = RequestMethod.GET)
	public Product updateProduct( @PathVariable("prodNo") int prodNo ) throws Exception{

		System.out.println("json/product/updateProduct : GET");
		
		//Business Logic
		return productService.getProduct(prodNo);
		
	}
	
	@RequestMapping(value = "json/updateProduct", method = RequestMethod.POST)
	public void updateProduct( @RequestBody Product product ) throws Exception{

		System.out.println("/product/json/updateProduct : POST");
		//Business Logic
		productService.updateProduct(product);
		
		System.out.println("/product/json/updateProduct : POST ��");
		
	}
	
	@RequestMapping(value = "json/listProduct", method = RequestMethod.GET)
	public Map listProduct( HttpServletRequest request) throws Exception{
		
		System.out.println("json/listProduct GET start");
		
		
		Search search = new Search();
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		//�Ʒ� ������ pageUnit�� ����������. ������ �𵨾�Ʈ����Ʈ �߰�
		
		
		// Business logic ����
		Map<String , Object> map=productService.getProductList(search);
		System.out.println("map : " + map);
		
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		map.put("list", map.get("list"));
		map.put("resultPage", resultPage);
		map.put("search", search);
		
		System.out.println("json/listProduct GET end");
		return map;		
	}
}