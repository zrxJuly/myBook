<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
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
                        <li><a href="/book/rankingList.action"><span>热门图书</span></a></li>
                        <li><a href="#" data-nav-section="hotComment"><span>书评</span></a></li>
                        <li><a href="/book/activeUser.action"><span>活跃用户</span></a></li>
                        <li><a href="#"><span>联系我们</span></a></li>
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
                <h1 class="animate-box"><span style="font-family:'MS Outlook'">${userInfo.nickname}的个人信息</span></h1>
            </div>
            <div class="container animate-box">
                <div class="row clearfix">
                    <div class="col-md-3">
                        <img height="200" width="200" class="img-circle center-block" src="${userInfo.headImg}"/>
                        <br/>
                        <dl class="dl-horizontal">
                            <dt> 昵称：</dt>
                            <dd> ${userInfo.nickname}</dd>
                            <dt> 联系：</dt>
                            <dd> 站内联系</dd>
                        </dl>
                        <blockquote>
                            <p> ${userInfo.intro} </p>
                            <small>注册时间 <cite><fmt:formatDate value="${userInfo.createDate}" pattern="yyyy-MM-dd"/> </cite></small>
                        </blockquote>
                        <%--<input type="button" class="btn btn-send-message btn-md" value="收藏">--%>
                        <%--<input type="button" class="btn btn-send-message btn-md" value="预约">--%>
                        <br/>
                    </div>
                    <div class="col-md-1 column"></div>
                    <div class="col-md-7 column">
                        <div id="fh5co-counter-section" class=" fh5co-services container">
                            <div class="row">
                                <div class="col-md-3 text-center">
                                    <div class="box-services">
                                        <div class="icon animate-box" >
                                            <a href="/book/getUserHaveBook.action?userID=${userInfo.userID}&nickname=${userInfo.nickname}"><span><i class="fh5co-counter js-counter text-center" data-from="0" data-to="${haveSize}" data-speed="500"
                                                     data-refresh-interval="50"></i></span></a>
                                        </div>
                                        <div class="fh5co-post animate-box">
                                            <h3>拥有的图书</h3>
                                            <p> 大户 </p>
                                        </div>
                                    </div>
                                    <div class="box-services">
                                        <div class="icon animate-box">
                                            <span><i class="fh5co-counter js-counter text-center" data-from="0" data-to="${borrowSize}" data-speed="500"
                                                     data-refresh-interval="50"></i></span>
                                        </div>
                                        <div class="fh5co-post animate-box">
                                            <h3>阅读的图书</h3>
                                            <p> 大户 </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 text-center">
                                    <div class="box-services">
                                        <div class="icon animate-box">
                                            <span><i class="fh5co-counter js-counter text-center" data-from="0" data-to="${commentSize}" data-speed="500"
                                                     data-refresh-interval="50"></i></span>
                                        </div>
                                        <div class="fh5co-post animate-box">
                                            <h3>评论数量</h3>
                                            <p> 大户 </p>
                                        </div>
                                    </div>

                                    <div class="box-services">
                                        <div class="icon animate-box">
                                            <span><i class="fh5co-counter js-counter text-center" data-from="0" data-to="${collectSize}" data-speed="500"
                                                     data-refresh-interval="50"></i></span>
                                        </div>
                                        <div class="fh5co-post animate-box">
                                            <h3>收藏数量</h3>
                                            <p> 大户 </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 text-center">
                                    <div class="box-services">
                                        <div class="icon animate-box">
                                            <span><i class="fh5co-counter js-counter text-center" data-from="0" data-to="${borrowNowSize}" data-speed="500"
                                                     data-refresh-interval="50"></i></span>
                                        </div>
                                        <div class="fh5co-post animate-box">
                                            <h3>当前借阅的数量</h3>
                                            <p> 大户 </p>
                                        </div>
                                    </div>

                                    <div class="box-services">
                                        <div class="icon animate-box">
                                            <span><i class="icon-screen-desktop"></i></span>
                                        </div>
                                        <div class="fh5co-post animate-box">
                                            <h3>收藏的图书</h3>
                                            <p> 什么 </p>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
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

</div>
</body>
</html>