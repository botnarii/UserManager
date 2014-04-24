<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div style="padding: 50px; border: 1px solid #ff0000">
    <h2>Our Products</h2>
    <table>
        <c:forEach var="product" items="${products}">
            <tr>
                <td>${product.description}</td>
                <td class="numeric">${product.unitPrice}</td>
                <td>
                    <form method="get">
                        <input type="text" value="1" size="5" name="addQty" />
                        <a href="<c:url value="/addToCart?productId=${product.productId}"/>"> [add to cart]</a>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>