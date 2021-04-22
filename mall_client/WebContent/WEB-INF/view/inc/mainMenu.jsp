<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
<header class="topbar-nav">
 <nav class="navbar navbar-expand fixed-top">
  <ul class="navbar-nav mr-auto align-items-center">
    <li class="nav-item">
      <a class="nav-link toggle-menu" href="javascript:void();">
       <i class="icon-menu menu-icon"></i>
     </a>
    </li>
    <li class="nav-item">
      <form class="search-bar">
        <input type="text" class="form-control" placeholder="Enter keywords">
         <a href="javascript:void();"><i class="icon-magnifier"></i></a>
      </form>
    </li>
  </ul>
  	
  	<ul class="navbar-nav align-items-center right-nav-link">
    <li class="nav-item dropdown-lg">
      <a class="nav-link dropdown-toggle dropdown-toggle-nocaret waves-effect" data-toggle="dropdown" href="javascript:void();">
      <i class="fa fa-envelope-open-o"></i></a>
    </li>
    <li class="nav-item dropdown-lg">
      <a class="nav-link dropdown-toggle dropdown-toggle-nocaret waves-effect" data-toggle="dropdown" href="javascript:void();">
      <i class="fa fa-bell-o"></i></a>
    </li>
    <li class="nav-item language">
      <a class="nav-link dropdown-toggle dropdown-toggle-nocaret waves-effect" data-toggle="dropdown" href="javascript:void();"><i class="fa fa-flag"></i></a>
      <ul class="dropdown-menu dropdown-menu-right">
          <li class="dropdown-item"> <i class="flag-icon flag-icon-gb mr-2"></i> English</li>
          <li class="dropdown-item"> <i class="flag-icon flag-icon-fr mr-2"></i> French</li>
          <li class="dropdown-item"> <i class="flag-icon flag-icon-cn mr-2"></i> Chinese</li>
          <li class="dropdown-item"> <i class="flag-icon flag-icon-de mr-2"></i> German</li>
        </ul>
    </li>
    <li class="nav-item">
      <a class="nav-link dropdown-toggle dropdown-toggle-nocaret" data-toggle="dropdown" href="#">
        <span class="user-profile"><img src="https://via.placeholder.com/110x110" class="img-circle" alt="user avatar"></span>
      </a>
      <ul class="dropdown-menu dropdown-menu-right">
       <li class="dropdown-item user-details">
        <a href="javaScript:void();">
           <div class="media">
             <div class="avatar"><img class="align-self-start mr-3" src="https://via.placeholder.com/110x110" alt="user avatar"></div>
            <div class="media-body">
            <h6 class="mt-2 user-title">Sarajhon Mccoy</h6>
            <p class="user-subtitle">mccoy@example.com</p>
            </div>
           </div>
          </a>
        </li>
        <li class="dropdown-divider"></li>
        <li class="dropdown-item"><i class="icon-envelope mr-2"></i> Inbox</li>
        <li class="dropdown-divider"></li>
        <li class="dropdown-item"><i class="icon-wallet mr-2"></i> Account</li>
        <li class="dropdown-divider"></li>
        <li class="dropdown-item"><i class="icon-settings mr-2"></i> Setting</li>
        <li class="dropdown-divider"></li>
        <li class="dropdown-item"><i class="icon-power mr-2"></i> Logout</li>
      </ul>
    </li>
  </ul>
</nav>
</header>
<!--End topbar header-->

<!--start color switcher-->
   <div class="right-sidebar">
    <div class="switcher-icon">
      <i class="zmdi zmdi-settings zmdi-hc-spin"></i>
    </div>
    <div class="right-sidebar-content">

      <p class="mb-0">Gaussion Texture</p>
      <hr>
      
      <ul class="switcher">
        <li id="theme1"></li>
        <li id="theme2"></li>
        <li id="theme3"></li>
        <li id="theme4"></li>
        <li id="theme5"></li>
        <li id="theme6"></li>
      </ul>

      <p class="mb-0">Gradient Background</p>
      <hr>
      
      <ul class="switcher">
        <li id="theme7"></li>
        <li id="theme8"></li>
        <li id="theme9"></li>
        <li id="theme10"></li>
        <li id="theme11"></li>
        <li id="theme12"></li>
		<li id="theme13"></li>
        <li id="theme14"></li>
        <li id="theme15"></li>
      </ul>
      
     </div>
   </div>
  <!--end color switcher-->
</div>
      


<!-- 상단 메인 메뉴 -->
	<c:if test="${loginClient == null }">
		<!-- 로그아웃일때 -->
		<div>
			<form action="${pageContext.request.contextPath}/LoginController" method="post" class="search-bar">
				<div class="form-group">
					I D : <input type="text" name="clientMail" size="10">
				</div>
				<div class="form-group">
					PW : <input type="password" name="clientPw" size="10"> <button type="submit" class="btn btn-light btn-round px-4">로그인</button>
				</div>
			</form>
		<hr>
		
		
		<ul>
			<div id="sidebar-wrapper" data-simplebar="" data-simplebar-auto-hide="true">
     		 <div class="brand-logo">
     		  <a href="${pageContext.request.contextPath}/IndexController">
      			 <img src="${pageContext.request.contextPath}/assets/images/logo-icon.png" class="logo-icon" alt="logo icon">
      				 <h5 class="logo-text">E-Book Store</h5>
    		  </a>
   			</div>
   			
   			<ul class="sidebar-menu do-nicescrol">
	     		 <li class="sidebar-header">MAIN NAVIGATION</li>
	     		 <li><a href="${pageContext.request.contextPath}/InsertClientController">회원가입</a></li>
				<li><a href="${pageContext.request.contextPath}/EbookCalendarController">Ebook 달력</a></li>
			</ul>
			</div>
		 </ul>
		</div>
		
		
	</c:if>
	<!--  로그인 성공 시 -->
	<c:if test="${loginClient != null }">
	
	<div id="sidebar-wrapper" data-simplebar="" data-simplebar-auto-hide="true">
     <div class="brand-logo">
      <a href="${pageContext.request.contextPath}/IndexController">
       <img src="${pageContext.request.contextPath}/assets/images/logo-icon.png" class="logo-icon" alt="logo icon">
       <h5 class="logo-text">E-Book Store</h5>
     </a>
   </div>
   <ul class="sidebar-menu do-nicescrol">
      <li class="sidebar-header">MAIN NAVIGATION</li>
      
   	<li><a href="${pageContext.request.contextPath}/IndexController">HOME</a></li>
   	<li><a href="${pageContext.request.contextPath}/EbookCalendarController">Ebook 달력</a></li>
	<li><a href="${pageContext.request.contextPath}/CartListController">장바구니</a></li>
	<li><a href="${pageContext.request.contextPath}/ClientOneController">회원정보</a></li>
	<li><a href="${pageContext.request.contextPath}/OrdersListController">주문리스트</a></li>
	<li><a href="${pageContext.request.contextPath}/LogoutController">로그아웃</a></li>
    </ul>
</div>
		<!-- 로그인일때 -->
			<div class="form-group">
				<h5 class="card-title">${loginClient.clientMail}님 반갑습니다.</h5>
			</div>
	</c:if>
	
	<!-- Bootstrap core JavaScript-->
  <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	
 <!-- simplebar js -->
  <script src="${pageContext.request.contextPath}/assets/plugins/simplebar/js/simplebar.js"></script>
  <!-- sidebar-menu js -->
  <script src="${pageContext.request.contextPath}/assets/js/sidebar-menu.js"></script>
  <!-- loader scripts -->
  <script src="${pageContext.request.contextPath}/assets/js/jquery.loading-indicator.js"></script>
  <!-- Custom scripts -->
  <script src="${pageContext.request.contextPath}/assets/js/app-script.js"></script>
  <!-- Chart js -->
  
  <script src="${pageContext.request.contextPath}/assets/plugins/Chart.js/Chart.min.js"></script>
 
  <!-- Index js -->
  <script src="${pageContext.request.contextPath}/assets/js/index.js"></script>

