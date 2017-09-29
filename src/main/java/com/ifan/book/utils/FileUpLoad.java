package com.ifan.book.utils;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class FileUpLoad {

    /**
     * 文件上传处理
     *
     * @param file
     * @param request
     * @return
     */
    public static Map<String, String> imageUp(MultipartFile file, HttpServletRequest request, String ImageType) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("flag", "success");
        map.put("message", "文件上传成功");
        String path = null;// 文件路径
        String type = null;// 文件类型
        String originalName = file.getOriginalFilename();// 文件原名称
        // 判断文件类型
        type = originalName.indexOf(".") != -1 ? originalName.substring(originalName.lastIndexOf(".") + 1, originalName.length()) : null;
        if (type != null) {// 判断文件类型是否为空
            if ("GIF".equals(type.toUpperCase()) || "PNG".equals(type.toUpperCase()) || "JPG".equals(type.toUpperCase())) {
                // 项目在容器中实际发布运行的根路径
                String realPath = request.getSession().getServletContext().getRealPath("\\resource\\images\\" + ImageType);
                // 自定义的文件名称
                String trueFileName = String.valueOf(System.currentTimeMillis());
                // 设置存放图片文件的路径
                path = realPath + "\\" + trueFileName + "." + type;
                map.put("path", trueFileName + "." + type);
                // 转存文件到指定的路径
                try {
                    file.transferTo(new File(path));
                } catch (IOException e) {
                    e.printStackTrace();
                    map.put("flag", "error");
                    map.put("message", "文件上传失败");
                }
                map.put("flag", "success");
                map.put("message", "文件成功上传到指定目录下");
            } else {
                map.put("flag", "error");
                map.put("message", "文件类型错误，请重新上传");
            }
        } else {
            map.put("flag", "error");
            map.put("message", "文件类型为空");
        }
        return map;
    }
}
