package com.model2.mvc.service.purchase;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;

public interface PurchaseDao {
	
	//Insert
	public void addPurchase(Purchase purchase) throws Exception;
	
	//find => get���� ����
	public Purchase getPurchase(int tranNo) throws Exception;
	
	//getPurchase2 ProdNo�� ã�� (��� �������� ?)
	public Purchase getPurchase2(int ProdNo) throws Exception;
	
	//getProductList
	public Map<String, Object> getPurchaseList(Search search, String buyerId) throws Exception;
	
	//getSaleList(�ǸŸ���Ʈ �̱������)
	public List<Purchase> getSaleList(Search search) throws Exception;
	
	//user ���Ÿ����ȸ
	public Map<String,Object> getListPurchaseProduct(Search search, String buyerId) throws Exception;
	
	//updatePurcahse
	public void updatePurcahse(Purchase purchase) throws Exception;
	
	//updateTranCode
	public void updateTranCode(Purchase purchase) throws Exception;
	
	//�� ���Ű����� �������� TotalCount
	public int getTotalCount(String buyerId) throws Exception;
	
	public int getTotalCountSale() throws Exception;
}
