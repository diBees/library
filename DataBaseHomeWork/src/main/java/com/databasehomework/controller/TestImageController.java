package com.databasehomework.controller;

import com.databasehomework.dao.UserMapper;
import com.databasehomework.model.User;
import com.databasehomework.service.ImageService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.*;
import java.util.List;

@Controller
@RequestMapping("/images")
public class TestImageController
{
    @Autowired
    UserMapper userMapper;
    @Autowired
    ImageService imageService;
    @RequestMapping("imageTest")
    public void imageTest(HttpServletRequest request, HttpServletResponse response)throws IOException , ServletException
    {
        // TODO 自动生成的方法存根
        //告诉客户端，输出的格式
        response.setContentType("image/jpeg");
        int width = 80;
        int height = 40;
        int lines = 10;
        BufferedImage img = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics g = img.getGraphics();
        //设置背景色
        g.setColor(Color.WHITE);
        g.fillRect(0, 0, width, height);
        //设置字体
        g.setFont(new Font("宋体", Font.BOLD, 20));
        //随机数字
        Random r = new Random(new Date().getTime());
        String image = "";
        for(int i=0;i<4;i++){
            int a = r.nextInt(10);

            image = image+a;
            int y = 10+r.nextInt(20);//10~30范围内的一个整数，作为y坐标
            Color c = new Color(r.nextInt(255),r.nextInt(255),r.nextInt(255));
            g.setColor(c);
            g.drawString(""+a, 5+i*width/4, y);
        }
        //干扰线
        for(int i=0;i<lines;i++){
            Color c = new Color(r.nextInt(255),r.nextInt(255),r.nextInt(255));
            g.setColor(c);
            g.drawLine(r.nextInt(width), r.nextInt(height), r.nextInt(width), r.nextInt(height));
        }
        g.dispose();//类似于流中的close()带动flush()---把数据刷到img对象当中
        request.getSession().setAttribute("code", image);

        ImageIO.write(img, "JPG", response.getOutputStream());

    }

    @RequestMapping("editsPhoto")
    public String editsPhoto(Model model, User user, MultipartFile tpic, Integer uid)throws IOException
    {//[] items_pic
        String originalFilename = tpic.getOriginalFilename();
        System.out.println("我的" + originalFilename);
        //上传图片
        if (tpic != null && originalFilename != null && originalFilename.length() > 0)
        {
            String pic_path = "E:\\webphoto\\";
            String newFilename = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
            File newfile = new File(pic_path + newFilename);
            if (!newfile.exists())
            {
                newfile.createNewFile();
            }
            //将内存数据写入磁盘
            tpic.transferTo(newfile);
            user.setUserurl(newFilename);
            System.out.println("新的名字" + newFilename);
            user.setUid(uid);

            System.out.println("发放受到福斯的发生" +uid);
            user.setUserurl(newFilename);
            int flag = userMapper.insertImage(user);
            //findLocust.insectPic(testPic);
            model.addAttribute("user", user);
            return "memberedit";
        }
        return "memberedit";
    }

    @RequestMapping("UploadHandleServlet")
    public String editsFile(HttpServletRequest request,HttpServletResponse response)throws IOException
    {
        //得到上传文件的保存目录，将上传的文件存放于WEB-INF目录下，不允许外界直接访问，保证上传文件的安全
        String savePath = request.getServletContext().getRealPath("/WEB-INF/upload");
        //上传时生成的临时文件保存目录
        String tempPath = request.getServletContext().getRealPath("/WEB-INF/temp");
        File tmpFile = new File(tempPath);
        if (!tmpFile.exists()) {
            //创建临时目录
            tmpFile.mkdir();
        }

        //消息提示
        String message = "";
        try{
            //使用Apache文件上传组件处理文件上传步骤：
            //1、创建一个DiskFileItemFactory工厂
            DiskFileItemFactory factory = new DiskFileItemFactory();
            //设置工厂的缓冲区的大小，当上传的文件大小超过缓冲区的大小时，就会生成一个临时文件存放到指定的临时目录当中。
            factory.setSizeThreshold(1024*100);//设置缓冲区的大小为100KB，如果不指定，那么缓冲区的大小默认是10KB
            //设置上传时生成的临时文件的保存目录
            factory.setRepository(tmpFile);
            //2、创建一个文件上传解析器
            ServletFileUpload upload = new ServletFileUpload(factory);
            //监听文件上传进度
            upload.setProgressListener(new ProgressListener(){
                public void update(long pBytesRead, long pContentLength, int arg2) {
                    System.out.println("文件大小为：" + pContentLength + ",当前已处理：" + pBytesRead);
                    /**
                     * 文件大小为：14608,当前已处理：4096
                     文件大小为：14608,当前已处理：7367
                     文件大小为：14608,当前已处理：11419
                     文件大小为：14608,当前已处理：14608
                     */
                }
            });
            //解决上传文件名的中文乱码
            upload.setHeaderEncoding("UTF-8");
            //3、判断提交上来的数据是否是上传表单的数据
            if(!ServletFileUpload.isMultipartContent(request)){
                //按照传统方式获取数据
                return"";
            }

            //设置上传单个文件的大小的最大值，目前是设置为1024*1024字节，也就是1MB
            upload.setFileSizeMax(1024*1024);
            //设置上传文件总量的最大值，最大值=同时上传的多个文件的大小的最大值的和，目前设置为10MB
            upload.setSizeMax(1024*1024*10);
            //4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
            List<FileItem> list = upload.parseRequest(request);
            for(FileItem item : list){
                //如果fileitem中封装的是普通输入项的数据
                if(item.isFormField()){
                    String name = item.getFieldName();
                    //解决普通输入项的数据的中文乱码问题
                    String value = item.getString("UTF-8");
                    //value = new String(value.getBytes("iso8859-1"),"UTF-8");
                    System.out.println(name + "=" + value);
                }else{//如果fileitem中封装的是上传文件
                    //得到上传的文件名称，
                    String filename = item.getName();
                    System.out.println(filename);
                    if(filename==null || filename.trim().equals("")){
                        continue;
                    }
                    //注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如：  c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt
                    //处理获取到的上传文件的文件名的路径部分，只保留文件名部分
                    filename = filename.substring(filename.lastIndexOf("\\")+1);
                    //得到上传文件的扩展名
                    String fileExtName = filename.substring(filename.lastIndexOf(".")+1);
                    //如果需要限制上传的文件类型，那么可以通过文件的扩展名来判断上传的文件类型是否合法
                    System.out.println("上传的文件的扩展名是："+fileExtName);
                    //获取item中的上传文件的输入流
                    InputStream in = item.getInputStream();
                    //得到文件保存的名称
                    String saveFilename = UUID.randomUUID().toString() + "_" + filename;





                    //得到文件名的hashCode的值，得到的就是filename这个字符串对象在内存中的地址
                    int hashcode = saveFilename.hashCode();
                    int dir1 = hashcode&0xf;  //0--15
                    int dir2 = (hashcode&0xf0)>>4;  //0-15
                    //构造新的保存目录
                    String dir = savePath + "\\" + dir1 + "\\" + dir2;  //upload\2\3  upload\3\5
                    //File既可以代表文件也可以代表目录
                    File file = new File(dir);
                    //如果目录不存在
                    if(!file.exists()){
                        //创建目录
                        file.mkdirs();
                    }
//得到文件的保存目录
                    String realSavePath = dir;


                            //创建一个文件输出流
                    FileOutputStream out = new FileOutputStream(realSavePath + "\\" + saveFilename);
                    //创建一个缓冲区
                    byte buffer[] = new byte[1024];
                    //判断输入流中的数据是否已经读完的标识
                    int len = 0;
                    //循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
                    while((len=in.read(buffer))>0){
                        //使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
                        out.write(buffer, 0, len);
                    }
                    //关闭输入流
                    in.close();
                    //关闭输出流
                    out.close();
                    //删除处理文件上传时生成的临时文件
                    //item.delete();
                    message = "文件上传成功！";
                }
            }
        }catch (FileUploadBase.FileSizeLimitExceededException e) {
            e.printStackTrace();
            request.setAttribute("message", "单个文件超出最大值！！！");

            return"";
        }catch (FileUploadBase.SizeLimitExceededException e) {
            e.printStackTrace();
            request.setAttribute("message", "上传文件的总的大小超出限制的最大值！！！");

            return"";
        }catch (Exception e) {
            message= "文件上传失败！";
            e.printStackTrace();
        }
        request.setAttribute("message",message);
        return "message";


}


    @RequestMapping("DownLoadServlet")
    public void DownLoadServlet(HttpServletRequest request,HttpServletResponse response)throws IOException
    {
        //实现文件下载 设置响应头
        String fileName = request.getServletContext().getRealPath("")+"\\resources\\"+"aaa.docx";
        response.setHeader("Content-Disposition", "attachment;filename="+fileName);
        System .out.print("fileName"+fileName);
        //先使用文件输入流 将文件读到内存中 再使用输出流 将文件输出给用户
        File file = new File(fileName);
        FileInputStream fileIn = new FileInputStream(file);
        //准备一个缓冲区
        byte[] b = new byte[(int)file.length()];
        //将文件读入缓冲区中
        fileIn.read(b);
        //获得响应的输出流
        ServletOutputStream sout = response.getOutputStream();
//调用response.getOutputStream()方法返回 ServeltOutputStream 对象来向客户端写入文件内容。
        sout.write(b);
        sout.close();


    }
    @RequestMapping("listfile")
    public String listFile(HttpServletRequest request,HttpServletResponse response)throws IOException
    {
        String path = "E:\\webphoto\\";
        //获取上传文件的目录
        //String uploadFilePath = .getServletContext().getRealPath("/WEB-INF/upload");
        //存储要下载的文件名
        Map<String,String> fileNameMap = new HashMap<String,String>();
        //递归遍历filepath目录下的所有文件和目录，将文件的文件名存储到map集合中
        imageService.listfile(new File(path),fileNameMap);//File既可以代表一个文件也可以代表一个目录
        //将Map集合发送到listfile.jsp页面进行显示
        request.setAttribute("fileNameMap", fileNameMap);
        return "message";

    }







}




