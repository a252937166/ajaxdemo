<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/5/9
  Time: 9:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <script type="text/javascript">
        var xmlHttp = null;
        function newXMLHttpRequest() {
            if(window.ActiveXObject) {//IE浏览器
                try{
                    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
                }catch(e){
                    try{
                        xmlHttp=new ActiveXObject("Microsoft.XMLHTTP")
                    }catch(e){}
                }
            }else if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlHttp=new XMLHttpRequest();
                if(xmlHttp.overrideMimeType) {
                    xmlHttp.overrideMimeType("text/html");
                }
            }
        }
        function doAjax() {
            //创建XMLHTTPRequest对象
            newXMLHttpRequest();
            //1.连接服务器
            var key = Math.random();
            xmlHttp.open("GET","DoAjaxServlet?key=" + key,true);
            //2.发送请求数据
            xmlHttp.send(null);
            xmlHttp.onreadystatechange=doProcess;
        }
        function doProcess() {
            if(xmlHttp.readyState == 4) {
                var msg = document.getElementById("msg");
                msg.innerHTML += xmlHttp.responseText + "<br />";
            }
        }
    </script>
    <input type="text" value="" onkeyup="doAjax()" />
    <div id="msg"></div>
</body>
</html>
