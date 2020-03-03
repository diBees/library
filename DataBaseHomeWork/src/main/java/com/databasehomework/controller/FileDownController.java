package com.databasehomework.controller;

import com.databasehomework.model.FileTool;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Map;

@Controller
public class FileDownController
{

    @RequestMapping(value="register",method=RequestMethod.POST)
    public String reg(@ModelAttribute FileTool user, HttpServletRequest request, Map<String,Object> map){

        final String wrong="error";

        final String good="success";

        MultipartFile headimage = user.getHeadimage();

        boolean empty = headimage.isEmpty();

        if (!empty) {

            String realPath = request.getServletContext().getRealPath("/images");

            String uploadPath="E:\\webphoto\\webfile";

            String headimageName = headimage.getOriginalFilename();

            File imageFile = new File(uploadPath,headimageName);


            try {

                headimage.transferTo(new File(uploadPath+File.separator+headimageName));
            } catch (Exception e) {
                e.printStackTrace();
                return wrong;
            }
            map.put("user", user);
            return "userInfo";
        }else {
            return wrong;
        }
    }


    @RequestMapping(value="download",method=RequestMethod.GET) //匹配的是href中的download请求
    public ResponseEntity<byte[]> download(HttpServletRequest request, @RequestParam("filename") String filename, Model model) throws IOException
    {
        String downloadFilePath="E:\\webphoto\\webfile";//从我们的上传文件夹中去取
        File file = new File(downloadFilePath+File.separator+filename);//新建一个文件
        HttpHeaders headers = new HttpHeaders();//http头信息
        String downloadFileName = new String(filename.getBytes("UTF-8"),"iso-8859-1");//设置编码
        headers.setContentDispositionFormData("attachment", downloadFileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        //MediaType:互联网媒介类型  contentType：具体请求中的媒体类型信息
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers, HttpStatus.CREATED);
    }
}