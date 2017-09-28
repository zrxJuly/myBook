<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>我的图书|个人信息</title>
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
    <link rel="stylesheet" href="/book/resource/css/chat.css">
    <link href="/book/resource/css/admin/paper-dashboard.css" rel="stylesheet" />
    <!-- Modernizr JS -->
    <script src="/book/resource/js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
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
                        <li><a href="/book/getConditionBooks.action?condition="><span>热门图书</span></a></li>
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
                <h1 class="animate-box"><span style="font-family:'MS Outlook'"> 个 人 信 息 </span></h1>
            </div>
            <div class="container animate-box">
                <div class="row clearfix">
                    <div class="col-md-3">
                        <img height="200" width="200" class="img-circle center-block" src="${userInfo.image}"/>
                        <br/>
                        <dl class="dl-horizontal">
                            <dt> 昵称：</dt>
                            <dd> ${userInfo.name}</dd>
                            <dt> 联系：</dt>
                            <dd> 站内联系</dd>
                            <dt> 积分：</dt>
                            <dd>${userInfo.integral}</dd>
                        </dl>
                        <blockquote>
                            <p> ${userInfo.intro} </p>
                            <small>注册时间 <cite><fmt:formatDate value="${userInfo.createDate}"
                                                              pattern="yyyy-MM-dd"/> </cite></small>
                        </blockquote>
                        <br/>
                    </div>
                    <div class="col-md-1 column"></div>
                    <div class="col-md-7 column">
                        <div id="fh5co-counter-section" class=" fh5co-services container">
                            <div class="row">
                                <div class="col-md-3 text-center">
                                    <div class="box-services">
                                        <div class="icon animate-box">
                                            <a href="#manage">
                                            <span><i class="fh5co-counter js-counter text-center" data-from="0"
                                                     data-to="${userInfo.sizeHaveBook}" data-speed="500"
                                                     data-refresh-interval="50"></i></span>
                                            </a>
                                        </div>
                                        <div class="fh5co-post animate-box">
                                            <h3>拥有的图书</h3>
                                            <%--<p> 大户 </p>--%>
                                        </div>
                                    </div>
                                    <div class="box-services">
                                        <div class="icon animate-box">
                                            <span><i class="fh5co-counter js-counter text-center" data-from="0"
                                                     data-to="${userInfo.sizeBorrow}" data-speed="500"
                                                     data-refresh-interval="50"></i></span>
                                        </div>
                                        <div class="fh5co-post animate-box">
                                            <h3>阅读的图书</h3>
                                            <%--<p> 大户 </p>--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 text-center">
                                    <div class="box-services">
                                        <div class="icon animate-box">
                                            <span><i class="fh5co-counter js-counter text-center" data-from="0"
                                                     data-to="${userInfo.sizeCollect}" data-speed="500"
                                                     data-refresh-interval="50"></i></span>
                                        </div>
                                        <div class="fh5co-post animate-box">
                                            <h3>收藏的图书</h3>
                                            <%--<p> 大户 </p>--%>
                                        </div>
                                    </div>
                                    <div class="box-services">
                                        <div class="icon animate-box">
                                            <span><i class="fh5co-counter js-counter text-center" data-from="0"
                                                     data-to="${userInfo.sizeComment}" data-speed="500"
                                                     data-refresh-interval="50"></i></span>
                                        </div>
                                        <div class="fh5co-post animate-box">
                                            <h3>评论数量</h3>
                                            <%--<p> 大户 </p>--%>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-md-3 text-center">
                                    <div class="box-services">
                                        <div class="icon animate-box">
                                            <span><i class="fh5co-counter js-counter text-center" data-from="0"
                                                     data-to="${userInfo.sizeReserve}" data-speed="500"
                                                     data-refresh-interval="50"></i></span>
                                        </div>
                                        <div class="fh5co-post animate-box">
                                            <h3>预约的图书</h3>
                                            <%--<p> 大户 </p>--%>

                                        </div>
                                    </div>

                                    <div class="box-services">
                                        <div class="icon animate-box">
                                            <span><i class="fh5co-counter js-counter text-center" data-from="0"
                                                     data-to="" data-speed="500"
                                                     data-refresh-interval="50"></i></span>
                                        </div>
                                        <div class="fh5co-post animate-box">
                                            <h3>我的好友</h3>
                                            <%--<p> 大户 </p>--%>
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

<section id="fh5co-borrow" data-section="hotComment">
    <div class="container">
        <div class="row">
            <div class="col-md-12 section-heading text-center">
                <h1 class="animate-box"><span style="font-family:'MS Outlook'"> 我 的 借 阅 </span></h1>
            </div>
            <div class="container animate-box">
                <c:forEach items="${bookBorrow}" var="book" varStatus="b">
                    <c:if test="${(b.count+2)%3==0}">
                        <div class="row clearfix">
                    </c:if>
                    <div class="col-md-4">
                        <div class="fh5co-portfolio animate-box">
                            <a href="bookDetailedInfo.html">
                                <div class="portfolio-entry" style="background-image: url(${book.image});">
                                    <div class="desc text-center">
                                        <dl style="margin-top: 100px;" class="dl-horizontal center-block">
                                            <dt>借阅时间</dt>
                                            <dd><fmt:formatDate value="${book.borrow.borrowDate}"
                                                                pattern="yyyy-MM-dd"></fmt:formatDate></dd>
                                            <br/>
                                            <dt>应还时间</dt>
                                            <dd><fmt:formatDate value="${book.borrow.returnDate}"
                                                                pattern="yyyy-MM-dd"></fmt:formatDate></dd>
                                        </dl>
                                    </div>
                                </div>
                                <div class="portfolio-text text-center">
                                    <h3 class="center-block">${book.name}</h3>
                                </div>

                            </a>
                            <div class="row portfolio-text text-center">
                                <div class="col-md-6">
                                    <button class="btn-sub" data-toggle="modal" data-target="#myModal">联系下一位</button>
                                </div>
                                <div class="col-md-6">
                                    <button class="btn-sub"
                                            onclick="giveNextBorrow(${book.id})">完成转交
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <c:if test="${b.count%3==0}">
                        </div>
                    </c:if>
                </c:forEach>

            </div>
        </div>
    </div>
</section>

<section id="fh5co-collect" data-section="hotComment">
    <div class="container">
        <div class="row">
            <div class="col-md-12 section-heading text-center">
                <h1 class="animate-box"><span style="font-family:'MS Outlook'"> 我 的 收 藏 </span></h1>
            </div>
            <div class="container animate-box">

                <c:forEach items="${collectBookList}" var="book" varStatus="b">
                    <c:if test="${(b.count+2)%3==0}">
                        <div class="row clearfix">
                    </c:if>
                    <div class="col-md-4">
                        <div class="fh5co-portfolio animate-box">
                            <a href="bookDetailedInfo.html">
                                <div class="portfolio-entry" style="background-image: url(${book.bookImg});">
                                </div>
                                <div class="portfolio-text text-center">
                                    <h3>${book.bookName}</h3>
                                    <p>收藏时间:<fmt:formatDate value="${book.collectDate}"
                                                            pattern="yyyy-MM-dd"></fmt:formatDate></p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <c:if test="${b.count%3==0}">
                        </div>
                    </c:if>
                </c:forEach>

            </div>
        </div>
    </div>
</section>
<section id="fh5co-reserve" data-section="hotComment">
    <a id="manage"></a>
    <div class="container">
        <div class="row">
            <div class="col-md-12 section-heading text-center">
                <h1 class="animate-box"><span style="font-family:'MS Outlook'"> 我 的 图 书 </span></h1>
            </div>
            <div class="container animate-box">
                <c:forEach items="${bookMy}" var="book" varStatus="b">
                    <c:if test="${(b.count+2)%3==0}">
                        <div class="row clearfix">
                    </c:if>
                    <div class="col-md-4">
                        <div class="fh5co-portfolio animate-box" style="margin-bottom: 5px;">
                            <a href="/getBookInfo.action?bookId=${book.id}">
                                <div class="portfolio-entry" style="background-image: url(${book.image});">
                                </div>
                                <div class="portfolio-text text-center">
                                    <%--<h3>${book.name}</h3>此处用于存放书名 不知道为什么此处有324的书名只在第一个--%>
                                    <p>上传时间:<fmt:formatDate value="${book.createDate}"
                                                            pattern="yyyy-MM-dd"></fmt:formatDate></p>
                                </div>
                            </a>
                        </div>
                        <div class="row text-center center-block" style="margin-bottom: 20px;margin-top: 3px;">
                            <button class="mebtn" data-nav-section="manage">
                                修改
                            </button>
                            <button class="mebtn" onclick="deleteBook('${book.id}')">删除
                            </button>
                            <button class="mebtn" data-toggle="modal" data-target="#myModal2"  onclick="clearinput()">
                                更换借阅人
                            </button>
                            <button class="mebtn" data-toggle="modal" data-target="#myModal1"  onclick="clearinput()">
                                申请介入
                            </button>
                            <button class="mebtn" data-toggle="modal" data-target="#myModal3">
                                书途
                            </button>
                        </div>
                    </div>
                    <c:if test="${b.count%3==0}">
                        </div>
                    </c:if>
                </c:forEach>

            </div>
        </div>
    </div>
</section>

<section id="fh5co-mybook" data-section="hotComment">
    <div class="container">
        <div class="row">
            <div class="col-md-12 section-heading text-center">
                <h1 class="animate-box"><span style="font-family:'MS Outlook'"> 我 的 预 约 </span></h1>
            </div>
            <div class="container animate-box">

                <c:forEach items="${reserveBookList}" var="book" varStatus="b">
                    <c:if test="${(b.count+2)%3==0}">
                        <div class="row clearfix">
                    </c:if>
                    <div class="col-md-4">
                        <div class="fh5co-portfolio animate-box">
                            <a href="bookDetailedInfo.html">
                                <div class="portfolio-entry" style="background-image: url(${book.bookImg});">
                                </div>
                                <div class="portfolio-text text-center">
                                    <h3>${book.bookName}</h3>
                                    <p>预约时间:<fmt:formatDate value="${book.reserve.reserveDate}"
                                                            pattern="yyyy-MM-dd"></fmt:formatDate></p>
                                    <p>预约排名:${book.reserve.reserveRanking}</p>

                                </div>
                            </a>
                                <%--<c:if test="${book.reserve.reserveRanking == 1}">--%>

                            <button class="btn-sub-9" onclick="isGiveMe(${book.bookID})">完成转交</button>


                        <%--</c:if>--%>
                        </div>
                    </div>
                    <c:if test="${b.count%3==0}">
                        </div>
                    </c:if>
                </c:forEach>

            </div>
        </div>
    </div>
</section>

<section id="fh5co-manage" class="col-section" data-section="manage">
    <div class="container">
        <div class="row">
            <div class="col-md-12 section-heading text-center">
                <h1 class="animate-box"><span style="font-family:'MS Outlook'"> 图 书 管 理 </span></h1>
            </div>
            <div class="container animate-box">

                <div class="row clearfix">
                    <form id="addOrUpdateBook" action="/book/user/addOrUpdateBook.action" method="post"
                          enctype="multipart/form-data">
                        <div class="col-md-2 col-position">

                            <img id="formBookImg" style="width: 200px;height: 200px;"
                                 src="https://img3.doubanio.com/lpic/s2144391.jpg"
                                 class="img-circle center-block col-img-position"/>
                            <input type="file" id="file" name="file" title="更换图片" class="btn-block"
                                   onchange="readPicture()" id="btnReadPicture"/>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-9">
                            <legend class="text-center" id="formMessage"> 添 加 图 书</legend>
                            <fieldset>
                                <input id="formBookID" hidden="hidden" name="bookID" value="0">
                                <div class="row center-block">
                                    <label class="col-md-2 text-center">书名:</label>
                                    <input id="formBookName" name="name" class="col-md-4" type="text"/>
                                    <label class="col-md-2 text-center">作者:</label>
                                    <input id="formAuthor" name="author" class="col-md-4" type="text"/>
                                </div>
                                <br/>
                                <div class="row center-block" style="margin-bottom: 20px;">
                                    <div class="col-md-2">图书简介</div>
                                    <textarea id="formBookInfo" name="inrtro" class="col-md-10 center-block" rows="7"
                                              placeholder="图书简介"></textarea>
                                </div>
                                <div class="row center-block btn-group " data-toggle="buttons">
                                    <div class="col-md-2">添加类型</div>
                                    <label><input name="status" type="radio" value="1" />流转</label>
                                    <label><input name="status" type="radio" value="2" />交换</label>
                                    <label><input name="status" type="radio" value="3" />售出</label>
                                </div>
                                <div class="row center-block">
                                    <button id="formOperationButton" type="submit"
                                            class="btn-sub-7">添加
                                    </button>


                                </div>
                            </fieldset>
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
<!-- 申请介入模态框（Modal） -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel1">
                    请详细描述原因。
                </h4>
            </div>
            <div class="modal-body">
                <div class="prompting">
                   <ul>
                       <li>尊敬的书途用户，在提交描述时请详细描述图书的状况、原因、图书的使用者。</li>
                       <li>我们的工作人员，会最快的帮您处理。</li>
                   </ul>

                </div>
                <form action="#" id="formid" method="post">
                    <textarea name="yuanyin" class="input textarea inputclear"  placeholder="请在此说明原因" required></textarea>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="applybtn" data-dismiss="modal"  onclick="clearinput()">关闭
                </button>
                <button type="button" class="applybtn" onclick="applebtn()">
                    提交
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 更换预约人模态框（Modal） -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel2">
                    更换当前借阅人
                </h4>
            </div>
            <div class="modal-body modal-scroll">

                <form action="#" id="formid2" method="post">
                    <input type="text" class="input mymodal2input inputclear" placeholder="请输入借阅人账号或者昵称" />
                </form>
                <div>

                    <table class="table table-striped">
                        <thead>
                        <th>ID</th>
                        <th>账号</th>
                        <th>昵称</th>
                        </thead>
                        <tbody>
                        <tr>
                            <td>1</td>
                            <td>1070</td>
                            <td>大傻伟</td>

                        </tr>
                        <tr>
                            <td>2</td>
                            <td>22</td>
                            <td>范大傻</td>

                        </tr>
                        <tr>
                            <td>3</td>
                            <td>555</td>
                            <td>智障柱</td>

                        </tr>

                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="applybtn" data-dismiss="modal" onclick="clearinput()">关闭
                </button>
                <button type="button" class="applybtn" onclick="applebtn()">
                    提交
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 申请介入模态框（Modal） -->
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel3">
                    您的图书的流转状况
                </h4>
            </div>
            <div class="modal-body modal-scroll">
                <table class="table table-striped">
                    <thead>
                    <th>ID</th>
                    <th>借阅人</th>
                    <th>时间</th>
                    <th>图书状况</th>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td>大傻伟</td>
                        <td><span>2017-06-20</span>至<span>2017-07-20</span></td>
                        <td>图书已收到，很好，没有损坏</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>范大傻</td>
                        <td><span>2017-06-20</span>至<span>2017-07-20</span></td>
                        <td>上位借阅人给我时，书籍损坏严重。</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>无情的大D萝莉范大傻</td>
                        <td><span>2017-06-20</span>至<span>2017-07-20</span></td>
                        <td>上位借阅人给我时，书籍损坏严重。</td>

                    </tr>

                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="applybtn" data-dismiss="modal">关闭
                </button>

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
<!-- Modernizr JS -->
<script src="/book/resource/js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
<script src="/book/resource/js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
    function  applebtn() {
        document.getElementById("formid").submit();
    }
</script>
<script>
   function clearinput(){
       $(".inputclear").val("");
   }
</script>
</body>
</html>