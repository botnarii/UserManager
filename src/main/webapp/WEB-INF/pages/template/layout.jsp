<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title><tiles:getAsString name="title"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style type="text/css">
        body {
            font-family: Arial, Verdana, sans-serif;
        }

        #product-header {
            font-weight: bold;
            margin-left: 5%;
            font-size: 24px;
            line-height: 30px;
        }

        .product-panel {
            margin: 5px 10px;
        }

        .product-price h1 {
            font-weight: bold;
            line-height: normal;
            font-size: 30px;
        }

        .listing-control-wrapper {
            border-top: 1px solid #c9c9c9;
            font-size: 12px;
            padding: 10px 0;
            max-width: 940px;
            margin-left: 15px;
        }

        .listing-row {
            border-top: 1px solid #c9c9c9;
        }

        .grid-view {
            width: 260px;
            height: 500px;
            list-style: none;
            margin-right: 4%;
        }

        .product-item {
            width: 245px;
            height: 450px;
            border: 1px dotted #c9c9c9;
            position: relative;
        }

        .container-fluid {
            padding: 0 15px;
        }

        .imageHeader {
            background-image: url("images/template/main_header_bg.png");
            height: 300px;
        }

        .menuHeader {
            height: 50px;
            background: #808080;
        }

        .menuHeader {

        }

        .sideMenuHeader {
            width: 100%;
            height: 100px;
            background: #C9C9C9 url("images/template/sideMenu.png") no-repeat;
        }

        .optionMenu {
            background: #C9C9C9;
            padding: 15px;
            margin-top: 10px;
        }

        .numeric {
            padding: 0;
            margin: 0;
            font-weight: bold;
        }

        .product_label {
            width: 242px;
            font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
            font-size: 14px;
            line-height: 1.42857143;
            color: #353535;
            margin-bottom: 10px;
            padding: 10px;
        }
        .addressBox {
            width: 450px;
            margin: 0;
            padding: 10px;

        }

        .currentAddr {
            border: none;
            margin-bottom: 20px;
            padding: 0;
        }

        .cart_label {
            background: url("images/template/cart-icon.png") no-repeat;
            width: 255px;
            height: 140px;
            padding: 10px;
            right: 15px;
            top: 55px;
        }

        #checkout {
            background: url("images/template/checkout.png") no-repeat;
            height: 40px;
            margin: 0 auto;
            padding: 9px 0 0 0;
        }

        #checkout a {
            color: #ffffff;
            font-weight: bold;
            text-decoration: none;
        }

        .checkoutUrl {
            background: #240607;
            width: 70px;
            margin-top: 28px;
        }

        #shoppingCartCounter {
            margin: 45px 0 10px 61%;
            font-weight: bold;
            text-align: left;
        }

        .cart_label {
            position: fixed;
            z-index: 1001;
        }

        #optionSideMenu {
            margin-top: 2px;
            max-width: 30%;
            min-width: 20%
        }

        .product-header {
            color: #363636;
            font-weight: bold;
        }

        .userPanel {
            width: 100%;
            height: 40px;
            position: fixed;
            z-index: 5000;
            background: #ffffff;
        }

        .cart-badge {

        }
    </style>

    <spring:url value="/css/bootstrap.css" var="bootstrap"/>
    <spring:url value="/css/bootstrap-theme.css" var="bootstrapTheme"/>
    <spring:url value="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" var="ajax"/>

    <link href="${bootstrap}" rel="stylesheet" type="text/css">
    <link href="${bootstrapTheme}" rel="stylesheet" type="text/css">

    <script src="${ajax}"></script>
    <script>
        $(document).ready(function(){
            $(".slidingDiv").hide();
            $("#show").click(function() {
                $(".slidingDiv").show(1000, function(){
                    console.log('Paragraph is shown.');
                });
            });

            $("#hide").click(function() {
                $(".slidingDiv").hide(1000, function(){
                    console.log('Paragraph is hidden.');
                });
            });

            $("#toggle").click(function() {
                $(".slidingDiv").toggle(1000);
            });

        });
    </script>
</head>
<body>
<div class="container-fluid">
    <tiles:insertAttribute name="header" />
    <div class="main row">
        <div class="container-fluid">
            <tiles:insertAttribute name="menu" />
            <%--<div class="rightPane">--%>
            <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12" style="margin-top: 2px;">
                <tiles:insertAttribute name="body" />
            </div>
        </div>
    </div>
    <tiles:insertAttribute name="footer" />
</div>
</body>
</html>