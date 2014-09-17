<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>html5</title>
    <asset:javascript src="jquery" />

    <script type="text/javascript">
        function ajaxProcessAction(process){
            var obj=new Object();
            obj.process=process;
            $.post("${request.contextPath}/monitor/ajaxProcess",obj,
                    function (data, textStatus){}, "json");

        }
        function playHandler(){
            ajaxProcessAction("CKobject.getObjectById('ckplayer_a1').videoPlay()");
        }
        function pauseHandler(){
            ajaxProcessAction("CKobject.getObjectById('ckplayer_a1').videoPause()");
        }

        function seekingHandler(objEvent){
            CKobject.getObjectById('ckplayer_a1').videoPlay();
        　  setTimeout(function(){
                //CKobject.getObjectById('ckplayer_a1').videoPause();
                seekingProcess();
            },300);

        }
        function fastNextHandler(){
            ajaxProcessAction("CKobject.getObjectById('ckplayer_a1').fastNext()");
        }
        function fastBackHandler(){
            ajaxProcessAction("CKobject.getObjectById('ckplayer_a1').fastBack()");
        }
        function volumechangeHandler(objEvent){
            setTimeout(function(){
                volumechangeProcess();
            },100);
        }
        function mutedHandler(objEvent){
        　  setTimeout(function(){
                mutedProcess();
            },100);
        }
        function fullScreenHandler(objEvent){

        }
        function seekingProcess(){
            var time=(CKobject.getObjectById('ckplayer_a1').getStatus().time);
            if(time){
                time=time;
            }else{
                time=0;
            }
            ajaxProcessAction("CKobject.getObjectById('ckplayer_a1').videoSeek("+time+")");
        }
        function volumechangeHandler(){
            var time=(CKobject.getObjectById('ckplayer_a1').getStatus().volume);
            ajaxProcessAction("CKobject.getObjectById('ckplayer_a1').changeVolume("+time+")");
        }
        function mutedProcess(){
            var time=(CKobject.getObjectById('ckplayer_a1').getStatus().mute);
            ajaxProcessAction("CKobject.getObjectById('ckplayer_a1').changeVolume(0)");
        }
    </script>
</head>
<body>
<div id="a1"></div>
<video src="http://movie.ks.js.cn/flv/other/1_0.mp4" controls></video>
<script type="text/javascript" src="${request.contextPath}/js/ckplayer6.4/ckplayer/ckplayer.js" charset="utf-8">

</script>
<script type="text/javascript">

    var flashvars={
        p:0,
        e:1,
        b:0
    };

    var video=['http://movie.ks.js.cn/flv/other/1_0.mp4->video/mp4','http://www.ckplayer.com/webm/0.webm->video/webm','http://www.ckplayer.com/webm/0.ogv->video/ogg'];
    var support=['all'];
    var result;
    CKobject.embedHTML5('a1','ckplayer_a1',600,400,video,flashvars,support);
    CKobject.getObjectById('ckplayer_a1').addListener('play',playHandler);
    CKobject.getObjectById('ckplayer_a1').addListener('pause',pauseHandler);
    CKobject.getObjectById('ckplayer_a1').addListener('seeking',seekingHandler);
    //CKobject.getObjectById('ckplayer_a1').addListener('fastNext',fastNextHandler);
    //CKobject.getObjectById('ckplayer_a1').addListener('fastBack',fastBackHandler);
    CKobject.getObjectById('ckplayer_a1').addListener('volumechange',volumechangeHandler);
    CKobject.getObjectById('ckplayer_a1').addListener('muted',mutedHandler);
    CKobject.getObjectById('ckplayer_a1').addListener('fullScreen',fullScreenHandler);
    /*

     CKobject.getObjectById('ckplayer_a1').addListener('fullScreen',playHandler);
     CKobject.getObjectById('ckplayer_a1').addListener('volumeBarDown',playHandler);
     CKobject.getObjectById('ckplayer_a1').addListener('volumeButtonUp',playHandler);
     CKobject.getObjectById('ckplayer_a1').addListener('volumeButtonDown',playHandler);
     CKobject.getObjectById('ckplayer_a1').addListener('brightnessChange',playHandler);
     CKobject.getObjectById('ckplayer_a1').addListener('contrastChange',playHandler);
     CKobject.getObjectById('ckplayer_a1').addListener('saturationChange',playHandler);
     CKobject.getObjectById('ckplayer_a1').addListener('sethueChange',playHandler);
     */

</script>
</body>
</html>