<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

<html lang="ko">
<head>
<title>���Ż�ǰ �����ȸ</title>
	<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script type="text/javascript">
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage);
		$("form").attr("method","POST").attr("action","/purchase/listSale?menu=${param.menu}").submit();
	}
	
	$(function(){
		//�˻�â ��Ŀ��ó��
		$("input[name=searchKeyword]").focus();
	 	
		$("input[name=searchKeyword]").keydown(function(key){
	    	if(key.keyCode == 13){
	    		fncGetList(1);
	    	}
	    } );
	 
		$( "td.ct_btn01:contains('�˻�')" ).on("click" , function() {
			fncGetList(1);
			console.log($( "td.ct_btn01:contains('�˻�')" ).html());
		});
		 
		$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
				var prodNo = $(this).children("input:hidden").val();
					 self.location ="/product/getProduct?prodNo=" + prodNo + "&menu=${param.menu}";  
					 console.log("prodNo : "+ prodNo); 
		});
		
		/* $( ".ct_list_pop td:nth-child(3)" ).mouseenter(function() {
			var prodNo = $(this).children("input:hidden").val();
			$.ajax(
					{
						url: "/product/json/getProduct/" + prodNo,
						method : "GET",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status){
							
							//Debug...
							//alert(status);
							//Debug...
							//alert("JSONData : \n"+JSONData);
							
							var displayValue = "<h3>"
														+"��ǰ��ȣ : "+JSONData.prodNo+"<br/>"
														+"��ǰ�� : "+JSONData.prodName+"<br/>"
														+"��ǰ�̹��� : "+JSONData.fileName+"<br/>"
														+"��ǰ������ : "+JSONData.prodDetail+"<br/>"
														+"�������� : "+JSONData.manuDate+"<br/>"
														+"���� : "+JSONData.price+"<br/>"
														+"�������� : "+JSONData.regDate+"<br/>"
														+"</h3>";
							//Debug...									
							//alert(displayValue);
							$("h3").remove();
							$( "#"+prodNo+"" ).html(displayValue);
							
						}
				
			});
				 console.log("prodNo : "+ prodNo); 
		}); */
			
		//==> UI ���� �߰��κ�  :  userId LINK Event End User ���� ���ϼ� �ֵ��� 
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "steelblue");
		$("h7").css("color" , "steelblue");
		
		
		//==> �Ʒ��� ���� ������ ������ ??
		//==> �Ʒ��� �ּ��� �ϳ��� Ǯ�� ���� �����ϼ���.					
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		//console.log ( $(".ct_list_pop:nth-child(1)" ).html() );
		//console.log ( $(".ct_list_pop:nth-child(2)" ).html() );
		//console.log ( $(".ct_list_pop:nth-child(3)" ).html() );
		console.log ( $(".ct_list_pop:nth-child(4)" ).html() ); //==> ok
		//console.log ( $(".ct_list_pop:nth-child(5)" ).html() ); 
		//console.log ( $(".ct_list_pop:nth-child(6)" ).html() ); //==> ok
		//console.log ( $(".ct_list_pop:nth-child(7)" ).html() ); 
		
		$( "#tranUpdate" ).on("click" , function() {
			self.location ="/purchase/updateTranCode?tranNo=${product.proTranCode}&tranCode=2&currentPage=${resultPage.currentPage}"+$(this).text().trim();
		});
		
		
		//==> �Ʒ��� ���� ������ ������ ??
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		
		$( "td:nth-child(2)" ).css("color" , "steelblue");
		
		$( "td:nth-child(2)" ).on("click" , function() {
			var prodNo = $(this).children("input:hidden").val();
				 self.location ="/product/getProduct?prodNo=" + prodNo + "&menu=${param.menu}";  
				 console.log("prodNo : "+ prodNo); 
	});
	});
</script>


</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>���Ż�ǰ �����ȸ</h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0" ${!empty search.searchCondition && search.searchCondition == "0" ? "selected" : ""} >��ǰ��ȣ</option>
						
						<option value="1" ${!empty search.searchCondition && search.searchCondition == "1" ? "selected" : ""} >��ǰ��</option>
					
						<option value="2" ${!empty search.searchCondition && search.searchCondition == "2" ? "selected" : ""} >��ǰ����</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >��ǰ��</th>
            <th align="left">����</th>
            <th align="left">�����</th>
            <th align="left">�������</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="purchase" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left"  title="���Ź�ȣ : ${purchase.purchaseProd.prodNo}">${purchase.purchaseProd.prodName}
			   	<input type="hidden" value="${purchase.purchaseProd.prodNo}"/>
			  </td>
			 	
			  <td align="left">${purchase.purchaseProd.price}</td>
			  <td align="left">${purchase.purchaseProd.regDate}</td>
			  <td align="left">
			  	<!-- ������ ���� ���Ÿ� �������� ��ǰ�� ���� ��� -->
				<c:if test="${purchase.tranCode == 'sale'}">
					�Ǹ���
				</c:if>
				
				<!-- ������ ���Ÿ� �� user���� [����� ��������] ù��° -->
				<c:if test="${fn:trim(purchase.tranCode) == '1'}">
					���� �Ϸ� <a href="/purchase/updateTranCode?tranNo=${purchase.tranNo}&tranCode=2&currentPage=${resultPage.currentPage}"> ����ϱ� </a>
				</c:if>
				
				<!-- user���� ����� ���� �� [����Ȯ��]�� ��ٸ��� �� -->
				<c:if test="${fn:trim(purchase.tranCode) == '2'}">
					�����, ������ ���ɴ��
				</c:if>
				
				<!-- user�� [����Ȯ��]�� �������  -->
				<c:if test="${fn:trim(purchase.tranCode) == '3'}">
					���ſϷ�
				</c:if>
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>