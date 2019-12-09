<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>
<head>
<title>상품 목록조회</title>
<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>

<!-- 기존 CSS링크 09리팩토링 적용 -->
<!-- <link rel="stylesheet" href="/css/admin.css" type="text/css"> -->
<!-- CDN(Content Delivery Network) 호스트 사용 -->
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method","POST").attr("action","/product/listProduct?menu=${param.menu}").submit();
		console.log("menu : ${param.menu}" );
	}
	
	 $(function() {
		 	
		 	//검색창 포커싱처리
			$("input[name=searchKeyword]").focus();
		 	
			$("input[name=searchKeyword]").keydown(function(key){
		    	if(key.keyCode == 13){
	    			fncGetList(1);
		    	}
		    } );
		 
			//==> 검색 Event 연결처리부분
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함. 
			 $( "td.ct_btn01:contains('검색')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('검색')" ).html() );
				fncGetList(1);
			});
			
			
			//==> userId LINK Event 연결처리
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 3 과 1 방법 조합 : $(".className tagName:filter함수") 사용함.
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
															+"상품번호 : "+JSONData.prodNo+"<br/>"
															+"상품명 : "+JSONData.prodName+"<br/>"
															+"상품이미지 : "+JSONData.fileName+"<br/>"
															+"상품상세정보 : "+JSONData.prodDetail+"<br/>"
															+"제조일자 : "+JSONData.manuDate+"<br/>"
															+"가격 : "+JSONData.price+"<br/>"
															+"가입일자 : "+JSONData.regDate+"<br/>"
															+"</h3>";
								//Debug...									
								//alert(displayValue);
								$("h3").remove();
								$( "#"+prodNo+"" ).html(displayValue);
								
							}
					
				});
					 console.log("prodNo : "+ prodNo); 
			});
			
			//==> UI 수정 추가부분  :  userId LINK Event End User 에게 보일수 있도록 
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "steelblue");
			$("h7").css("color" , "steelblue");
			
			
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
			console.log ( $(".ct_list_pop:nth-child(4)" ).html() ); //==> ok
			
			$( "#tranUpdate" ).on("click" , function() {
				self.location ="/purchase/updateTranCode?tranNo=${product.proTranCode}&tranCode=2&currentPage=${resultPage.currentPage}"+$(this).text().trim();
			});
			
			//==> 아래와 같이 정의한 이유는 ??
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
</script>


</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

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
									<td width="93%" class="ct_ttl01">상품 관리</td>
								</c:if>
								
								<c:if test="${param.menu == 'search'}">
									<td width="93%" class="ct_ttl01">상품 목록조회</td>
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
							
						<option value="0" ${!empty searchCondition && searchCondition == "0" ? "selected" : ""} >상품번호</option>
						
						<option value="1" ${!empty searchCondition && searchCondition == "1" ? "selected" : ""} >상품명</option>
					
						<option value="2" ${!empty searchCondition && searchCondition == "2" ? "selected" : ""} >상품가격</option>

					</select> <input type="text" name="searchKeyword"
						value="${searchKeyword}" class="ct_input_g"
						style="width: 200px; height: 19px" /></td>


					<!-- null 유효성체크하는 부분을 메소드로 빼서 지웠음. -->
					<td align="right" width="70">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="17" height="23"><img
									src="/images/ct_btnbg01.gif" width="17" height="23"></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"
									style="padding-top: 3px;">
									검색
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
					<td colspan="11">전체 ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage} 페이지
					</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="100">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">상품명<br>
													<h7 >(상품명 click:상세정보)</h7></td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">가격</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">등록일</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">현재상태</td>
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
						
						<!-- 판매중일 때와 아닐 때 -->
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
						
						<!-- user가 아직 구매를 하지않은 물품을 보는 경우 -->
						<c:if test="${param.menu == 'search' && product.proTranCode == 'sale'}">
							구매 가능
						</c:if>
						
						<!-- 어드민이 아직 구매를 하지않은 물품을 보는 경우 -->
						<c:if test="${param.menu == 'manage' && product.proTranCode == 'sale'}">
							판매중
						</c:if>
						
						<!-- 어드민이 구매를 한 user에게 [배송을 보내기전] 첫번째 -->
						<c:if test="${param.menu == 'manage' && fn:trim(product.proTranCode) == '1'}">
							구매 완료 <a href="/purchase/updateTranCode?tranNo=${product.proTranCode}&tranCode=2&currentPage=${resultPage.currentPage}"> 배송하기 </a>
						</c:if>
						
						<!-- user에게 배송을 보낸 후 [수령확인]을 기다리는 중 -->
						<c:if test="${param.menu == 'manage' && fn:trim(product.proTranCode) == '2'}">
							배송중, 구매자 수령대기
						</c:if>
						
						<!-- user가 [구매확정]을 누른경우  -->
						<c:if test="${param.menu == 'manage' && fn:trim(product.proTranCode) == '3'}">
							구매완료
						</c:if>
						
						<!-- user가 구매한 물품을 보는 경우 -->
						<c:if test="${param.menu == 'search' && product.proTranCode != 'sale'}">
							재고 없음
						</c:if>
 

					</td>
				</tr>
				<tr>
					<!-- <td colspan="11" bgcolor="D6D7D6" height="1"></td> -->
					<!-- ajax로 하기위해서 변경된 부분 -->
					<td id="${product.prodNo}" colspan="11" bgcolor="D6D7D6" height="1"></td>
				</tr>
				
			</c:forEach>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="center"><input type="hidden" id="currentPage"
						name="currentPage" value="" /> <!-- page navigation의 반복적인 c&p로 공통모듈로 빼놓음 -->
						<jsp:include page="../common/pageNavigator.jsp" />
				</tr>
			</table>

		</form>

	</div>
</body>
</html>
