<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ǰ���</title>

<!-- ���� : http://getbootstrap.com/css/   ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- ���� -->
<!-- <link rel="stylesheet" href="/css/admin.css" type="text/css"> -->

<!-- ��ư������ ���� �Ʒ� 2�� �߰� & jQuery ���Ѷ� �߰��ߴ���-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<!-- //////////////////////////////////////////////////// -->

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<!-- ���� -->
<!-- <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script> -->
<!-- ��ư������ ���� �Ʒ� 2�� �߰� -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript" src="../javascript/calendar.js">
</script>
<style type="text/css">

	.widget{
	  background-color: #000000;
	  color: skyblue;
	  float: right;
	  padding: 5px;
	  border-radius: 10px;
	  -moz-border-radius: 10px;
	  -webkit-border-radius: 10px;
	}
	
</style>


<script type="text/javascript">

 $( function() {
	 //������������ ������ Ķ����
	  $( "#manuDate" ).datepicker();
	 
    $( "#manuDate" ).datepicker("option","dateFormat","yy-mm-dd");
    
		    
	
	
    $( ".widget button" ).button();
    $("button.btn-primary").on('click', function(){
    	fncAddProduct();
    } );
    
    $("input[name=email]").keydown(function(key){
    	if(key.keyCode == 13){
    		fncAddProduct();
    	}
    } );
    	
  } ); 
 
 $( function() {
	//�����ڸ��� ��Ŀ���� ù��° ��ǰ�� ���°����� ��ġ
	$("input[name='prodName']").focus();
 	
    $( ".widget button" ).button();
    
    $("td.ct_btn01:contains('���')").on('click', function(){
    	$(function (){
    		/* on = bind�� ���� ȿ���� ��� */
    		$("td.ct_btn01:contains('���')").on('click', function(){
    			$("form")[0].reset();
    		});
    		/* document.detailForm.reset(); */
    	});
    } );
  } ); 

function fncAddProduct(){
	
	

	//Form ��ȿ�� ����
 	var name = $("input[name='prodName']").val();
	var detail = $("input[name='prodDetail']").val();
	var manuDate = $("input[name='manuDate']").val();
	var price = $("input[name='price']").val();
	var fileName = $("input[name='fileName']").val();
	console.log("name : " + name + "detail : " + detail + "manuDate : " + manuDate +"price : " + price );

	if(name == null || name.length<1){
		alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(price == null || price.length<1){
		alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	/* if(fileName == null || fileName.length<1){
		alert("�����̸��� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
 */ 
 
    
 	 $("form").attr("method","POST").attr("action","/product/addProduct").attr("enctype","multipart/form-data").submit(); 
 	/* $("form").attr("method","POST").attr("action","/product/addProduct").submit(); */
 		/* method="post" enctype="multipart/form-data" */
	//document.detailForm.action='/product/addProduct';
	//document.detailForm.submit();
}




	 /* $(function() {
	 	$("td.ct_btn01:contains('���')").on('click', function(){
	 		fncAddProduct();
		});
	});	 
 */
	

</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">�� ǰ �� ��</h1>
		<br/><br/>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">�� ǰ ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" placeholder="��ǰ���� �����ּ���.">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    <div class="col-sm-4">
		    <!-- datapicker �ֱ� -->
		      <input type="text" class="form-control" id="manuDate" name="manuDate" readonly="readonly" placeholder="Ŭ�����ּ���.">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="fileImage" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���&emsp;&emsp;&emsp;</label>
		   	 <input multiple="multiple" type="file" id="fileImage" />
		    <p class="help-block">5MB ���ϸ� ���ε� �����մϴ�.</p>
		  </div>

		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
	
</body>
</html>