package com.databasehomework.controller;
import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.databasehomework.utils.ToolsUtils;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 * @Title UeditorController.java
 * @description: 百度编辑器入口controller
 * @time 创建时间：2018年4月8日 下午4:52:45
 **/
@Controller
@RequestMapping(value = "ueditor")
public class UEditorController {
    /**
     * @Title: uploadUEditorImage
     * @Description: 自定义编辑器上传路径
     * @param @param file
     * @param @param response
     * @param @param request
     * @param @throws Exception
     * @return void
     * @date createTime：2018年4月9日下午1:52:19
     */
    @RequestMapping(value = "/ueditorUpload")
    public void ueditorUpload(@RequestParam(value = "upfile", required = false) MultipartFile file,
                              HttpServletResponse response, HttpServletRequest request) throws Exception {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        JSONObject json = new JSONObject();
        PrintWriter out = response.getWriter();
        try {
            //要上传的磁盘路径
            String rootPath = "D:/uploadFile";
            //文件名
            String fileName = file.getOriginalFilename();
            //截取文件类型
            String fileType = fileName.substring(fileName.indexOf(".") + 1);
            //创建以日期为名字的文件夹
            String dateFolder = "/" + new SimpleDateFormat("yyyyMMdd").format(new Date()) + "/";
            System.out.println("dateFolder发生的是的谁多:"+dateFolder);
            //拼接文件的相对路径
            String path = dateFolder + ToolsUtils.getRandomString(15) + "." + fileType;
            System.out.println("path顿饭是士大夫谁多谁多是:" + path);
            //创建文件夹
            new File(rootPath + dateFolder).mkdir();
            //写入文件
            file.transferTo(new File(rootPath + path));
            json.put("state", "SUCCESS");
            json.put("title", file.getName());
            json.put("url", path);// 图片访问 相对路径
            json.put("original", file.getName());
        } catch (Exception e) {
            json.put("state", "ERROR");
            throw new Exception("上传文件失败！");
        }
        out.print(json.toString());
    }
}
