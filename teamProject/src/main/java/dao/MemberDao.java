package dao;

import java.security.NoSuchAlgorithmException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import common.CommonTemplate;
import common.CommonUtil;
import common.MailContentSend;
import common.Private;
import dto.MemberDto;
import dto.ModelDto;

public class MemberDao {

	JdbcTemplate template = CommonTemplate.getTemplate();
	
	public boolean confirmEmail(ModelDto mdto) {
		String sql1 = "select count(*) from pjt_shop_member where id='"+mdto.getT_id()+"' and others='"+mdto.getT_email()+"'";
		String sql2 = "update pjt_shop_member set session_level=1, others='' where id='"+mdto.getT_id()+"'";
		try {
			int k = template.queryForInt(sql1);
			if(k==1) {
				k = template.update(sql2);
				if(k==1) {
					return true;
				}
			}
		}catch(DataAccessException e) {
			System.out.println("confirmEmail:");
			System.out.println(sql1);
			System.out.println(sql2);
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean confirmPW(ModelDto mdto) {
		String sql = null;
		try {
			String pw = CommonUtil.encryptSHA256(mdto.getT_email());
			sql = "select count(*) from pjt_shop_member where id='"+mdto.getT_id()+"' and password='"+pw+"'";
			int k = template.queryForInt(sql);
			if(k==1) return true;
		}catch(NoSuchAlgorithmException e) {
			System.out.println("암호화 오류");
			e.printStackTrace();
		}catch(DataAccessException e) {
			System.out.println("confirmPW:"+sql);
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean changePW(String id, String pw) {
		String sql = null;
		try {
			pw = CommonUtil.encryptSHA256(pw);
			sql = "update pjt_shop_member set password='"+pw+"', up_date=to_date('"+CommonUtil.getTodayTime()
					+"','yyyy-MM-dd hh24:mi:ss') where id='"+id+"'";
			int k = template.update(sql);
			if(k==1) return true;
		}catch(NoSuchAlgorithmException e) {
			System.out.println("암호화 오류");
			e.printStackTrace();
		}catch(DataAccessException e) {
			System.out.println("changePW:"+sql);
			e.printStackTrace();
		}
		return false;
	}

	public boolean findPW(String email, String id) {
		String sql = "select count(*) from pjt_shop_member where email='"+email+"' and id='"+id+"'";
		try {
			int k = template.queryForInt(sql);
			if(k==1) return true;
		}catch(DataAccessException e) {
			System.out.println("findPW:"+sql);
			e.printStackTrace();
		}
		return false;
	}
	
	public String findID(String email) {
		String id = null;
		String sql = "select id from pjt_shop_member where email='"+email+"'";
		try {
			id = template.queryForObject(sql,String.class);
		}catch(DataAccessException e) {
			System.out.println("findID:"+sql);
			e.printStackTrace();
		}
		return id;
	}
	
	public int refund(ModelDto mdto) {
		int k = 0;
		int status = 0;
		if(mdto.getT_select().equals("refund")) status=6;
		else status=8;
		String sql = "update pjt_shop_purchase set reason='"+mdto.getT_search()+"', status="+status+" "
				+ "where purchase_no='"+mdto.getT_purchase_no()+"'";
		try {
			k = template.update(sql);
		}catch(DataAccessException e) {
			System.out.println("refund:"+sql);
			e.printStackTrace();
		}
		return k;
	}
	
	public MemberDto purchase(String id) {
		MemberDto dto = null;
		String sql = "select id,name,contact,email,addr1,addr2,addr3 from pjt_shop_member where id='"+id+"'";
		try {
			RowMapper<MemberDto> rowmap = new BeanPropertyRowMapper<MemberDto>(MemberDto.class);
			dto = template.queryForObject(sql, rowmap);
		}catch(DataAccessException e) {
			System.out.println("purchase:"+sql);
			e.printStackTrace();
		}
		return dto;
	}
	
	public int member_update(ModelDto dto) {
		int k = 0;
		String contact = dto.getT_tel1()+"-"+dto.getT_tel2()+"-"+dto.getT_tel3();
		String sql1 = null;
		String sql2 = "update pjt_shop_member set name='"+dto.getT_name()+"',nick='"+dto.getT_nickname()
					+"',email='"+dto.getT_email()+"',contact='"+contact+"',addr1='"+dto.getT_addr1()
					+"',addr2='"+dto.getT_addr2()+"',addr3='"+dto.getT_addr3()+"',up_date=to_date('"
					+CommonUtil.getTodayTime()+"','yyyy-MM-dd hh24:mi:ss') where id='"+dto.getT_id()+"'";
		try {
			String pw = CommonUtil.encryptSHA256(dto.getT_pw());
			sql1 = "select count(*) from pjt_shop_member where id='"+dto.getT_id()+"' and password='"+pw+"'";
			int i = template.queryForInt(sql1);
			if(i==1) {
				k = template.update(sql2);
			}else {
				k = -1;
			}
		}catch(NoSuchAlgorithmException e) {
			System.out.println("member_update encrypt error");
			e.printStackTrace();
		}catch(DataAccessException e) {
			System.out.println("member_update");
			System.out.println(sql1);
			System.out.println(sql2);
		}
		return k;
	}
	
	public MemberDto mypage(String id) {
		MemberDto dto = null;
		String sql = "select nick, email, contact, addr1, addr2, addr3, to_char(reg_date,'yyyy-MM-dd') reg_date, "
					+ "to_char(login_date,'yyyy-MM-dd hh24:mi:ss') login_date, to_char(up_date,'yyyy-MM-dd hh24:mi:ss') up_date "
					+ "from pjt_shop_member where id='"+id+"'";
		try {
			RowMapper<MemberDto> rowmap = new BeanPropertyRowMapper<MemberDto>(MemberDto.class);
			dto = template.queryForObject(sql, rowmap);
		}catch(DataAccessException e) {
			System.out.println("mypage:"+sql);
			e.printStackTrace();
		}
		return dto;
	}
	
	public int login(ModelDto mdto,HttpSession session) {
		int k = 0;
		String sql = null;
		String sql2 = null;
		try {
			String pw = CommonUtil.encryptSHA256(mdto.getT_pw());
			sql = "select exit_date,name,session_level from pjt_shop_member where id='"
						+mdto.getT_id()+"' and password='"+pw+"'";
			sql2 = "update pjt_shop_member set login_date=to_date('"+CommonUtil.getTodayTime()+"','yyyy-MM-dd hh24:mi:ss') "
					+ "where id='"+mdto.getT_id()+"' and password='"+pw+"'";
			MemberDto dto = new MemberDto();
			RowMapper<MemberDto> rowmap = new BeanPropertyRowMapper<MemberDto>(MemberDto.class);
			dto = template.queryForObject(sql, rowmap);
			if(dto!=null) {
				if(dto.getExit_date()==null) {
					session.setAttribute("sName", dto.getName());
					session.setAttribute("sLevel", dto.getSession_level());
					session.setAttribute("sId", mdto.getT_id());
					session.setMaxInactiveInterval(60*60);
					k=1;
					if(Integer.parseInt(dto.getSession_level())==0) {
						k=3;
					}
					template.execute(sql2);
				}else {
					k=-1;
				}
			}else {
				k=2;
			}
		}catch(NoSuchAlgorithmException e) {
			System.out.println("login 암호화 오류");
		}catch(DataAccessException e) {
			System.out.println("login:");
			System.out.println(sql);
			System.out.println(sql2);
		}
		return k;
	}
	
	public int insertDB(ModelDto mdto) {
		int k = 0;
		String sql = null;
		String uuid = UUID.randomUUID().toString();
		try {
			String contact = mdto.getT_tel1()+"-"+mdto.getT_tel2()+"-"+mdto.getT_tel3();
			String pw = CommonUtil.encryptSHA256(mdto.getT_pw());
			sql = "insert into pjt_shop_member (id,password,name,nick,email,contact,addr1,addr2,addr3,others) values('"
					+mdto.getT_id()+"','"+pw+"','"+mdto.getT_name()+"','"+mdto.getT_nickname()+"','"+mdto.getT_email()
					+"','"+contact+"','"+mdto.getT_addr1()+"','"+mdto.getT_addr2()+"','"+mdto.getT_addr3()+"','"+uuid+"')";
			k = template.update(sql);
			if(k==1) {
				String mailSet_Server=Private.server; // 보내는 메일 server
				String mailSet_ID=Private.id;        // 보내는 메일 ID
				String mailSet_PW=Private.pw;        // 보내는 메일 비밀번호

				String mailFromName ="JSL";            // 보내는 사람 이름
				String mailFromAddress =Private.sender; // 보내는 메일 주소
				
				String mailTo    = mdto.getT_email();           // 받는  메일 주소
				String mailTitle =" JSL에서 이메일 인증 코드를 발송합니다.";   // 메일 제목
				String content = 	                             // 메일내용
				" <table width='400' height='200' border='0' > "+
				" <tr> "+
				" 	<td colspan='2' height='100' style='text-align:center;'>ID 안내</td> "+
				" </tr> "+
				" <tr>"+
				" 	<td width='120' align='center'>인증코드는</td> "+
				" </tr> "+
				" <tr>"+
				" 	<td width='280' align='left'>"+uuid+
				" </tr> "+
				" <tr>"+
				"   <font size='5' color='red'></font> 입니다</td> "+
				" </tr> "+
				" <tr>"+
				" 	<td width='120' align='center'>Mypage>인증 코드 입력 에서 입력해주세요</td> "+
				" </tr> "+
				" </table> ";
				
				MailContentSend mail = new MailContentSend();
				mail.setMail(mailSet_Server, mailSet_ID, mailSet_PW);
				mail.sendMail(mailFromName, mailFromAddress, mailTo, mailTitle, content);
			}
		}catch(NoSuchAlgorithmException e) {
			System.out.println("insertDB encrypt error");
		}catch(DataAccessException e) {
			System.out.println("inserDB:"+sql);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return k;
	}
	
	//회원가입 시 서버에 이미 id가 있는지 확인
	public int memberCheckId(String id) 
	{
		String query = "select count(*) from pjt_shop_member\n" + 
				"where id = '"+id+"'";
		int result = template.queryForObject(query, Integer.class);
		return result;
	}
	
	//회원가입 시 서버에 이미 닉네임이 있는지 확인
	public int memberCheckNick(String nick) 
	{
		String query = "select count(*) from pjt_shop_member\n" + 
				"where nick = '"+nick+"'";
		int result = template.queryForObject(query, Integer.class);
		return result;
	}
	
	//회원가입 시 서버에 이미 이메일이 있는지 확인
	public int memberCheckEmail(String email) 
	{
		String query = "select count(*) from pjt_shop_member\n" + 
				"where email = '"+email+"'";
		int result = template.queryForObject(query, Integer.class);
		return result;
	}
}
