package com.metals.utils;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import org.springframework.util.StringUtils;

import com.metals.common.utils.IDUtils;

public class UploadUtils {
	
	/**
	 * 
	 * @param request	 请求数据
	 * @param filePath   当前项目路径下 /WEB-INF/....
	 * @return
	 */
	
	public static Map<String, String> Upload(HttpServletRequest request,String filePath){
					Map<String, String> map = new HashMap<String,String>();
						// request.setCharacterEncoding("UTF-8");
						// 要执行文件上传的操作
						// 判断表单是否支持文件上传。即：enctype="multipart/form-data"
						boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
						if (!isMultipartContent) {
							throw new RuntimeException("your form is not multipart/form-data");
						}
				
						// 创建一个DiskFileItemfactory工厂类
						DiskFileItemFactory factory = new DiskFileItemFactory();
						factory.setRepository(new File(request.getSession().getServletContext().getRealPath("/WEB-INF")));// 指定临时文件的存储目录
						// 创建一个ServletFileUpload核心对象
						ServletFileUpload sfu = new ServletFileUpload(factory);
						// 解决上传表单项乱码问题
						sfu.setHeaderEncoding("UTF-8");
						// 限制上传文件的大小
				
						// 解析request对象，并得到一个表单项的集合
						try {
							// sfu.setFileSizeMax(1024*1024*3);//表示3M大小
							// sfu.setSizeMax(1024*1024*6);
							List<FileItem> fileItems = sfu.parseRequest(request);
							
							int count = 1;
							// 遍历表单项数据
							for (FileItem fileitem : fileItems) {
								if (fileitem.isFormField()) {
									// 普通表单项
									Map<String, String> formMap = processFormField(fileitem);
									map.putAll(formMap);
								} else {
									// 上传表单项
									String fileName = processUploadField(fileitem,request,filePath);
									map.put("file" + count,fileName);
									count++;
								}
							}
				
						} catch (FileUploadBase.FileSizeLimitExceededException e) {
							// throw new RuntimeException("文件过在，不能超过3M");
				
							//System.out.println("文件过在，不能超过3M");
						} catch (FileUploadBase.SizeLimitExceededException e) {
							//System.out.println("总文件大小不能超过6M");
						} catch (FileUploadException e) {
							e.printStackTrace();
						}
				return map;
		}
		private static String processUploadField(FileItem fileitem,HttpServletRequest request,String filePath) {
		try {

			// 创建一个文件存盘的目录
			String directoryRealPath = request.getSession().getServletContext().getRealPath(filePath);
			File storeDirectory = new File(directoryRealPath);// 即代表文件又代表目录
			if (!storeDirectory.exists()) {
				storeDirectory.mkdirs();// 创建一个指定的目录
			}
			// 得到上传的名子
			String filename = fileitem.getName();// 文件项中的值 F:\图片素材\小清新\43.jpg 或者
													// 43.jpg
			if (filename != null) {
				// filename =
				// filename.substring(filename.lastIndexOf(File.separator)+1);
				filename = FilenameUtils.getName(filename);// 效果同上
			}
			
			if(StringUtils.isEmpty(filename)) {
				return null;
			}
			
			// 解决文件同名的问题
			filename = IDUtils.genImageName();
			// 目录打散
			// String childDirectory = makeChildDirectory(storeDirectory); //
			// 2015-10-19
			//String childDirectory = makeChildDirectory(storeDirectory, filename); // a/b

			// 上传文件，自动删除临时文件
			fileitem.write(new File(storeDirectory,filename));
			fileitem.delete();
			return filename;
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}



	// 目录打散
		private static String makeChildDirectory(File storeDirectory, String filename) {
			int hashcode = filename.hashCode();// 返回字符转换的32位hashcode码
			String code = Integer.toHexString(hashcode); // 把hashcode转换为16进制的字符
															// abdsaf2131safsd
			String childDirectory = code.charAt(0) + File.separator
					+ code.charAt(1); // a/b
			// 创建指定目录
			File file = new File(storeDirectory, childDirectory);
			if (!file.exists()) {
				file.mkdirs();
			}
			return childDirectory;
		}

			// 按日期打散
			/*
			 * private String makeChildDirectory(File storeDirectory) {
			 * 
			 * SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd"); String
			 * dateDirectory = sdf.format(new Date()); //只管创建目录 File file = new
			 * File(storeDirectory,dateDirectory); if(!file.exists()){ file.mkdirs(); }
			 * 
			 * return dateDirectory; }
			 */
		
		
		
			// 普通表单项
			private static Map<String,String> processFormField(FileItem fileitem) {
				Map<String,String> map = new HashMap<String,String>();
				try {
					String fieldname = fileitem.getFieldName();// 字段名
					String fieldvalue = fileitem.getString("UTF-8");// 字段值
					//fieldvalue = new String(fieldvalue.getBytes("iso-8859-1"),"utf-8");
					//System.out.println("key : "+fieldname  +" vlues ："+fieldvalue);
					map.put(fieldname, fieldvalue);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				return map;
			}
	}
