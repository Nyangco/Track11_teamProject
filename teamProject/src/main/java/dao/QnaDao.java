package dao;

import java.text.DecimalFormat;

import javax.servlet.http.HttpSession;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import common.CommonTemplate;
import dto.ModelDto;

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
	
	
}
