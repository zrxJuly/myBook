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
    <title>我的图书|注册</title>
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

<section id="fh5co-login" data-section="login" style="background-image: url(/book/resource/images/full_image_4.jpg);"
         data-stellar-background-ratio="0.5">
    <div class="gradient"></div>
    <div class="container">
        <div class="text-wrap">
            <div class="text-inner">
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <h1 class="animate-box text-center"> 注 册 </h1>
                        <form id="register" class="animate-box" action="/book/register.action">
                            <div class="form-group">
                                <input id="account" name="account" class="form-control" placeholder="账号">
                            </div>
                            <div class="form-group">
                                <input id="password" name="password" class="form-control" placeholder="密码">
                            </div>
                            <div class="form-group">
                                <input id="password_next" name="password_next" class="form-control" placeholder="确认密码">
                            </div>
                            <div class="form-group">
                                <input id="nickname" name="name" class="form-control" placeholder="昵称">
                            </div>
                            <div class="form-group text-center">
                                <input type="submit" class="btn btn-info" value="注册"/>
                            </div>
                        </form>
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
<script>
    $(document).ready(function(){
        $("#register").bind("submit", function(){
            var account = $.trim($("#account").attr("value"));
            var password = $.trim($("#password").attr("value"));
            var password_next = $.trim($("#password_next").attr("value"));
            var name = $.trim($("#name").attr("value"));

            var isSuccess = 1;
            if(account.length == 0 || account == '' || account == null)
            {
                $("#account").attr("placeholder","账号不能为空");
                isSuccess = 0;
            }
            if(password.length == 0 || password == '' || password == null)
            {
                $("#password").attr("placeholder","密码不能为空");
                isSuccess = 0;
            }
            if(password != password_next){
                $("#password_next").attr("placeholder","确认密码不能为空");
                isSuccess = 0;
            }
            if(name.length ==0 || name=="" ||name==null){
                $("#nickname").attr("placeholder","昵称不能为空");
                isSuccess = 0;
            }

            if(isSuccess == 0)
            {
                return false;
            }
        })
    });
</script>
</body>
</html>