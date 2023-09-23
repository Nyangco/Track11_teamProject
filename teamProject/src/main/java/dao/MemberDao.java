package dao;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpSession;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import common.CommonTemplate;
import common.CommonUtil;
import dto.MemberDto;
import dto.ModelDto;
import dto.ProductDto;

public class MemberDao {

	JdbcTemplate template = CommonTemplate.getTemplate();
	
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
		try {
			String contact = mdto.getT_tel1()+"-"+mdto.getT_tel2()+"-"+mdto.getT_tel3();
			String pw = CommonUtil.encryptSHA256(mdto.getT_pw());
			sql = "insert into pjt_shop_member (id,password,name,nick,email,contact,addr1,addr2,addr3) values('"
					+mdto.getT_id()+"','"+pw+"','"+mdto.getT_name()+"','"+mdto.getT_nickname()+"','"+mdto.getT_email()
					+"','"+contact+"','"+mdto.getT_addr1()+"','"+mdto.getT_addr2()+"','"+mdto.getT_addr3()+"')";
			
			k = template.update(sql);
		}catch(NoSuchAlgorithmException e) {
			System.out.println("insertDB encrypt error");
		}catch(DataAccessException e) {
			System.out.println("inserDB:"+sql);
		}
		return k;
	}
}
