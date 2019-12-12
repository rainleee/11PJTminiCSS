<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<script type="text/javascript">
	$(function(){
		$("form[name='updatePurchase']").attr("method","POST")attr("action", "/purchase/updatePurchase?tranNo=${purchase.tranNo}")
	})
</script>
<html>
<head>
<title>Insert title here</title>
</head>

<body>

<form name="updatePurchase" >

������ ���� ���Ű� �Ǿ����ϴ�.

<table border=1>
	<tr>
		<td>��ǰ��ȣ</td>
		<td>${purchase.purchaseProd.prodNo}</td>
		<td></td>
	</tr>
	<tr>
		<td>�����ھ��̵�</td>
		<td>${purchase.buyer.userId}</td>
		<td></td>
	</tr>
	<tr>
		<td>���Ź��</td>
		<td>
			
			<!-- �ɼ�number�� 1�̶�� -->
			<c:if test="${fn:trim(purchase.paymentOption) == '1'}">
				���ݱ���
			</c:if>
			
			<!-- �ɼ�number�� 2��� -->
			<c:if test="${fn:trim(purchase.paymentOption) == '2'}">
				�ſ뱸��
			</c:if>
		
		</td>
		<td></td>
	</tr>
	<tr>
		<td>�������̸�</td>
		<td>${purchase.buyer.userName}</td>
		<td></td>
	</tr>
	<tr>
		<td>�����ڿ���ó</td>
		<td>${purchase.receiverPhone}</td>
		<td></td>
	</tr>
	<tr>
		<td>�������ּ�</td>
		<td>${purchase.divyAddr}</td>
		<td></td>
	</tr>
		<tr>
		<td>���ſ�û����</td>
		<td>${purchase.divyRequest}</td>
		<td></td>
	</tr>
	<tr>
		<td>����������</td>
		<td>${purchase.divyDate}</td>
		<td></td>
	</tr>
</table>
</form>

</body>
</html>