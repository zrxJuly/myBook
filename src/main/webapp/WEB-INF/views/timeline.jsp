<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>图书传阅历史</title>

    <!-- Style -->
    <link rel="stylesheet" href="/book/resource/css/bootstrap.css">
    <link rel="stylesheet" href="/book/resource/css/styletime.css">
    <link rel="stylesheet" href="/book/resource/css/animate.css">
    <link rel="stylesheet" href="/book/resource/css/jPages.css">
    <link rel="stylesheet" href="/book/resource/css/chat.css">
    <script src="/book/resource/js/jquery.min.js"></script>
    <script src="/book/resource/js/bootstrap.min.js"></script>
</head>
<body>
<div class="timeline">
    <ul id="itemContainer">
        <c:forEach items="${borrowHistory}" var="bh">
            <div class="col-3">
                <div class="col-box">
                    <div class="author-img" style="background-image: url('../../resource/images/full_image_3.jpg');"></div>
                    <span class="user" style="color: #33bbb7;">${bh.nickname}<br> <small>${bh.returnDate}</small></span>
                </div>
                <div class="col-right">
                    <div class="col-right-top">
                        <p>图书收到，书籍完好，页面很新 ，没有破坏,感谢书主分享</p>
                    </div>
                    <div class="col-right-bottom">
                        <p>借阅时间：2017-09-03 &nbsp;&nbsp;</p>
                        <p>归还时间：2017-10-03 &nbsp;&nbsp;</p>
                        <span class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">联系</span>
                    </div>

                </div>
            </div>
        </c:forEach>
    </ul>
    <div class="holder timeline-hoder"></div>

    <!-- 模态框（Modal） -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">与 椿 交流中</h4>
                </div>
                <div class="modal-body">
                    <div id="convo" data-from="Sonu Joshi">
                        <ul class="chat-thread">
                            <li name="me">你好 在吗</li>
                            <li name="other">你好 在的</li>
                            <li name="me">你好 在吗</li>
                            <li name="me">你好 在吗</li>
                        </ul>
                    </div>
                    <div style="text-align:center;clear:both">
                        <script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
                        <script src="/follow.js" type="text/javascript"></script>
                    </div>
                    <div class="credits"><a href="http://codepen.io/clintioo/pen/HAkjq">Original Pen</a> by <a href="http://codepen.io/clintioo/pen/HAkjq">clintioo</a></div>

                    <script src='jquery.js'></script>
                </div>
                <div class="modal-footer">
                    <textarea rows="4" cols="60" name="chat-textarea name" maxlength="150" autofocus class="timeline-textarea" cols="30" rows="10"></textarea>"
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary">发送</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>



</div>
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
            //动态添加css样式
            var css=function(t,s){
                s=document.createElement('style');
                s.innerText=t;
                document.body.appendChild(s);
            };
            //添加css样式
            css('.chat-thread li[name=\'other\']:before{background-image:url(data:image/jpeg;base64,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);}');

//            $("li[name='me']").attr('background-image', '#c4affe');
        </script>

</body>
</html>
