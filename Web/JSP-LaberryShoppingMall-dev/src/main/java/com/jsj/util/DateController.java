package com.jsj.util;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DateController {
	// Four: nnnn, Two: nn
	// Four 1개, Two 5개 
	public static String ft5Date() {
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		return now.format(formatter);
	}
	
	// Two 6개
	public static String t6Date() {
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy-MM-dd HH:mm:ss");
		return now.format(formatter);
	}
}
