<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-lg-12">
        <div class="row userPanel">
            <ul style="list-style: none">
                <li style="float: right">
                    <sec:authorize ifAnyGranted="ROLE_USER, ROLE_ADMIN">
                        <div style="margin: 5px;"><a href="${pageContext.request.contextPath}/logout">[logout]</a></div>
                    </sec:authorize>
                </li>
                <li style="float: right">
                    <sec:authorize access="isAnonymous()">
                        <div style="margin: 5px;"><a href="${pageContext.request.contextPath}/register">[register]</a></div>
                    </sec:authorize>
                </li>
                <li style="float: right">
                    <sec:authorize access="isAnonymous()">
                        <div style="margin: 5px"><a href="${pageContext.request.contextPath}/login">[login]</a></div>
                    </sec:authorize>
                </li>
                <li style="float: right">
                    <div class="cart-badge" style="margin: 5px 25px;"><a href="${pageContext.request.contextPath}/checkout">Checkout <span class="badge">${shoppingCart.itemCount}</span> <img src="<c:url value='/images/template/cart-icon.png'/>" width="35px" height="29px"></a></div>
                </li>
            </ul>
            <div class="clearfix"></div>
        </div>
        <div class="row imageHeader">
            <div class="row textHeader"></div>
        </div>
        <div class="row">
            <nav class="navbar navbar-inverse" role="navigation">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbarCollapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">Brand</a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="navbarCollapse">
                        <ul class="nav navbar-nav">
                            <li class="home-page"><a href="<c:url value='/home'/>">Home</a></li>
                            <li class="contact-page"><a href="#">Contacts</a></li>
                            <li class="about-page"><a href="#">About</a></li>
                        </ul>
                        <script>
                            var pathName = window.location.pathname.split('/');
                            if(pathName[2] === 'home') {
                                $(".home-page").addClass("active");
                                $(".contact-page").removeClass("active");
                                $(".about-page").removeClass("active");
                            } else if(pathName[2] === 'contacts') {
                                $(".contact-page").addClass("active");
                                $(".home-page").removeClass("active");
                                $(".about-page").removeClass("active");
                            } else if(pathName[2] === 'about') {
                                $(".about-page").addClass("active");
                                $(".home-page").removeClass("active");
                                $(".contact-page").removeClass("active");
                            }
                        </script>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
        </div>
    </div>
</div>  