package com.cloud.util;

import java.util.Arrays;
import java.util.List;

public enum FileType {

	//定义图片类型
	IMAGE(Arrays.asList("bmp","png","jpg","jpeg","gif","svg","tga","fpx"), "Image"),
	//定义音频类型
	MUSIC(Arrays.asList("mp3","wma","aac","wav"), "Music"),
	//定义视频类型
	VIDEO(Arrays.asList("mp4","mkv","avi","rm","rmvb","flv","3gp","mpeg","mov"), "Video"),
	//定义文档类型
	DOC(Arrays.asList("doc","docx","xls","xlsx","ppt","pptx","pdf","txt","rtf"), "Doc"),
	//定义其他文件类型
	OTHER(Arrays.asList("other"),"Other");
	
	private List<String> prefixNames;
	private String fileType;
	
	//构造
	FileType (List<String> prefixNames, String fileType){
		this.prefixNames = prefixNames;
		this.fileType = fileType;
	}
 
    public String getFileType(){
        return fileType;
    }
    
    public List<String> getPrefixNames(){
    	return prefixNames;
    }
    
    //根据上传文件后缀判断类型
    public static String checnkFileType(String prefixName){
    	String type = OTHER.fileType;
		if(IMAGE.prefixNames.contains(prefixName)){
			type = IMAGE.fileType;
		}else if(MUSIC.prefixNames.contains(prefixName)){
			type =  MUSIC.fileType;
		}else if(VIDEO.prefixNames.contains(prefixName)){
			type =  VIDEO.fileType;
		}else if(DOC.prefixNames.contains(prefixName)){
			type =  DOC.fileType;
		}
    	return type;
    }

}
