<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
 	<!-- CAROUSEL�� ���� �߰��� -->
 	<link rel="icon" href="../../favicon.ico">
    <link rel="canonical" href="https://getbootstrap.com/docs/3.3/examples/carousel/">
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS �߰� : ���ٿ� ȭ�� ������ ���� �ذ� :  �ּ�ó�� ��, �� Ȯ��-->
	<style>
        body {
            padding-top : 70px;
        }
        
       /*  h1 {
        	color: black;
        } */
   	</style>
   	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	 	
	
</head>
	
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  �Ʒ��� ������ http://getbootstrap.com/getting-started/  ���� -->	
   	<!-- <div class="container ">
      Main jumbotron for a primary marketing message or call to action
      <div class="jumbotron">
        <h1>Model2MVCShop </h1>
        <p>J2SE , DBMS ,JDBC , Servlet & JSP, Java Framework , HTML5 , UI Framework �н� �� Mini-Project ����</p>
     </div>
    </div> -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="first-slide" src="https://i.ytimg.com/vi/N4gKUWrhZSI/maxresdefault.jpg" style="width: 2000px; height: 500px; alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>�ؾ�� ����</h1>
              <p>�츮 �ٰ��� �ؾ�� �Ծ�ƿ�. �̹����� ���ںؾ�̿��� ������. �ؾ�Ӱ� �ι��Ӱ�.</p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="https://i.ytimg.com/vi/jPmFdXVXS6k/maxresdefault.jpg" style="width: 2000px; height: 500px;" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>�ؾ�� ����</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="third-slide" src="https://previews.123rf.com/images/captainvector/captainvector1509/captainvector150900108/45341662-%EB%B6%95%EC%96%B4%EB%B9%B5.jpg" style="width: 200px; height: 500px;" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>�ؾ �Ϸ���Ʈ</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->
    
    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->
	<br>
	<br>
	<br>
	<br>
    <div class="container marketing">

      <!-- Three columns of text below the carousel -->
      <div class="row">
        <div class="col-lg-4">
          <img class="img-circle" src="https://previews.123rf.com/images/paylessimages/paylessimages1506/paylessimages150601955/50083040-%EB%B6%95%EC%96%B4%EB%B9%B5.jpg" alt="Generic placeholder image" width="140" height="140">
          <h2>�⺻�ؾ</h2>
          <p>�Ϻ����� ������ Ǯ���� ����. �Ϻ���δ� 'Ÿ�̾�Ű'��� �Ѵ�. �����ϸ� '���� ����.' �а��� ���׿� ���� �־� �ؾ������� ������ �԰Ÿ�. �ٻ��� ������ �˵��� �ӻ�, �׸��� ����� �ϼҰ� ��ǰ�� �ܿ�ö�� ��ǥ���� ��Ÿ� ���� �� �ϳ���. �ѱ������� ���ϰ� ũ�� ���ַ� ���帶������ �Ǹ��ϴ� ��Ÿ� ������ �ϳ�������, �Ϻ����� �� �ۿ��� ���� ��ä�� �ҽ�, ��� ���� �� ���� �ְ� �佺Ʈó�� �� �� �޴��� ���� �� �� �پ��� �ٸ����̼ǵ� �ִ�.</p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="https://i.ytimg.com/vi/jPmFdXVXS6k/maxresdefault.jpg" alt="Generic placeholder image" width="140" height="140">
          <h2>�����ؾ</h2>
          <p>���� : Ÿ�̾�Ű�� �ѱ����� ����Ǵ� ������ �ؾ���� ����� �� �����ϰ� �Ϲ������� ũ�Ⱑ ũ��, ���Ը��� ��Ʋ�� ���ݾ� �ٸ���. �����ϰ� �Ϻ��� ���� Ÿ�̾�Ű�� �ٿ�׷��̵� ������ �����Ŷ�� ����ȴ�. �Դٰ� �Ϻ������� �� ��� ���ݸ�, ũ��, ���Ͼӱ�, ������, ī��, �Ҽ���, ������, �����, ���� ���� �ִ� �͵鵵 ����. ���߿��� ���ڳ�̾�Ű�� ���⵵ �ϰ�, ���� �������� ���̽� ������ �ȱ⵵ �Ѵ�. </p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="https://tumblbug-pci.imgix.net/ed20e46c8042780d76af2e556c713104e934fe29/e7061d1e64e95e549be0cd278ad3b554dbc39540/b4042d5a2eaf8e79b32513b7440f3c0204be3b0a/4a82b482-10e6-4218-93fe-386367c12042.jpg?ixlib=rb-1.1.0&w=1240&h=930&auto=format%2Ccompress&lossless=true&fit=crop&s=7eed41ebfc84d8766505c1baef610113" alt="Generic placeholder image" width="140" height="140">
          <h2>���ںؾ</h2>
          <p>���� �ѱ��� ȣ�ΰ��ڿ� �����ٰ� �ϴµ�, ������ ȣ�ΰ���, ������ũ ���װ� ����� ������ �����̸� �ȿ��� �Ͼӱ��� ���Ƿ� ����� ���̴�. ���� ���� ������ Ư���� ������� ���� ���� �� ���� �ٸ�������. �ѱ��� �ؾ�� ���� �ٸ� ���� ���� ����. �ε� �Ѹ���(�� ������ �ƴϴ�)�� 100���� �Ѵ°��� �⺻�̸�, ��� ���� 300���� �Ѿ�⵵ �Ѵ�.</p>
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->
		
	

      <!-- START THE FEATURETTES -->

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">�ؾ ã�� ���� ���� <span class="text-muted">����� '�ؼ���'�� ��� �ֳ���?</span></h2>
          <p class="lead">����� ��, �ؾ �� ���� �缭 ���ư��� ���� ������ �Խ��ϴ�.�׷��� �ƹ��� ã�Ƶ� �ؾ �Ĵ� ���� ������ �ʴ´ٰ��? �ų� �ܿ︶�� �ؾ�� ��������, �ؾ�� �������� ���� '�ؼ���'�̶�� �콺���Ҹ��� ���� �����ε���.
						�׷��� �ؾ�� ã�� ���� ������� ���� Ư���� ������ ����������ϴ�. �̸��Ͽ� '�뵿Ǯ��������'.�ðܿ� '�뵿Ǯ��������' ���鼭 �츮 ���� �ؾ ���Ը� ã�ƺ��� �� ����?</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive center-block" src="https://i.ytimg.com/vi/YrYbRN-moU0/maxresdefault.jpg" style="width: 400px; height: 400px;" alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7 col-md-push-5">
          <h2 class="featurette-heading">��ȭ������ �ؾ�� �Ǵٰ�? <span class="text-muted">�������� �ٳ�� �ؾ</span></h2>
          <p class="lead">�����ȭ�� �б��� ������ ���� 25�ϱ��� �ֱ� ���� ȫ�ʹ� �αٿ��� �α⸦ ���� �ִ� ���������� �ٳ�� �ؾ�� �˾����� ���ٰ� 9�� ������.�ش� ��ǰ�� �Ϲ� �ؾ�� �޸� ũ�οͻ� ���� ���׿� ������ ���ݸ� �� �پ��� ����Ḧ ���� ���� Ư¡�̴�.
          				�����ȭ�� �����ڴ� �������� �԰Ÿ��� ����Ʈ ������ ���� ȿ���� �پ�� ���� ���뿡�� ������ �ȴ١��� �������ε� ���ο� ������ ������ �߱��� ��ȭ���� ��ġ�� �͡��̶�� ���ߴ�.</p>
        </div>
        <div class="col-md-5 col-md-pull-7">
          <img class="featurette-image img-responsive center-block" src="http://img.khan.co.kr/news/2014/12/09/l_2014120901001401900102171.jpg" style="width: 400px; height: 400px;" alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">




      <!-- FOOTER -->
      <footer>
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>&copy; 2019 Bitcamp Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
      </footer>

    </div><!-- /.container -->

</body>

</html>