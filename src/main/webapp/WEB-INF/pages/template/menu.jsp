<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="optionSideMenu" class="col-lg-3 col-md-3 visible-lg visible-md">
    <div class="sideMenuHeader"></div>
    <div class="list-group">
        <form:form action="update-product-cart" commandName="productModel" method="post">
        <div class="list-group-item">
            <h4 class="list-group-item-heading">Screen Size</h4>
                <p class="list-group-item-text"><form:checkbox value="13" name="inch13" id="inch13" path="screen"/> 13 Inches and Smaller</p>
                <p class="list-group-item-text"><form:checkbox value="14" name="inch14" id="inch14" path="screen"/> 14 Inches</p>
                <p class="list-group-item-text"><form:checkbox value="15" name="inch15" id="inch15" path="screen"/> 15 Inches</p>
                <p class="list-group-item-text"><form:checkbox value="16" name="inch16" id="inch16" path="screen"/> 16 Inches</p>
                <p class="list-group-item-text"><form:checkbox value="17" name="inch17" id="inch17" path="screen"/> 17 Inches</p>
                <p class="list-group-item-text"><form:checkbox value="18" name="inch18" id="inch18" path="screen"/> 18 Inches and Larger</p>
        </div>
            <input type="submit" name="go" value="go">
        <%--<div class="list-group-item">--%>
            <%--<h4 class="list-group-item-heading">Current Offers</h4>--%>
            <%--<p class="list-group-item-text"><input type="checkbox" name="onsale" id="onsale"> On sale</p>--%>
            <%--<p class="list-group-item-text"><input type="checkbox" name="onclearance" id="onclearance"> On clearance</p>--%>
            <%--<p class="list-group-item-text"><input type="checkbox" name="refurb" id="refurb"> Refurbished</p>--%>
            <%--<p class="list-group-item-text"><input type="checkbox" name="instore" id="instore"> In store</p>--%>
            <%--<p class="list-group-item-text"><input type="checkbox" name="webonly" id="webonly"> Web only</p>--%>
        <%--</div>--%>
        <%--<div class="list-group-item">--%>
            <%--<h4 class="list-group-item-heading">Status</h4>--%>
            <%--<p class="list-group-item-text"><input type="checkbox"> What's new</p>--%>
        <%--</div>--%>
        <%--<div class="list-group-item">--%>
            <%--<h4 class="list-group-item-heading">Brands</h4>--%>
            <%--<p class="list-group-item-text"><input type="checkbox"> Acer</p>--%>
            <%--<p class="list-group-item-text"><input type="checkbox"> Apple</p>--%>
            <%--<p class="list-group-item-text"><input type="checkbox"> Asus</p>--%>
            <%--<p class="list-group-item-text"><input type="checkbox"> Del</p>--%>
            <%--<p class="list-group-item-text"><input type="checkbox"> Lenovo</p>--%>
            <%--<p class="list-group-item-text"><input type="checkbox"> Samsung</p>--%>
        <%--</div>--%>
        <%--<div class="list-group-item">--%>
            <%--<h4 class="list-group-item-heading">Price</h4>--%>
            <%--<p class="list-group-item-text"><input type="checkbox"> 200 - 299</p>--%>
            <%--<p class="list-group-item-text"><input type="checkbox"> 300 - 399</p>--%>
            <%--<p class="list-group-item-text"><input type="checkbox"> 400 - 499</p>--%>
            <%--<p class="list-group-item-text"><input type="checkbox"> 500 - 599</p>--%>
            <%--<p class="list-group-item-text"><input type="checkbox"> 600 - 699</p>--%>
            <%--<p class="list-group-item-text"><input type="checkbox"> 700 - 799</p>--%>
            <%--<p class="list-group-item-text"><input type="checkbox"> 800 and up</p>--%>
        <%--</div>--%>
        </form:form>
    </div>
</div>