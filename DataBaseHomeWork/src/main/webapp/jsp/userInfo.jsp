<%--
  Created by IntelliJ IDEA.
  User: 97347
  Date: 2019/6/17
  Time: 21:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false"%>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h3>文件下载</h3> -->
<a
        href="download?filename=${requestScope.user.headimage.originalFilename}">
    用户头像：${requestScope.user.headimage.originalFilename}
</a>
</body>
</html>
