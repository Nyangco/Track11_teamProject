package dao;

import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import common.CommonTemplate;
import common.CommonUtil;
import dto.ModelDto;
import dto.QnaDto;

public class QnaDao {
	JdbcTemplate temp = CommonTemplate.getTemplate();

	public int QnaSave(ModelDto mdto,HttpSession session) {
		DecimalFormat df = new DecimalFormat("Q0000");
		int k = 0;
		String id = (String)session.getAttribute("sId");
		String sql = "select nvl(max(qna_no),'Q0000') from pjt_shop_qna";
		
		String query= null;
		try {
			String i = (String)temp.queryForObject(sql, String.class);
			i = df.format(Integer.parseInt(i.substring(1))+1);
			query="insert into pjt_shop_qna\r\n" + 
					"(QNA_NO,REG_ID,TITLE,CONTENT)\r\n" + 
					"values\r\n" + 
					"('"+i+"','"+id+"','"+mdto.getT_title()+"','"+mdto.getT_content()+"')";
			k = temp.update(query);
		}catch(DataAccessException d){
			System.out.println("QnaSave:"+query);
			d.printStackTrace();
		}
		return k;
	}

	public ArrayList<QnaDto> getQnaList(String select, String search) {
		ArrayList<QnaDto> dtos = new ArrayList<QnaDto>();
		String query ="select q.qna_no,q.title,m.name,\r\n" + 
				"to_char(to_date(q.reg_date),'yyyy-mm-dd') reg_date,\r\n" + 
				"q.reply\r\n" + 
				"from pjt_shop_qna q, pjt_shop_member m\r\n" + 
				"where q.reg_id = m.id\r\n" + 
				"and "+select+" like '%"+search+"%'\r\n" + 
				"order by reg_date desc";
		try{
			RowMapper<QnaDto> rowmapper = 
					new BeanPropertyRowMapper<QnaDto>(QnaDto.class);
			dtos = (ArrayList<QnaDto>)temp.query(query, rowmapper);
		}catch(DataAccessException e){
			System.out.println("getQnaList:"+query);
			e.printStackTrace();
		}
		return dtos;
	}
	public QnaDto detail(ModelDto mdto) {
		QnaDto dto = null;
		String sql = "select q.qna_no,q.title,q.content,m.name,\r\n" + 
				"to_char(to_date(q.reg_date),'yyyy-mm-dd') reg_date,\r\n" + 
				"q.reply,\r\n" + 
				"to_char(to_date(q.reply_date),'yyyy-mm-dd') reply_date\r\n" + 
				"from pjt_shop_qna q, pjt_shop_member m\r\n" + 
				"where q.reg_id = m.id\r\n" + 
				"and q.qna_no = '"+mdto.getT_qna_no()+"'\r\n" + 
				"order by reg_date desc";
		try {
			RowMapper<QnaDto> rowmapper = new BeanPropertyRowMapper<QnaDto>(QnaDto.class);
			dto = temp.queryForObject(sql, rowmapper);
		}catch(DataAccessException e) {
			System.out.println("detail:"+sql);
			e.printStackTrace();
		}
		return dto;
	}

	public int qna_update(ModelDto mdto) {
		int k = 0;
		String sql = "update pjt_shop_qna \r\n" + 
				"set title = '"+mdto.getT_title()+"',\r\n" + 
				"    content = '"+mdto.getT_content()+"',\r\n" + 
				"    update_date ='"+CommonUtil.getToday()+"'\r\n" + 
				"where qna_no = '"+mdto.getT_qna_no()+"'";
		try {
				k = temp.update(sql);
		}catch(DataAccessException e) {
			System.out.println("qna_update:"+sql);
			e.printStackTrace();
		}		
		return k;
	}

	public int qna_delete(ModelDto mdto) {
		int k = 0;
		String sql = "delete pjt_shop_qna\r\n" + 
				"where qna_no ='"+mdto.getT_qna_no()+"'";
		System.out.println(sql);
		try {
				k = temp.update(sql);
		}catch(DataAccessException e) {
			System.out.println("qna_delete:"+sql);
			e.printStackTrace();
		}		
		return k;
	}

	public int QnaReplyUpdate(ModelDto mdto, HttpSession session) {
		int k =0;
		String query="update pjt_shop_qna \r\n" + 
				"set reply = '"+mdto.getT_reply()+"',\r\n" + 
				"    reply_date = '"+mdto.getT_reply_date()+"'\r\n" + 
				"where qna_no = '"+mdto.getT_qna_no()+"'";
		try {
			k = temp.update(query);
		}catch(DataAccessException d){
			System.out.println("QnaSave:"+query);
			d.printStackTrace();
		}
		return k;
	}
	
}
