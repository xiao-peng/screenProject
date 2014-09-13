<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>html5</title>
    <asset:javascript src="jquery" />
    <asset:javascript src="spring-websocket" />

    <script type="text/javascript">
        $(function() {
            var socket = new SockJS("${createLink(uri: '/stomp')}");
            var client = Stomp.over(socket);

            client.connect({}, function() {
                client.subscribe("/queue/player", function(message) {
                    var json=JSON.parse(message.body);
                    eval(json);
                });
            });
        });
    </script>
</head>
<body>
<div id="a1"></div>

<script type="text/javascript" src="${request.contextPath}/js/ckplayer6.4/ckplayer/ckplayer.js" charset="utf-8"></script>
<script type="text/javascript">
    var flashvars={
        p:0,
        e:1,
        b:0
    };

    var video=['http://movie.ks.js.cn/flv/other/1_0.mp4->video/mp4','http://www.ckplayer.com/webm/0.webm->video/webm','http://www.ckplayer.com/webm/0.ogv->video/ogg'];
    var support=['all'];
    CKobject.embedHTML5('a1','ckplayer_a1',600,400,video,flashvars,support);
</script>


</body>
</html>