<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Web Socket JavaScript Echo Client</title>
    <script src="http://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
    <script type="application/javascript">
        var userid = new Date().valueOf();

        var Chat = {};

        var obj = null;

        Chat.socket = null;

        Chat.connect = (function (host) {
            if ('WebSocket' in window) {
                Chat.socket = new WebSocket(host);
            } else if ('MozWebSocket' in window) {
                Chat.socket = new MozWebSocket(host);
            } else {
                Console.log('Error: WebSocket is not supported by this browser.');
                return;
            }

            Chat.socket.onopen = function () {
//                Console.log('Info: WebSocket connection opened.');
                document.getElementById('chat').onkeydown = function (event) {
                    if (event.keyCode == 13) {
                        Chat.sendMessage();
                    }
                };
            };

            Chat.socket.onclose = function () {
                document.getElementById('chat').onkeydown = null;
                Console.log('Info: WebSocket closed.');
            };

            Chat.socket.onmessage = function (message) {
                Console.log(message.data);
            };
        });

        Chat.initialize = function () {
            if (window.location.protocol == 'http:') {
                console.info(userid);
                Chat.connect('ws:\\localhost:8080/book/websocket/' + userid+".ws");
            } else {
                Chat.connect('wss:\\127.0.0.1:8080/book/websocket/' + userid);
            }
        };

        Chat.close= function () {
            Chat.socket.onclose();
        };

        Chat.sendMessage = (function () {
            var message = document.getElementById('chat').value;
            if (message != '') {
                obj = {
                    message: message,
                    from: userid,
                    to: -1
                };
                Chat.socket.send(JSON.stringify(obj));
                document.getElementById('chat').value = '';
                Console.log(message);
            }
        });

        Chat.sendPersonalMessage = (function () {
            var content = $("#console").children("p:first-child").text();
            var to = content.substring(0, content.indexOf(":"));
            var message = document.getElementById('chat').value;
            if (message != '') {
                obj = {
                    message: message,
                    from: userid,
                    to: to
                };
                Chat.socket.send(JSON.stringify(obj));
                document.getElementById('chat').value = '';
                Console.log(message);
            }
        });


        var Console = {};

        Console.log = (function (message) {
            var console = document.getElementById('console');
            var p = document.createElement('p');
            p.style.wordWrap = 'break-word';
            p.innerHTML = message;
            console.appendChild(p);
            while (console.childNodes.length > 25) {
                console.removeChild(console.firstChild);
            }
            console.scrollTop = console.scrollHeight;
        });

        //        Chat.initialize();

        document.addEventListener("DOMContentLoaded", function () {
            var noscripts = document.getElementsByClassName("noscript");
            for (var i = 0; i < noscripts.length; i++) {
                noscripts[i].parentNode.removeChild(noscripts[i]);
            }
        }, false);

    </script>
</head>
<body>
<h1>Echo Server</h1>
<div class="noscript"></div>
<div>
    <p>
        <input type="text" placeholder="输入" id="chat"/>
    </p>
    <div id="console-container">
        <div id="console"></div>
    </div>
    <button onclick="javascript:Chat.sendMessage()">群发</button>
    <button onclick="javascript:Chat.sendPersonalMessage()">私聊</button>
    <button onclick="javascript:Chat.initialize()">连接服务器</button>
    <button onclick="javascript:Chat.socket.close();">断开服务器</button>
</div>
</body>
</html>