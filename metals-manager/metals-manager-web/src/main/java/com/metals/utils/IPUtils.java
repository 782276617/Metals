package com.metals.utils;

import javax.servlet.http.HttpServletRequest;

public class IPUtils {
	 public static  String getIpAddr(HttpServletRequest request) {
	        String ip = request.getHeader("x-forwarded-for"); 
	        System.out.println("x-forwarded-for ip: " + ip);
	        if (ip != null && ip.length() != 0 && !"unknown".equalsIgnoreCase(ip)) {  
	            // 多次反向代理后会有多个ip值，第一个ip才是真实ip
	            if( ip.indexOf(",")!=-1 ){
	                ip = ip.split(",")[0];
	            }
	        }  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = request.getHeader("Proxy-Client-IP");  
	            System.out.println("Proxy-Client-IP ip: " + ip);
	        }  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = request.getHeader("WL-Proxy-Client-IP");  
	            System.out.println("WL-Proxy-Client-IP ip: " + ip);
	        }  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = request.getHeader("HTTP_CLIENT_IP");  
	            System.out.println("HTTP_CLIENT_IP ip: " + ip);
	        }  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
	            System.out.println("HTTP_X_FORWARDED_FOR ip: " + ip);
	        }  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = request.getHeader("X-Real-IP");  
	            System.out.println("X-Real-IP ip: " + ip);
	        }  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = request.getRemoteAddr();  
	            System.out.println("getRemoteAddr ip: " + ip);
	        } 
	        System.out.println("获取客户端ip: " + ip);
	        return ip;  
	    }
	 
	 
	 public static String getIpAddrs(HttpServletRequest request) {
		         String ip = request.getHeader("x-forwarded-for");
		          if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		             ip = request.getHeader("Proxy-Client-IP");
		         }
		         if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		             ip = request.getHeader("WL-Proxy-Client-IP");
	         }
		         if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		             ip = request.getRemoteAddr();
		        }
		        if (ip.equals("0:0:0:0:0:0:0:1")) {
		             ip = "127.0.0.1";
	         }
	         return ip;
	 }
	 
	 public static String getIpAddrx(HttpServletRequest request){
	        String ip = request.getHeader("x-forwarded-for");
	        if ((ip == null) || (ip.length() == 0) || ("unknown".equalsIgnoreCase(ip))){
	            ip = request.getHeader("Proxy-Client-IP");
	        }
	        if ((ip == null) || (ip.length() == 0) || ("unknown".equalsIgnoreCase(ip))){
	            ip = request.getHeader("WL-Proxy-Client-IP");
	        }
	        if ((ip == null) || (ip.length() == 0) || ("unknown".equalsIgnoreCase(ip))){
	            ip = request.getRemoteAddr();
	        }

	        return ip;
	    }
}
