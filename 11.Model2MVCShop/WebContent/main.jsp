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
 	<!-- CAROUSEL을 위해 추가함 -->
 	<link rel="icon" href="../../favicon.ico">
    <link rel="canonical" href="https://getbootstrap.com/docs/3.3/examples/carousel/">
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
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

	<!--  아래의 내용은 http://getbootstrap.com/getting-started/  참조 -->	
   	<!-- <div class="container ">
      Main jumbotron for a primary marketing message or call to action
      <div class="jumbotron">
        <h1>Model2MVCShop </h1>
        <p>J2SE , DBMS ,JDBC , Servlet & JSP, Java Framework , HTML5 , UI Framework 학습 후 Mini-Project 진행</p>
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
              <h1>붕어빵의 혁명</h1>
              <p>우리 다같이 붕어빵을 먹어보아요. 이번꺼는 초코붕어빵이에요 맛이쩡. 붕어빵머겅 두번머겅.</p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="https://i.ytimg.com/vi/jPmFdXVXS6k/maxresdefault.jpg" style="width: 2000px; height: 500px;" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>붕어빵의 혁명</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="third-slide" src="https://previews.123rf.com/images/captainvector/captainvector1509/captainvector150900108/45341662-%EB%B6%95%EC%96%B4%EB%B9%B5.jpg" style="width: 200px; height: 500px;" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>붕어빵 일러스트</h1>
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
          <h2>기본붕어빵</h2>
          <p>일본에서 유래된 풀빵의 일종. 일본어로는 '타이야키'라고 한다. 직역하면 '도미 구이.' 밀가루 반죽에 팥을 넣어 붕어모양으로 구워낸 먹거리. 바삭한 껍질과 쫀득한 속살, 그리고 고소한 팥소가 일품인 겨울철의 대표적인 길거리 음식 중 하나다. 한국에서는 단팥과 크림 위주로 포장마차에서 판매하는 길거리 간식의 하나이지만, 일본에는 이 밖에도 각종 야채와 소스, 고기 저민 것 등을 넣고 토스트처럼 한 끼 메뉴로 만든 것 등 다양한 바리에이션도 있다.</p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="https://i.ytimg.com/vi/jPmFdXVXS6k/maxresdefault.jpg" alt="Generic placeholder image" width="140" height="140">
          <h2>말차붕어빵</h2>
          <p>유래 : 타이야키는 한국에서 유통되는 보통의 붕어빵보다 모양이 더 세세하고 일반적으로 크기가 크며, 가게마다 형틀이 조금씩 다르다. 간단하게 일본의 원조 타이야키가 다운그레이드 너프를 먹은거라고 보면된다. 게다가 일본에서는 팥 대신 초콜릿, 크림, 흰팥앙금, 강낭콩, 카레, 소세지, 베이컨, 양배추, 딸기 등을 넣는 것들도 많다. 개중에는 오코노미야키가 들어가기도 하고, 여름 한정으로 아이스 버전을 팔기도 한다. </p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="https://tumblbug-pci.imgix.net/ed20e46c8042780d76af2e556c713104e934fe29/e7061d1e64e95e549be0cd278ad3b554dbc39540/b4042d5a2eaf8e79b32513b7440f3c0204be3b0a/4a82b482-10e6-4218-93fe-386367c12042.jpg?ixlib=rb-1.1.0&w=1240&h=930&auto=format%2Ccompress&lossless=true&fit=crop&s=7eed41ebfc84d8766505c1baef610113" alt="Generic placeholder image" width="140" height="140">
          <h2>초코붕어빵</h2>
          <p>맛은 한국의 호두과자에 가깝다고 하는데, 반죽이 호두과자, 팬케이크 반죽과 비슷한 달콤한 반죽이며 안에도 팥앙금이 들어가므로 비슷한 것이다. 물론 위에 나열된 특수한 소재들을 넣은 것은 또 맛이 다르겠지만. 한국의 붕어빵과 가장 다른 점은 역시 가격. 싸도 한마리(한 봉투가 아니다)에 100엔을 넘는것이 기본이며, 비싼 경우는 300엔을 넘어가기도 한다.</p>
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->
		
	

      <!-- START THE FEATURETTES -->

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">붕어빵 찾기 힘든 요즘… <span class="text-muted">당신은 '붕세권'에 살고 있나요?</span></h2>
          <p class="lead">기온이 뚝, 붕어빵 한 봉지 사서 돌아가고 싶은 계절이 왔습니다.그런데 아무리 찾아도 붕어빵 파는 곳이 보이지 않는다고요? 매년 겨울마다 붕어빵이 귀해지니, 붕어빵과 역세권을 합한 '붕세권'이라는 우스갯소리가 나올 정도인데요.
						그러자 붕어빵을 찾아 나선 사람들을 위한 특별한 지도가 만들어졌습니다. 이름하여 '대동풀빵여지도'.올겨울 '대동풀빵여지도' 보면서 우리 동네 붕어빵 가게를 찾아보는 건 어떨까요?</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive center-block" src="https://i.ytimg.com/vi/YrYbRN-moU0/maxresdefault.jpg" style="width: 400px; height: 400px;" alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7 col-md-push-5">
          <h2 class="featurette-heading">백화점에서 붕어빵을 판다고? <span class="text-muted">프랑스에 다녀온 붕어빵</span></h2>
          <p class="lead">현대백화점 압구정 본점은 오는 25일까지 최근 서울 홍익대 인근에서 인기를 끌고 있는 ‘프랑스에 다녀온 붕어빵’ 팝업스토어를 연다고 9일 밝혔다.해당 상품은 일반 붕어빵과 달리 크로와상 파이 반죽에 고구마와 초콜릿 등 다양한 속재료를 넣은 것이 특징이다.
          				현대백화점 관계자는 “유명한 먹거리나 디저트 종류는 집객 효과가 뛰어나고 매출 증대에도 도움이 된다”며 “앞으로도 새로운 맛집을 꾸준히 발굴해 백화점에 유치할 것”이라고 말했다.</p>
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