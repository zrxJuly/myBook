<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/book/resource/css/jPages.css">
    <link rel="stylesheet" href="/book/resource/css/animate.css">
    <script src="/book/resource/js/jquery.min.js"></script>
    <script src="/book/resource/js/jPages.js"></script>

</head>
<body>

    <!-- item container -->
    <ul id="itemContainer">
        <li><img src="/book/resource/images/blog-1.jpg" alt="image"></li>
        <li><img src="/book/resource/images/blog-2.jpg" alt="image"></li>
        <li><img src="/book/resource/images/blog-3.jpg" alt="image"></li>
        <li><img src="/book/resource/images/blog-1.jpg" alt="image"></li>
        <li><img src="/book/resource/images/blog-2.jpg" alt="image"></li>
        <li><img src="/book/resource/images/blog-3.jpg" alt="image"></li>
        <li><img src="/book/resource/images/blog-1.jpg" alt="image"></li>
        <li><img src="/book/resource/images/blog-2.jpg" alt="image"></li>
        <li><img src="/book/resource/images/blog-3.jpg" alt="image"></li>
    </ul>
    <!-- navigation holder -->
    <div class="holder"></div>
<script>
    $(function () {

        /* initiate the plugin */
        $("div.holder").jPages({
            containerID: "itemContainer",
            perPage: 2,
            startPage: 1,
            startRange: 1,
            midRange: 5,
            endRange: 1
        });

    });

</script>
</body>
</html>