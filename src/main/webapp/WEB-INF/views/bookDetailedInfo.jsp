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
<html lang="zh-CN" class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>我的图书|图书详情</title>
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
    <!-- Jpages-->
    <link rel="stylesheet" href="/book/resource/css/jPages.css">
    <link rel="stylesheet" href="/book/resource/css/chat.css">


    <!-- Modernizr JS -->
    <script src="/book/resource/js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="/book/resource/js/respond.min.js"></script>
    <![endif]-->
    <script src="/book/resource/js/jquery.min.js"></script>

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
                        <li><a href="/book/hotComment.action"><span>书评</span></a></li>
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
                <h2 class="animate-box"><a href="rankingList.action">${bookInfo.bookName}</a></h2>
                <div class="row">
                    <div class="col-md-8 col-md-offset-2 subtext animate-box">
                        <h3><a>距离: <fmt:formatNumber value="${bookInfo.distance}" type="currency" pattern="0.0"/>米</a>
                            <a href="#">联系书主</a>
                            <a href="getRelevantBooks.action?bookName=${bookInfo.bookName}">查找同类的图书</a>
                        </h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="container animate-box">
            <div class="row clearfix">
                <div class="col-md-5 center-block">
                    <img height="200" width="200" class="img-circle center-block text-center"
                         src="${bookInfo.bookImg}"/>
                    <br/>
                    <dl class="dl-horizontal text-center">
                        <dt> 书名：</dt>
                        <dd> ${bookInfo.bookName}</dd>

                        <dt> 作者：</dt>
                        <dd> ${bookInfo.author}</dd>

                        <dt> 书主：</dt>
                        <dd> ${bookInfo.owner}</dd>
                        <dt> 类型：</dt>
                        <dd> ${bookInfo.identity}</dd>
                    </dl>
                    <blockquote>
                        <p> ${bookInfo.bookInfo} </p>
                        <small>来自本站 <cite>${bookInfo.owner}</cite></small>
                    </blockquote>
                    <div class="row">
                        <c:choose>
                            <c:when test="${isCollect}">
                                <input onclick="reserveORCollect(${bookInfo.bookID},'cancelCollect')" type="button"
                                       class="btn btn-send-message btn-md col-md-4" value="取消收藏">
                            </c:when>
                            <c:otherwise>
                                <input onclick="reserveORCollect(${bookInfo.bookID},'collectBook')" type="button"
                                       class="btn btn-send-message btn-md col-md-4" value="收藏">
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${isReserve}">
                                <input onclick="reserveORCollect(${bookInfo.bookID},'cancelReserve')" type="button"
                                       class="btn btn-send-message btn-md col-md-4" value="取消预约">
                            </c:when>
                            <c:otherwise>
                                <input onclick="reserveORCollect(${bookInfo.bookID},'reserveBook')" type="button"
                                       class="btn btn-send-message btn-md col-md-4" value="预约">

                            </c:otherwise>
                        </c:choose>
                        <input class="btn btn-send-message btn-md col-md-8" data-toggle="modal" data-target="#myModal" value="联系书主">
                        <input onclick="timeline(${bookInfo.bookID})" type="button"
                               class="btn btn-send-message btn-md col-md-8" value="查看书途">
                    </div>
                </div>
                <div class="col-md-7 column">
                    <div class="row">

                        <ul id="itemContainer">
                            <c:forEach items="${commentList}" var="comment">
                                <li>
                                    <div class="col-md-12">
                                        <div class="testimony-entry animate-box">
                                            <div class="feed-bubble">
                                                <p style="color: #1d2263;">${comment.commentInfo}</p>
                                            </div>
                                            <div class="author-img"
                                                 style="background-image: url(${comment.headImg});"></div>
                                            <span class="user">${comment.nickname}<br> <small>${comment.commentDate}</small></span>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>


                        <div class="holder bookeholder"></div>
                    </div>

                    <!-- item container -->

                    <!-- navigation holder -->

                    <form action="/user/submitComment.action" method="post">
                        <div class="row">
                            <div class="form-group">
                                <input hidden="hidden" name="bookID" value="${bookInfo.bookID}">
                                <textarea name="message" class="form-control" id="message" rows="7"
                                          placeholder="请开始你的表演"></textarea>
                            </div>
                            <input type="submit" class="btn btn-default text-center" value="Biu~Biu~Biu~">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    </div>
</section>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="clearCheck()">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel"> 聊天中 </h4>
            </div>
            <div class="modal-body">
                <div id="convo" data-from="Sonu Joshi">
                    <ul class="chat-thread">
                    </ul>
                </div>
                <div style="text-align:center;clear:both">
                </div>
            </div>
            <div class="modal-footer">
                <textarea id="chat-textarea" rows="4" cols="60" name="chat-textarea name" maxlength="150" autofocus
                          style="width: 100%;" class="timeline-textarea"></textarea>
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="clearCheck()">关闭</button>
                <button type="button" class="btn btn-primary" onclick="check()">发送</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
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

    //查看图书传阅历史记录.
    function timeline(bookID) {
        window.location.href = "timeline.action?bookID=" + bookID;
    }

    // 联系书主
    function contactOwner() {

    }

    //预约 取消预约 收藏 取消收藏
    function reserveORCollect(bookID, operation) {
        window.location.href = "/book/user/reserveORCollect.action?bookID=" + bookID + "&operation=" + operation;
        //location.reload(true);
    }

</script>
<script src="/book/resource/js/jPages.js"></script>
<script>
    $(function () {

        $("div.holder").jPages({
            containerID: "itemContainer",
            perPage: 2,
            startPage: 1,
            startRange: 1,
            midRange: 5,
            endRange: 1
        });

    });

    //每次打开都要将li清空
    function clearCheck() {
        $('#convo').children('ul').empty();
        $('#chat-textarea').val('');
    }

    var user = 0;
    <c:if test="${sessionScope.user!=null}">
    user = ${sessionScope.user};
    </c:if>

    console.log("user = " + user);
    if (user != 0) {
        var ws = new WebSocket("ws://localhost:8080/book/webSocketOneToOne?user=" + user);
        /*
         *监听三种状态的变化 。js会回调
         */
        ws.onopen = function (message) {
            console.log('websocket is open');
        };
        ws.onclose = function (message) {
            console.log('websocket is close');
        };
        ws.onmessage = function (message) {
            console.log('message = ' + message.data);
            var ul = $('#convo').children('ul');
            var mes = $('#chat-textarea').val();
            $("<li name='other'>" + message.data + "</li>").appendTo(ul);
        };
        //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
        window.onbeforeunload = function () {
            ws.close();
        };
    } else {
        var ul = $('#convo').children('ul');
        var mes = $('#chat-textarea').val();
        $("<li name='me'> 您还没有登录 </li>").appendTo(ul);
    }


    //关闭连接
    function closeWebSocket() {
        ws.close();
    }

    //发送消息
    function send(message) {
        ws.send(message);
    }

    // 动态添加li
    function check() {
        var ul = $('#convo').children('ul');
        var mes = $('#chat-textarea').val();
        $("<li name='me'>" + mes + "</li>").appendTo(ul);
        // websocket
        var message = "{'fromId':" + user + ",'toId':2,'message':'" + mes + "'}";
        send(message);
        $('#chat-textarea').val('');
    }

    //动态添加css样式
    var css = function (t, s) {
        s = document.createElement('style');
        s.innerText = t;
        document.body.appendChild(s);
    };
    //添加css样式
    css('.chat-thread li[name=\'me\']:before{background-image:url(/resource/images/users/1.jpg)');
    css('.chat-thread li[name=\'other\']:before{background-image:url(data:image/jpeg;base64,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);}');


</script>
</body>
</html>