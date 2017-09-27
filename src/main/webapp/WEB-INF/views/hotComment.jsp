<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>
<html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>
<html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html lang="zh-CN" class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>我的图书|热门评论</title>
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
                    <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse"
                       data-target="#navbar" aria-expanded="false" aria-controls="navbar"><i></i></a>
                    <a class="navbar-brand" href="／book/index.action">书途.</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/book/index.action">首页</a></li>
                        <li><a href="/book/rankingBook.action" data-nav-section="popBooks"><span>热门图书</span></a></li>
                        <li><a href="#"><span>书评</span></a></li>
                        <li><a href="/book/activeUser.action"><span>活跃用户</span></a></li>
                        <li><a href="/book/index.action"><span>联系我们</span></a></li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</header>

<section id="fh5co-explore" data-section="hotComment">
    <div class="container">
        <div class="row">
            <div class="col-md-12 section-heading text-center">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2 subtext animate-box">为您找到如下书评</div>
                </div>
                <div class="input-group animate-box">
                    <input type="text" id="conditionBook" class="form-control input-lg" placeholder="请输入搜索的条件">
                    <a onclick="getConditionBooks()" class="input-group-addon btn btn-large btn-primary">
                        <span> 嗖 ~ </span>
                    </a>
                </div>
            </div>
            <c:forEach items="${conditionComment}" var="comment" varStatus="c">
                <c:if test="${(c.count+2)%3==0||c.first}">
                    <div class="row">
                </c:if>
                <div class="col-md-4">
                    <div class="testimony-entry animate-box">
                        <div class="feed-bubble">
                            <p style="color: #1d2263;">${comment.commentInfo}</p>
                        </div>
                        <div class="author-img" style="background-image: url(${comment.headImg});"></div>
                        <span class="user">${comment.nickname}<br> <small></small><br><small>${comment.commentDate}</small></span>
                    </div>
                </div>
                <c:if test="${c.end||c.count%3==0}">
                    </div>
                </c:if>
            </c:forEach>
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

</body>
</html>