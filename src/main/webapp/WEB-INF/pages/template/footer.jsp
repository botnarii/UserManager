<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="footer row">
    <h6>Montreal 2014</h6>

    <spring:url value="/js/jqueryForm.js" var="jqueryForm"/>
    <script src="${jqueryForm}"></script>

    <script type="text/javascript" >
        $(function(){
            $(document).on('submit', '#cartForm', function(e){
                e.preventDefault();
                $.get($(this).attr('action'), $(this).serialize()).done(function(response){
                <%--$.get(${flowExecutionUrl}, $(this).serialize()).done(function(response){--%>
                    var cartBox = $('div.cart-badge');
                    var cartContainer = $('div.cartContainer');
                    var remoteContent = '';
                    if($(cartBox).length != 0) {
                        remoteContent = $('div.cart-badge',response);
                        cartBox.html(remoteContent.html());
                        if($(cartContainer).length != 0) {
                            remoteContent = $('div.cartContainer',response);
                            cartContainer.html(remoteContent.html());
                        }
                    }
                    $("input[type='number']").val("1");
                }).fail(function(){
                    alert('Server error...');
                });
            });
        });

        $(function(){
            $(document).on('click', '.deleteUrl', function(e){
                e.preventDefault();
                var src = '<%=request.getContextPath()%>/images/template/delete.png';
                var image = $('<img src="' + src + '" width=30 height=30/>');
                var deleteUrl = $(this).attr('href');
                var cartBox = $('.badge');
                var cartContainer = $(this).parent();
                var totalPrice = $('span.total-price');
                console.log(cartContainer);
                console.log(cartBox);
                $.get(deleteUrl, function(response){
                    console.log(response);
                    cartBox.html(response[0]);
                    totalPrice.html(response[1]);
                    cartContainer.html(image);
                    console.log(totalPrice);
                });
            });
        });

        $(function(){ // document ready
            var cart = $('div.cart_label');
            var prodList = $('div.menuHeader');
            if (!!cart.offset()) { // make sure ".sticky" element exists

                var stickyTop = cart.offset().top; // returns number
                var stickyBottom = prodList.offset().top;

                $(window).scroll(function(){ // scroll event

                    var windowTop = $(window).scrollTop(); // returns number

                    if (stickyTop < windowTop){
                        cart.css({ position: 'fixed', top: 0 });
                        console.log('top: ' + stickyTop);
                        if(windowTop >= stickyBottom) {
                            cart.css({position: 'relative', right: 0});
                        } else {
                            cart.css({position: 'fixed !important', right: '15px'});
                        }
                        console.log('bottom: ' + stickyBottom);
                        console.log('window: ' + windowTop);
                    }
                    else {
//                        cart.css('position','static');
                        cart.css('top', '55px');
                    }

                });
            }
        });
    </script>

    <spring:url value="/js/bootstrap.js" var="bootstrapJs"/>
    <script src="${bootstrapJs}"></script>
</div>