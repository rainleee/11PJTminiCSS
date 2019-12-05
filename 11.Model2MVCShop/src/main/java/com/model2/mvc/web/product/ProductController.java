package com.model2.mvc.web.product;

import java.util.ArrayList;
import java.util.Map;
import java.util.UUID;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;


//==> ȸ������ Controller
@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method ���� ����
		
	public ProductController(){
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
	
	//local�� �����ϴ� ��ġ ����
	private static final String UPLOAD_PATH = "C:\\workspace\\09.Model2MVCShop(jQuery)\\WebContent\\images\\uploadFiles";
	
	
	@RequestMapping(value = "addProduct", method =RequestMethod.GET)
	public String addProduct() throws Exception {

		System.out.println("/product/addProduct : GET");
		
		return "redirect:/product/addProductView.jsp";
	}
	
	@RequestMapping(value = "addProduct", method = RequestMethod.POST)
	public String addProduct( @RequestParam("fileImage") ArrayList<MultipartFile> fileName,
								@ModelAttribute("product") Product product,
								Model model) throws Exception {
		
		//���������� ���� nullString ���� ����
		String result = "";
		int i =0;
		
		System.out.println("/product/addProduct() POST start");
		
		for (MultipartFile files : fileName) {
			i++;
			result += saveFile(files);
			
			if(i != fileName.size()) {
				result += ":";
			}
        }

		 System.out.println("result : " + result);
		 
		 product.setFileName(result);
		 System.out.println("fileNameList : " + product.getFileNameList());
		 model.addAttribute("product", product);
		 System.out.println(product);
		 
		 
		 productService.addProduct(product);
		 return "forward:/product/addProduct.jsp";
		
	}
	
	private String saveFile(MultipartFile file) {
		
		//�̸� �ߺ����� �ʰ� �����̸� ����
		UUID uuid = UUID.randomUUID();
		//�������� �����̸��� �����ĺ��� + _ �� �ٿ��� �ߺ��� ������
		String saveName = uuid + "_" + file.getOriginalFilename();
		
		System.out.println("File Save Name : " + saveName);
		
		File saveFile = new File(UPLOAD_PATH, saveName);
		
		try {
			file.transferTo(saveFile);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		
		return saveName;
		
	}
	
	@RequestMapping(value = "getProduct", method = RequestMethod.GET)
	public String getProduct( @RequestParam("prodNo") int prodNo , 
			@RequestParam(value = "menu", required = false) String menu, 
			Model model ) throws Exception {
		
		System.out.println("prod_No : "  + prodNo );
		System.out.println("/product/getProduct : GET");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		// Model �� View ����
		model.addAttribute("product", product);
		model.addAttribute("menu", menu);
		
		//��Ű������ @CookieValue�� ����ؼ� ���⼭ 
		
		//parameter menu�� manage��� 
		if (menu.equals("manage")) {
			return "forward:/product/updateProductView.jsp";
		} else  {

			return "forward:/product/getProduct.jsp";
		}
		
	}
	
//	@RequestMapping("/updateProductView.do")
//	public String updateProductView( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{
	@RequestMapping(value = "updateProduct", method = RequestMethod.GET)
	public String updateProduct( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{

		System.out.println("/product/updateProduct : GET");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		
		// Model �� View ����
		model.addAttribute("product", product);
		
		return "forward:/product/updateProduct.jsp";
	}
	
//	@RequestMapping("/updateProduct.do")
//	public String updateProduct( @ModelAttribute("product") Product product , Model model , HttpSession session) throws Exception{
	@RequestMapping(value = "updateProduct", method = RequestMethod.POST)
	public String updateProduct( @ModelAttribute("product") Product product , Model model , HttpSession session) throws Exception{

		System.out.println("/product/updateProduct : POST");
		//Business Logic
		productService.updateProduct(product);
		
//		int sessionNo=((Product)session.getAttribute("product")).getProdNo();
//		if(sessionNo == product.getProdNo()){
//			session.setAttribute("product", product);
//			System.out.println("updateProduct sessionNo Ȯ��" + session.getAttribute("product"));
//		}
		model.addAttribute("product",product);
		System.out.println("product update : " + product);
		
		return "redirect:/product/getProduct?prodNo=" + product.getProdNo() + "&menu=ok";
	}
	
//	@RequestMapping("/listProduct.do")
//	public String listProduct( @ModelAttribute("search") Search search ,
//								@ModelAttribute("page") Page page ,
//								Model model , HttpServletRequest request) throws Exception{
	@RequestMapping(value = "listProduct")
	public String listProduct( @ModelAttribute("search") Search search ,
//			@ModelAttribute("page") Page page ,
			Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/product/listProduct GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		
		search.setSearchCondition(request.getParameter("searchCondition"));
		search.setSearchKeyword(request.getParameter("searchKeyword"));
		search.setPageSize(pageSize);
		//�Ʒ� ������ pageUnit�� ����������. ������ �𵨾�Ʈ����Ʈ �߰�
//		page.setPageUnit(pageUnit);
		
		
		// Business logic ����
		Map<String , Object> map=productService.getProductList(search);
		System.out.println("map : " + map);
		
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model �� View ����
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/product/listProduct.jsp";
	}
}