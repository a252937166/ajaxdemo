<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/5/9
  Time: 11:06
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
        var key = document.getElementById("key").value;
        xmlHttp.open("POST","SearchServlet?key=" + key,true);
        //2.发送请求数据
        xmlHttp.send(null);
        xmlHttp.onreadystatechange=doProcess;
        var sdiv = document.getElementById("sdiv");
        sdiv.style.display="block";
    }
    function change(obj) {
        obj.style.backgroundColor="#f5f5f4";
        var input = document.getElementById("key");
        input.value = obj.innerText;
    }
    function re(obj) {
        obj.style.backgroundColor="#ffffff";
    }
    function doclick(obj) {
        var input = document.getElementById("key");
        input.value = obj.innerText;
        var sdiv = document.getElementById("sdiv");
        sdiv.style.display="none";
    }
    function doProcess() {
        if(xmlHttp.readyState == 4) {
            var ul = document.getElementById("content");
            var msg = xmlHttp.responseText;
            var msgs = msg.split("-");
            ul.innerHTML = "";
            for(var i in msgs) {
                ul.innerHTML += "<li onmouseover='change(this)' onmouseout='re(this)' onclick='doclick(this)'>" + msgs[i] + "<li>";
            }
        }
    }
</script>
    <h1>智能搜索</h1>
    <div>
        <div>
            <input type="text" name="key" id="key" />
            <button onclick="doAjax()">搜索</button>
        </div>
        <div style="width: 171px" id="sdiv">
            <ul style="list-style: none;padding-left: 0px;margin-top: 0px;" id="content">

            </ul>
        </div>
    </div>
</body>
</html>
