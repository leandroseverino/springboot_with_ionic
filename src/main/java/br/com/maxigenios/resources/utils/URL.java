package br.com.maxigenios.resources.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class URL {

	public static List<Integer> decodeIntList(String arg) {
		
//		List<Integer> ids = new ArrayList<>();
//		
//		String[] vet = arg.split(",");
//		
//		for (int i = 0; i < vet.length; i++) {
//			ids.add(Integer.parseInt(vet[i]));
//			
//		}
//		
//		return ids;
		
		return Arrays.asList(arg.split(",")).stream().map(x -> Integer.parseInt(x)).collect(Collectors.toList());
		
	}
	
	public static String decodeParam(String arg) {
		
		try {
			return URLDecoder.decode(arg, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "";
		}
	}
}
