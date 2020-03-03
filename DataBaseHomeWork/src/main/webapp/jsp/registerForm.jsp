<%--
  Created by IntelliJ IDEA.
  User: 97347
  Date: 2019/6/17
  Time: 21:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>用户注册</h2>
<form action="register" enctype="multipart/form-data" method="post">
    <table>
        <tr>
            <td>用户头像：</td>
            <td><input type="file" name="headimage"></td>
        </tr>
        <tr>
            <td>上传：</td>
            <td><input type="submit" value="上传"></td>
        </tr>
    </table>
</form>
</body>
</html>
