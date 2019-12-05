<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>
<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method","POST").attr("action","/product/listProduct?menu=${param.menu}").submit();
		console.log("menu : ${param.menu}" );
		//document.detailForm.submit();
		//document.getElementById("currentPage").value = currentPage;
	}
	
	 $(function() {
		 	
		 	//�˻�â ��Ŀ��ó��
			$("input[name=searchKeyword]").focus();
		 	
			$("input[name=searchKeyword]").keydown(function(key){
		    	if(key.keyCode == 13){
	    			fncGetList(1);
		    	}
		    } );
		 
			//==> �˻� Event ����ó���κ�
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����. 
			 $( "td.ct_btn01:contains('�˻�')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('�˻�')" ).html() );
				fncGetList(1);
			});
			
			
			//==> userId LINK Event ����ó��
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 3 �� 1 ��� ���� : $(".className tagName:filter�Լ�") �����.
			 $( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
				var prodNo = $(this).children("input:hidden").val();
					 self.location ="/product/getProduct?prodNo=" + prodNo + "&menu=${param.menu}";  
					 console.log("prodNo : "+ prodNo); 
			}); 
			
			$( ".ct_list_pop td:nth-child(3)" ).mouseenter(function() {
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
			});
			
			//==> UI ���� �߰��κ�  :  userId LINK Event End User ���� ���ϼ� �ֵ��� 
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "steelblue");
			$("h7").css("color" , "steelblue");
			
			
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
			console.log ( $(".ct_list_pop:nth-child(4)" ).html() ); //==> ok
			
			$( "#tranUpdate" ).on("click" , function() {
				self.location ="/purchase/updateTranCode?tranNo=${product.proTranCode}&tranCode=2&currentPage=${resultPage.currentPage}"+$(this).text().trim();
			});
			
			//==> �Ʒ��� ���� ������ ������ ??
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
</script>


</head>

<body bgcolor="#ffffff" text="#000000">

	<div style="width: 98%; margin-left: 10px;">

		<form name="detailForm">

			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37" /></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<c:if test="${param.menu == 'manage'}">
									<td width="93%" class="ct_ttl01">��ǰ ����</td>
								</c:if>
								
								<c:if test="${param.menu == 'search'}">
									<td width="93%" class="ct_ttl01">��ǰ �����ȸ</td>
								</c:if>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37" /></td>
				</tr>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="right"><select name="searchCondition"
						class="ct_input_g" style="width: 80px">
							
						<option value="0" ${!empty searchCondition && searchCondition == "0" ? "selected" : ""} >��ǰ��ȣ</option>
						
						<option value="1" ${!empty searchCondition && searchCondition == "1" ? "selected" : ""} >��ǰ��</option>
					
						<option value="2" ${!empty searchCondition && searchCondition == "2" ? "selected" : ""} >��ǰ����</option>

					</select> <input type="text" name="searchKeyword"
						value="${searchKeyword}" class="ct_input_g"
						style="width: 200px; height: 19px" /></td>


					<!-- null ��ȿ��üũ�ϴ� �κ��� �޼ҵ�� ���� ������. -->
					<td align="right" width="70">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="17" height="23"><img
									src="/images/ct_btnbg01.gif" width="17" height="23"></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"
									style="padding-top: 3px;">
									�˻�
									</td>
								<td width="14" height="23"><img
									src="/images/ct_btnbg03.gif" width="14" height="23"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>


			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td colspan="11">��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������
					</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="100">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">��ǰ��<br>
													<h7 >(��ǰ�� click:������)</h7></td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">�����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">�������</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>
				<c:set var="i" value="0" />
				<c:forEach var="product" items="${list}">
					<c:set var="i" value="${i + 1}" />
						<tr class="ct_list_pop">
						<td align="center">${i}</td>
						<td></td>
						
						<!-- �Ǹ����� ���� �ƴ� �� -->
						<td align="left">
						<input type="hidden" value="${product.prodNo}"/>
							${product.prodName}
						</td>
					
					
						<td></td>
						<td align="left">${product.price}</td>
						<td></td>
						<td align="left">${product.regDate}</td>
						<td></td>
						<td align="left" id="tranUpdate">
						
						<!-- user�� ���� ���Ÿ� �������� ��ǰ�� ���� ��� -->
						<c:if test="${param.menu == 'search' && product.proTranCode == 'sale'}">
							���� ����
						</c:if>
						
						<!-- ������ ���� ���Ÿ� �������� ��ǰ�� ���� ��� -->
						<c:if test="${param.menu == 'manage' && product.proTranCode == 'sale'}">
							�Ǹ���
						</c:if>
						
						<!-- ������ ���Ÿ� �� user���� [����� ��������] ù��° -->
						<c:if test="${param.menu == 'manage' && fn:trim(product.proTranCode) == '1'}">
							���� �Ϸ� <a href="/purchase/updateTranCode?tranNo=${product.proTranCode}&tranCode=2&currentPage=${resultPage.currentPage}"> ����ϱ� </a>
						</c:if>
						
						<!-- user���� ����� ���� �� [����Ȯ��]�� ��ٸ��� �� -->
						<c:if test="${param.menu == 'manage' && fn:trim(product.proTranCode) == '2'}">
							�����, ������ ���ɴ��
						</c:if>
						
						<!-- user�� [����Ȯ��]�� �������  -->
						<c:if test="${param.menu == 'manage' && fn:trim(product.proTranCode) == '3'}">
							���ſϷ�
						</c:if>
						
						<!-- user�� ������ ��ǰ�� ���� ��� -->
						<c:if test="${param.menu == 'search' && product.proTranCode != 'sale'}">
							��� ����
						</c:if>
 

					</td>
				</tr>
				<tr>
					<!-- <td colspan="11" bgcolor="D6D7D6" height="1"></td> -->
					<!-- ajax�� �ϱ����ؼ� ����� �κ� -->
					<td id="${product.prodNo}" colspan="11" bgcolor="D6D7D6" height="1"></td>
				</tr>
				
			</c:forEach>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="center"><input type="hidden" id="currentPage"
						name="currentPage" value="" /> <!-- page navigation�� �ݺ����� c&p�� ������� ������ -->
						<jsp:include page="../common/pageNavigator.jsp" />
				</tr>
			</table>

		</form>

	</div>
</body>
</html>
