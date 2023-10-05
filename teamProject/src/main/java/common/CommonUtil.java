package common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpSession;

public class CommonUtil {
	
	public static final int SEC = 60;
	public static final int MIN = 60;
	public static final int HOUR = 24;
	public static final int DAY = 30;
	public static final int MONTH = 12;
	
	//~일전 으로 바꾸는 method
	public static String convertDate(String date) {
		String result = null;
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date_date = new Date();
		try {
			date_date = fm.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		long curTime = System.currentTimeMillis();
		long regTime = date_date.getTime();
		long diffTime = (curTime - regTime) / 1000;

		if (diffTime < CommonUtil.SEC) {
			// sec
			result = "방금 전";
		} else if ((diffTime /= CommonUtil.SEC) < CommonUtil.MIN) {
			// min
			result = diffTime + "분 전";
		} else if ((diffTime /= CommonUtil.MIN) < CommonUtil.HOUR) {
			// hour
			result = (diffTime) + "시간 전";
		} else if ((diffTime /= CommonUtil.HOUR) < CommonUtil.DAY) {
			// day
			result = (diffTime) + "일 전";
		} else if ((diffTime /= CommonUtil.DAY) < CommonUtil.MONTH) {
			// day
			result = (diffTime) + "달 전";
		} else {
			result = (diffTime) + "년 전";
		}
		return result;
	}
	
	//새로운 비밀번호 생성
	public static String getNewPassword(int pwLength) {
        StringBuffer temp =new StringBuffer();
        Random rnd = new Random();
        
        for(int i=0;i<pwLength;i++)
        {
            int rIndex = rnd.nextInt(3);
            switch (rIndex) {
            case 0:
                // a-z
                temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                break;
            case 1:
                // A-Z
                temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                break;
            case 2:
                // 0-9
                temp.append((rnd.nextInt(10)));
                break;
            }
//            System.out.println("pw :"+temp.toString());	
        }
        return temp.toString();		
	}
	
	//파일 경로 잡는 method
	public static String getFile_dir(HttpSession session) {
		String dir = session.getServletContext().getRealPath("/");
		return dir+"attach\\";
	}
	
	//오늘 날짜 요일까지
    public static String getToday(){
        Date time = new Date();
        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
        String today = format1.format(time);
        return today;
     }
    //오늘 날짜 시분초 
    public static String getTodayTime(){
       Date time = new Date();
       SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
       String today = format.format(time);
       return today;
    }
    
    //페이지 설정
 	public static String pageListPost(int current_page,int total_page, int pageNumber_count){
 		int pagenumber;    //화면에 보여질 페이지 인덱스수
 		int startpage;     //화면에 보여질 시작 페이지 번호
 		int endpage;       //화면에 보여질 마지막 페이지 번호
 		int curpage;       //이동하고자 하는 페이지 번호
 		
 		String strList=""; //리턴될 페이지 인덱스 리스트

 		pagenumber = pageNumber_count;   //한 화면의 페이지 인덱스수
 		
 		//시작 페이지 번호 구하기
 		startpage = ((current_page - 1/*컴퓨팅 수학은 0부터 시작하니까 기본값인 1에서 계산하기 위한 0으로*/)/ pagenumber) * pagenumber/*몫을 취해서 페이지당 갯수를 곱함*/ + 1/*보기 편하게 1부터 시작*/;
 		//마지막 페이지 번호 구하기
 		endpage = (((startpage -1) + pagenumber) / pagenumber)*pagenumber;
 		//총페이지수가 계산된 마지막 페이지 번호보다 작을 경우
 		//총페이지수가 마지막 페이지 번호가 됨
 		
 		if(total_page <= endpage)  endpage = total_page;
 					
 		//첫번째 페이지 인덱스 화면이 아닌경우
 		if(current_page > pagenumber){
 			curpage = startpage -1;  //시작페이지 번호보다 1적은 페이지로 이동
 			strList = strList +"<a href=javascript:goPaging('"+curpage+"') ><i class='fa fa-angle-double-left'></i></a>";
 		}
 						
 		//시작페이지 번호부터 마지막 페이지 번호까지 화면에 표시
 		curpage = startpage;
 		while(curpage <= endpage){
 			if(curpage == current_page){
 				strList = strList +"<a class='active'>"+current_page+"</a>";
 			} else {
 				strList = strList +"<a href=javascript:goPaging('"+curpage+"')>"+curpage+"</a>";
 			}
 			curpage++;
 		}
 		//뒤에 페이지가 더 있는 경우
 		if(total_page > endpage){
 			curpage = endpage+1;
 			strList = strList + "<a href=javascript:goPaging('"+curpage+"') ><i class='fa fa-angle-double-right'></i></a>";
 		}
 		return strList;
 	}
 	
 	//SHA256 암호화 매커니즘
 	public static String encryptSHA256(String value) throws NoSuchAlgorithmException{
        String encryptData ="";
         
        MessageDigest sha = MessageDigest.getInstance("SHA-256");
        sha.update(value.getBytes());
 
        byte[] digest = sha.digest();
        for (int i=0; i<digest.length; i++) {
            encryptData += Integer.toHexString(digest[i] &0xFF).toUpperCase();
        }
         
        return encryptData;
    }
}


