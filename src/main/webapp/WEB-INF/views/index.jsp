<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>
<html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>
<html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>我的图书</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Template by FreeHTML5.co"/>
    <meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive"/>

    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content=""/>
    <meta name="twitter:image" content=""/>
    <meta name="twitter:url" content=""/>
    <meta name="twitter:card" content=""/>

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="shortcut icon" href="/book/resource/images/favicon.ico">

    <link href="https://fonts.googleapis.com/css?family=Roboto+Mono:300,400" rel="stylesheet">

    <!-- Animate.css -->
    <link rel="stylesheet" href="/book/resource/css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="/book/resource/css/icomoon.css">
    <!-- Simple Line Icons -->
    <link rel="stylesheet" href="/book/resource/css/simple-line-icons.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="/book/resource/css/bootstrap.css">
    <!-- Style -->
    <link rel="stylesheet" href="/book/resource/css/style.css">


    <!-- Modernizr JS -->
    <script src="/book/resource/js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="/book/resource/js/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<header role="banner" id="fh5co-header">
    <div class="container">
        <div class="row">
            <nav class="navbar navbar-default navbar-fixed-top">
                <div class="navbar-header">
                    <!-- Mobile Toggle Menu Button -->
                    <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse"
                       data-target="#navbar" aria-expanded="false" aria-controls="navbar"><i></i></a>
                    <a class="navbar-brand" href="/book/index.action">书途.</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="#" title="首页" data-nav-section="index"><span>首页</span></a></li>
                        <!--<li><a href="#" data-nav-section="services"><span>隐藏页面</span></a></li>-->
                        <li><a href="#" title="热门图书" data-nav-section="popBooks"><span>热门图书</span></a></li>
                        <li><a href="#" title="书评" data-nav-section="hotReview"><span>热门评论</span></a></li>
                        <!--<li><a href="#" data-nav-section="pricing"><span>排行榜</span></a></li>-->
                        <li><a href="#" title="活跃用户" data-nav-section="activeUser"><span>活跃用户</span></a></li>
                        <% if(session.getAttribute("user")!=null){%>
                            <li><a class="external" href="/book/user/meInfo.action" title="我的"><span>我的</span></a></li>
                            <script>
                                sessionStorage.setItem("user",<%session.getAttribute("user");%>);
                            </script>
                        <% }else{ %>
                            <li><a href="#" title="登录" data-nav-section="login"><span>登录</span></a></li>
                        <% } %>
                        <li><a href="#" title="联系我们" data-nav-section="contactUs"><span>联系我们</span></a></li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</header>

<section id="fh5co-home" data-section="index" style="background-image: url(/book/resource/images/full_image_8.jpg);"
         data-stellar-background-ratio="0.5">
    <div class="gradient"></div>
    <div class="container ">
        <div class="text-wrap">
            <div class="text-inner">
                <div class="row pull-right">
                    <div class="col-md-12 text-center">
                        <h1 class="animate-box"><span class="big">关于漂泊的一切</span> <br><span>像发现宝藏一样发现你身边的图书吧!</span> <br><span
                                class="medium"></span><br><span>献给长成了大人的孩子们</span> <br> <span
                                class="medium">为你，千千万万遍</span>
                        </h1>
                        <h2 class="animate-box">谁解其中味？<a href="#" target="_blank"
                                                         title="Free HTML5 Bootstrap Templates"
                                                         class="fh5co-link">不必追</a></h2>
                        <div class="call-to-action" style="margin-bottom: 20px;">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section id="fh5co-explore" class="fh5co" data-section="popBooks">
    <div class="container">
        <div class="row">
            <div class="col-md-12 section-heading text-center">
                <h2 class="animate-box"><a href="getConditionBooks.action?condition=">热 门 图 书</a></h2>
                <div class="row">
                    <div class="col-md-8 col-md-offset-2 subtext animate-box">
                        <h3>点击查看我们将为你提供最热门的图书</h3>
                    </div>
                </div>
                <div class="input-group animate-box">
                    <input type="text" id="conditionBook" class="form-control input-lg" placeholder="请输入搜索的条件" onkeydown="user()">
                    <a onclick="getConditionBooks()" class="input-group-addon btn btn-large btn-primary">
                        <span> 嗖 ~ </span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="fh5co-project">
        <div class="container">
            <div class="row">
                <c:forEach items="${hotBooks}" var="book">
                    <div class="col-md-4">
                        <div class="fh5co-portfolio animate-box">
                            <a href="getBookInfo.action?bookId=${book.bookID}&distance=${book.distance}">
                                <div class="portfolio-entry" style="background-image: url(${book.bookImg});">
                                    <div class="desc text-center">
                                        <p>距离: ${book.distance}</p>
                                        <p style="margin-top: auto;">${book.bookInfo}</p>
                                        <br/>
                                        <p class="text-right"> --作者：${book.author}</p>
                                    </div>
                                </div>
                                <div class="portfolio-text text-center">
                                    <h3>${book.bookName}</h3>
                                    <ul class="stuff">
                                        <li><i class="icon-heart2"></i>${book.collectSize}</li>
                                        <li><i class="icon-eye2"></i>${book.borrowSize}</li>
                                        <li><i class="icon-comment"></i>${book.commentSize}</li>
                                    </ul>
                                </div>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="copyrights">山东商业职业技术学院<a href="#" title="我的图书">我的图书</a></div>
        <div id="fh5co-counter-section" class="fh5co-counters">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3 animate-box text-center">
                        <h2 class="h2lable">站 内 信 息</h2>
                        <br>
                    </div>
                </div>
                <div class="row animate-box">
                    <div class="col-md-3 text-center">
                    <span class="fh5co-counter js-counter" data-from="0" data-to="${bookSize}" data-speed="5000"
                          data-refresh-interval="50"></span>
                        <span class="fh5co-counter-label">藏书量</span>
                    </div>
                    <div class="col-md-3 text-center">
                    <span class="fh5co-counter js-counter" data-from="0" data-to="${userSize}" data-speed="5000"
                          data-refresh-interval="50"></span>
                        <span class="fh5co-counter-label">注册用户</span>
                    </div>
                    <div class="col-md-3 text-center">
                    <span class="fh5co-counter js-counter" data-from="0" data-to="${borrowSize}" data-speed="5000"
                          data-refresh-interval="50"></span>
                        <span class="fh5co-counter-label">借阅量</span>
                    </div>
                    <div class="col-md-3 text-center">
                    <span class="fh5co-counter js-counter" data-from="0"
                          data-to="${applicationScope.get("OnlineCount")}" data-speed="5000"
                          data-refresh-interval="50"></span>
                        <span class="fh5co-counter-label">在线用户</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section id="fh5co-testimony" class="fh6co" data-section="hotReview">
    <div class="container">
        <div class="row">
            <div class="col-md-12 section-heading text-center">
                <h2 class="animate-box"><a href="hotComment.html"><span>热 门 书 评</span></a></h2>
                <div class="row">
                    <div class="col-md-8 col-md-offset-2 subtext animate-box">
                        <h3>显示最热门的书评</h3></div>
                </div>
                <div class="input-group animate-box">
                    <input type="text" id="conditionComment" class="form-control input-lg" placeholder="请输入搜索的条件" onkeydown="review()">
                    <a onclick="getConditionComment()" class="input-group-addon btn btn-large btn-primary">
                        <span> 嗖 ~ </span>
                    </a>
                </div>
            </div>
        </div>

        <c:forEach items="${commentList}" var="comment" varStatus="com">
            <c:if test="${(com.count+2)%3==0}">
                <div class="row">
            </c:if>
            <div class="col-md-4">
                    <%-- 第三列的评论--%>
                <div class="testimony-entry animate-box">
                    <div class="feed-bubble" style="background-color: #3DBD9A">
                        <p style="color: #FFFFFF">${comment.commentInfo}</p>
                    </div>
                    <div class="author-img" style="background-image: url(${comment.headImg});"></div>
                    <span class="user">${comment.nickname}<br> <small>${comment.commentDate}</small></span>
                </div>
            </div>
            <c:if test="${com.count%3==0}">
                </div>
            </c:if>
        </c:forEach>
    </div>
</section>
<section id="fh5co-blog"  class="fh7co" data-section="activeUser">
    <div class="fh5co-blog">
        <div class="container">
            <div class="row">
                <div class="col-md-12 section-heading text-center">
                    <h2 class="animate-box"><a href="activeUser.action"><span>活跃用户</span></a></h2>
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2 subtext">
                            <h3 class="animate-box">在这里将显示最活跃的用户，图书最多的用户 </h3>
                        </div>
                    </div>
                    <div class="input-group animate-box">
                        <input type="text" id="conditionUser" class="form-control input-lg" placeholder="请输入搜索的条件" onkeydown="keyLogin()">
                        <a onclick="getConditionUser()" class="input-group-addon btn btn-large btn-primary">
                            <span> 嗖 ~ </span>
                        </a>
                    </div>
                </div>
            </div>

            <div class="row">
                <c:forEach items="${activeUser}" var="user">
                    <div class="col-md-4 animate-box blog">
                        <a href="/book/getUserInfo.action?userID=${user.userID}" class="entry">
                            <div class="blog-bg" style="background-image: url(${user.headImg});">
                                <div class="date">
                                    <span><fmt:formatDate value="${user.createDate}" type="both" pattern="dd"/></span>
                                    <small><fmt:formatDate value="${user.createDate}" type="both"
                                                           pattern="MMM"/></small>
                                </div>
                                <div class="desc">
                                    <p>${user.intro}</p>
                                </div>
                            </div>
                            <div class="desc-grid text-center">
                                <h2>${user.nickname}</h2>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>


<% if(session.getAttribute("user")==null){%>
<section id="fh5co-login" data-section="login" style="background-image: url(/book/resource/images/full_image_4.jpg);"
         data-stellar-background-ratio="0.5">
    <div class="gradient"></div>
    <div class="container">
        <div class="text-wrap">
            <div class="text-inner">
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <h1 class="animate-box text-center"> 登 录 </h1>
                        <form class="animate-box" action="/book/login.action" method="POST">
                            <div class="form-group">
                                <input name="account" class="form-control" placeholder="用户名">
                            </div>
                            <div class="form-group">
                                <input type="password" name="password" class="form-control" placeholder="密码">
                            </div>
                            <div class="form-group text-center">
                                <input type="submit" class="btn btn-default" value="登录"/>
                                <input type="button" class="btn btn-info" value="注册"/>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-"></div>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    sessionStorage.setItem("user",<%session.getAttribute("user");%>);
</script>
<% }else{ %>
<section id="signnow" data-section="login" style="background-image: url(/book/resource/images/full_image_4.jpg);"
         data-stellar-background-ratio="0.5">
    <div class="gradient"></div>
    <div class="container">
        <div class="text-wrap">
            <div class="text-inner">
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <h1 class="animate-box text-center"> 登 录 </h1>
                        <form class="animate-box" action="/book/login.action" method="POST">
                            <div class="form-group">
                                <input name="account" class="form-control" placeholder="用户名">
                            </div>
                            <div class="form-group">
                                <input type="password" name="password" class="form-control" placeholder="密码">
                            </div>
                            <div class="form-group text-center">
                                <input type="submit" class="btn btn-default" value="登录"/>
                                <input type="button" class="btn btn-info" value="注册"/>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-"></div>
                </div>
            </div>
        </div>
    </div>
</section>
<% } %>
<section id="fh5co-contactUs" data-section="contactUs">
    <div id="fh5co-footer" role="contentinfo">
        <div class="container">
            <div class="row">
                <div class="col-md-4 animate-box">
                    <h3 class="section-title">本站简介</h3>
                    <p>我们致力于为用户提供更加良好的服务，虽然我们前期会遇到很多的问题，但是我们都会积极的解决的。希望您能将您希望我们改进的地方，我们的不足之处
                        还有您在使用出现的问题，及时的反馈给我们，我们会积极的修正的。</p>
                    <br>
                    <p>如果您想使用本平台体验新奇的读书体验，我们希望您遵守 <a href="/stipulations.action">本站公约</a></p>
                </div>

                <div class="col-md-4 animate-box">
                    <h3 class="section-title">关于我们</h3>
                    <ul class="contact-info">
                        <li><i class="icon-map"></i>创建于2017-08-09</li>
                        <li><i class="icon-phone"></i>+ 1235 2355 98</li>
                        <li><i class="icon-envelope"></i><a href="#">info@yoursite.com</a></li>
                        <li><i class="icon-globe"></i><a href="#">www.book.com</a></li>
                    </ul>
                    <h3 class="section-title">关注我们</h3>
                    <ul class="social-media">
                        <li><a href="#" class="facebook"><i class="icon-weibo"></i></a></li>
                        <li><a href="#" class="twitter"><i class="icon-qq"></i></a></li>
                        <li><a href="#" class="dribbble"><i class="icon-wechat"></i></a></li>
                        <li><a href="#" class="github"><i class="icon-send"></i></a></li>
                    </ul>
                </div>
                <div class="col-md-4 animate-box">
                    <h3 class="section-title">描述你的问题</h3>
                    <form class="contact-form">
                        <div class="form-group">
                            <input type="name" class="form-control" id="name" placeholder="怎么称呼">
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control" id="email" placeholder="怎么联系你">
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" id="message" rows="7" placeholder="你有什么问题"></textarea>
                        </div>
                        <div class="form-group">
                            <input type="submit" id="btn-submit" class="btn btn-send-message btn-md"
                                   value="Biu~Biu~Biu~">
                        </div>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <p class="copy-right">&copy; 2017年创建，所有权由我们自己保留，不要侵权，因为侵权之后我们也不知道怎么办
                        <a href="#" target="_blank" title="我的图书">我的图书</a> - 来自于
                        <a href="#" target="_blank" title="我的图书">我的图书</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- jQuery -->
<script src="/book/resource/js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="/book/resource/js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="/book/resource/js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="/book/resource/js/jquery.waypoints.min.js"></script>
<!-- Stellar Parallax -->
<script src="/book/resource/js/jquery.stellar.min.js"></script>
<!-- Counters -->
<script src="/book/resource/js/jquery.countTo.js"></script>
<!-- Main JS (Do not remove) -->
<script src="/book/resource/js/main.js"></script>
<script type="text/javascript">
    //    TODO: 去除当前页面的登录区域
    var clickMenu = function () {

        $('#navbar a:not([class="external"])').click(function (event) {
            var section = $(this).data('nav-section'),
                navbar = $('#navbar');

            if ($('[data-section="' + section + '"]').length) {
                $('html, body').animate({
                    scrollTop: $('[data-section="' + section + '"]').offset().top - 55
                }, 500);
            }

            if (navbar.is(':visible')) {
                navbar.removeClass('in');
                navbar.attr('aria-expanded', 'false');
                $('.js-fh5co-nav-toggle').removeClass('active');
            }

            event.preventDefault();
            return false;
        });

    };
    $(function () {
        clickMenu();
    });

    //根据条件查询图书
    function getConditionBooks() {
        var condition = $("#conditionBook").val();
        window.location.href = "/book/getConditionBooks.action?condition=" + condition;
    }

    //根据条件查询评论
    function getConditionComment() {
        var condition = $("#conditionComment").val();
        window.location.href = "/book/getConditionComment.action?condition=" + condition;
    }

    //根据条件查找用户
    function getConditionUser() {
        var condition = $("#conditionUser").val();
        window.location.href = "/book/getConditionUser.action?condition=" + condition;
    }

    // 获取用户的地理位置
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition, showError);
    } else {
        console.log("无法获取用户的地理位置");
    }

    function showError(error) {
        var message = '';
        switch (error.code) {
            case error.PERMISSION_DENIED:
                message = "用户不允许地理定位";
                break;
            case error.POSITION_UNAVAILABLE:
                message = "无法获取当前位置";
                break;
            case error.TIMEOUT:
                message = "操作超时";
                break;
            default:
                message = "一个未知错误发生" ;
                break;
        }
        console.log("message = " + message);
    }

    function showPosition(position) {
        var latitude = position.coords.latitude;
        var longitude = position.coords.longitude;
        $.ajax({
            type: 'GET',
            url: '/book/getPosition.action',
            data: {latitude: latitude, longitude: longitude},
            success: function (data) {
                console.log(data);
            },
            error: function (data) {
                alert(data.message);
            }

        });
    }
</script>
</body>
<script language="JavaScript">
    function keyLogin(){
        if (event.keyCode==13)  //回车键的键值为13
        {
            getConditionUser();
        }
    }
    function review(){
        if (event.keyCode==13)  //回车键的键值为13
        {
            getConditionComment();
        }
    }
    function user(){
        if (event.keyCode==13)  //回车键的键值为13
        {
            getConditionBooks();
        }
    }
</script>
</html>

