package  com.xthena.common.web;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.xthena.ext.store.StoreDTO;
import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.util.ConfUtil;
import com.xthena.util.JsonResponseUtil;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("comm")
public class FileUtilController {
	
	@RequestMapping("comm-uploadFile")
    public void uploadImage(@RequestParam("files[]") MultipartFile attachment,HttpServletResponse httpServletResponse) throws Exception {
    	String uploadFileName=attachment.getOriginalFilename();
    	String srcFileName=null;
    	String fileType=null;
    	
    	String filePath="";
    	/*//页面定义目录
    	if(filePath==null){
    		filePath="";
    	}else if(filePath!=null&&!filePath.endsWith("/")){
    		filePath=filePath+"/";
    	}*/
    	
    	if(uploadFileName.indexOf(".")>0){
    		int start=uploadFileName.lastIndexOf(".");
    		srcFileName=uploadFileName.substring(0,start);
    		fileType=uploadFileName.substring(start+1, uploadFileName.length());
    	}else{
    		srcFileName=uploadFileName;
    		fileType="";
    	}
    	String fileName=String.valueOf(System.currentTimeMillis());
    	String simpleNewFilename=fileName+"."+fileType;
    	File file=new File(ConfUtil.getProperty("upload.dir")+filePath+simpleNewFilename);
    	FileUtils.copyInputStreamToFile(attachment.getInputStream(), file);
    	HashMap<String, String> fileMap=new HashMap<String, String>();
    	fileMap.put("fileName",srcFileName);
    	fileMap.put("fileUrl",ConfUtil.getProperty("download.url")+filePath+simpleNewFilename);
    	fileMap.put("fileType",fileType);
    	fileMap.put("uploaduser",SpringSecurityUtils.getCurrentUserId());
    	List<HashMap<String, String>> filesHashMaps=new ArrayList<HashMap<String,String>>();
    	filesHashMaps.add(fileMap);
    	
    	HashMap<String, List<HashMap<String, String>>> result=new HashMap<String, List<HashMap<String, String>>>();
    	result.put("files", filesHashMaps);
    	
    	JsonResponseUtil.write(httpServletResponse, result);
    }
	
	

    @RequestMapping("editor-article-uploadImage")
    public void uploadImage1(@RequestParam("CKEditorFuncNum") String callback,
            @RequestParam("upload") MultipartFile attachment,HttpServletResponse httpServletResponse) throws Exception {
    	String uploadFileName=attachment.getOriginalFilename();
    	String srcFileName=null;
    	String fileType=null;
    	
    	String filePath="";
    	/*//页面定义目录
    	if(filePath==null){
    		filePath="";
    	}else if(filePath!=null&&!filePath.endsWith("/")){
    		filePath=filePath+"/";
    	}*/
    	
    	if(uploadFileName.indexOf(".")>0){
    		int start=uploadFileName.lastIndexOf(".");
    		srcFileName=uploadFileName.substring(0,start);
    		fileType=uploadFileName.substring(start+1, uploadFileName.length());
    	}else{
    		srcFileName=uploadFileName;
    		fileType="";
    	}
    	String fileName=String.valueOf(System.currentTimeMillis());
    	String simpleNewFilename=fileName+"."+fileType;
    	File file=new File(ConfUtil.getProperty("upload.dir")+filePath+simpleNewFilename);
    	FileUtils.copyInputStreamToFile(attachment.getInputStream(), file);
    	HashMap<String, String> fileMap=new HashMap<String, String>();
    	fileMap.put("fileName",srcFileName);
    	fileMap.put("fileUrl",ConfUtil.getProperty("download.url")+filePath+simpleNewFilename);
    	fileMap.put("fileType",fileType);
    	fileMap.put("uploaduser",SpringSecurityUtils.getCurrentUserId());
    	List<HashMap<String, String>> filesHashMaps=new ArrayList<HashMap<String,String>>();
    	filesHashMaps.add(fileMap);
    	
    	HashMap<String, List<HashMap<String, String>>> result=new HashMap<String, List<HashMap<String, String>>>();
    	result.put("files", filesHashMaps);

        JsonResponseUtil.write(httpServletResponse, "<script type='text/javascript'>"
                + "window.parent.CKEDITOR.tools.callFunction(" + callback
                + ",'" + ConfUtil.getProperty("download.url")+filePath+simpleNewFilename + "','')"
                + "</script>");
    }
}
