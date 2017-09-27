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
    <title>我的图书|登录</title>
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
<section id="fh5co-login" data-section="login" data-stellar-background-ratio="0.5" style="background-color: #00ADB5;height:auto;">
    <div class="gradient"></div>
    <div class="container">
        <div class="text-wrap" style="margin-top: 30px;">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="span8 col-md-8">
                    <h1 class="text-center text-primary text-title">平等自愿互换图书协定</h1>
                    <dl class="dl-horizontal">
                        <dt> 1.</dt>
                        <dd>自愿支付磨损费，永不产生纠纷。</dd>

                        <dt> 2.</dt>
                        <dd> 自觉爱护图书，利人利已。</dd>

                        <dt> 3.</dt>
                        <dd> 基于双方平等自愿的情况下进行图书的交换或购买。</dd>

                        <dt>4.</dt>
                        <dd>当甲乙双方进行换书或二手书交换活动时因远距离而产生的运费由双方商议后自行支付，本网站不进行干预亦不承担相关法律责任。</dd>
                        <dt> 5.</dt>
                        <dd> 乙方收到书后请仔细检查图书有无破损，涂改，缺页现象，如图书与简介描述不符，七天内可与甲方联系进行商议，研究后续问题。</dd>

                        <dt> 6.</dt>
                        <dd> 合作方如有一方违反本合同，则其它方有权取消与违约方的合作并追究违约方的法律责任</dd>

                        <dt> 7.</dt>
                        <dd> 其它未尽事宜经双方共同协商后作补充，补充条款同样具有本合同法律效力。</dd>
                        <dt> 8.</dt>
                        <dd> 双方自愿、平等、互助互利的基础签定此协议。</dd>
                    </dl>
                    <small class="textsmall">甲乙双方均承认，已阅读过本协定，并同意：本协定为双方关于合作事宜的所有约定的全部记载，并已取代以前所有的口头的或书面的约定，意向书与建议，未经双方修订，不得对本协定加以变更。</small><br>

                    <input type="checkbox" onclick="xieClick()" id="checkbox-id"/><label class="xielabel" for="checkbox-id"><small>我已阅读该协议,并遵守协议中的内容</small></label>
                    <br>
                    <button class="btn xiebtn" disabled id="xiesub">确定</button>
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
   function xieClick() {
       var s = $("input[type='checkbox']").is(':checked');
       console.log("选择了" +s);
       if(s == true){
           $('#xiesub').attr("disabled", false);
           console.log("欢迎使用书途  书籍是人类进步的阶梯");
       }else if(s == false){
           $('#xiesub').attr("disabled", true);
           $('#xiesub').attr("title","请勾选后进入");

       }
   }

</script>
</body>
</html>