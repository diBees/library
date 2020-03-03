<%--
  Created by IntelliJ IDEA.
  User: 97347
  Date: 2019/3/5
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
    <script type="text/javascript" src="../resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="../resources/js/jquery-2.0.0.min.js"></script>
    <title>Title</title>
</head>
<body>
<form id="login_form" action="/LocustsSePro/locusts/delectBatch" method="post">
    <div>
        <input type="text" name="tristrinae" class="layui-textarea" >
    </div>
    <button onclick="logines()">保存</button>
</form>

<form method="post" enctype="multipart/form-data" id="file_upload" action="/LocustsSePro/locusts/editsPhoto">
    <tr><td>商品图片</td>
        <c:if test="${testPic.testpic !=null}">
            <img src="/pic/${testPic.testpic}" width=100 height=100 />
            <br/>
        </c:if>　
        <p>图片预览：</p>
        <input type="file" name="tpic" id="tpic"/>
    </tr>
    <input type="submit" value="提交" />
</form>

<h1>
    ${flag}
</h1>
</body>

<h1></h1>

<script>

    function logines() {
        $("#layui-textarea").submit();
        //alert(%{users.phone});
    }

    /*    function log() {
            $("#file_upload").submit();
            //alert(%{users.phone});
        }*/


</script>
</body>
</html>
