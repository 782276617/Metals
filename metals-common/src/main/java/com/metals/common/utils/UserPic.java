package com.metals.common.utils;

import java.util.Random;

public class UserPic {
	private static String[] arr = new String[]{"1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg","10.jpg"
									   ,"11.jpg","12.jpg","13.jpg","14.jpg","15.jpg","16.jpg","17.jpg"};



	
	
	public static String randomPic(){
		
		 Random random = new Random();
		int i = random.nextInt(17);
	
		return  arr[i];
	}
	
}
