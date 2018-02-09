package ch01;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class DataMap {
	public static void main(String[] args) {
		String url = "https://www.naver.com/";
		String selector = "li";
		System.out.println(map(url, selector, 0));
	}
	
	public static Map<String, Long> map(String url, String selector, int num){
		Document doc = null;
		String output ="";
		List<String> list = new ArrayList();
		Map<String, Long> map = null;
		int count = 0;
		try {
			doc = Jsoup.connect(url).get();
		}catch(IOException e1) {
			e1.printStackTrace();
		}
		Elements titles = doc.select(selector);
		for(Element e : titles) {
			String line = e.text();
			System.out.println(line);
			line = line.replace(",,", ",");
			line = line.replace("\"", " ");
			line = line.replace('1', ' ');
			line = line.replace('2', ' ');
			line = line.replace('3', ' ');
			line = line.replace('4', ' ');
			line = line.replace('5', ' ');
			line = line.replace('6', ' ');
			line = line.replace('7', ' ');
			line = line.replace('8', ' ');
			line = line.replace('9', ' ');
			line = line.replace('0', ' ');
			line = line.replace('%', ' ');
			line = line.replace('"', ' ');
			line = line.replace('\'', ' ');
			line = line.replace('[', ' ');
			line = line.replace(']', ' ');
			line = line.replace('/', ' ');
			line = line.replace('\n', ' ');
			line = line.replace("기사", "");
			String[] strs = line.split(" ");
			list.addAll(Arrays.asList(strs));
		}	map = list
				.stream()
				.filter(name -> !name.equals("")) 
				//name -> !name 다른 변수로 사용해도 된다 이 ""이면 카운트 하면안된다
				.collect(
					Collectors.groupingBy(
							String::toString,	//toString은 String 의 값을 말한다
							Collectors.mapping(String::toString, Collectors.counting())
							)
				);
		return map;
	}
}









