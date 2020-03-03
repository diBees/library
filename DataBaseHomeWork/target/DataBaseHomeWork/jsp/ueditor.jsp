<%--
  Created by IntelliJ IDEA.
  User: 97347
  Date: 2019/6/14
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script id="container" name="content" type="text/plain">
        这里写你的初始化内容
    </script>
<div id="contents">


</div>

<div id="contents1">


</div>

<!-- 配置文件 -->
<script type="text/javascript" src="../lib/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="../lib/ueditor/ueditor.all.min.js"></script>
<!-- 实例化编辑器 -->
<script type="text/javascript">
    //覆盖UEditor中获取路径的方法
    var ue = UE.getEditor('container');
    ue.ready(function() {
        //设置编辑器的内容
        ue.setContent('hello');
        //获取html内容，返回: <p>hello</p>
        var html = ue.getContent();
        //获取纯文本内容，返回: hello
        var txt = ue.getContentTxt();
        document.getElementById("contents").innerHTML = txt;
        document.getElementById("contents1").innerHTML = html;
    });
    UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
    UE.Editor.prototype.getActionUrl = function(action) {
        if (action == 'uploadimage' || action == 'uploadscrawl' || action == 'listimage') {
            return '/DataBaseHomeWork/ueditor/ueditorUpload';
        } else {
            return this._bkGetActionUrl.call(this, action);
        }
    }
</script>

</body>
</html>
