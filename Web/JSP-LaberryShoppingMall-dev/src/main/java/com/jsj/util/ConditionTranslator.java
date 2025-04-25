package com.jsj.util;

public class ConditionTranslator {
	public static String translateCondition(String condition) {
		condition = condition.toLowerCase();
		if ("new".equals(condition)) return "신제품";
		else if ("old".equals(condition)) return "중고품";
		return "알 수 없음";
	}
}
