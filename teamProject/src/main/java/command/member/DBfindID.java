package command.member;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import common.MailContentSend;
import common.Private;
import dao.MemberDao;
import dto.ModelDto;

public class DBfindID implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		// TODO Auto-generated method stub
		MemberDao dao = new MemberDao();
		
		String msg = "해당하는 계정이 없습니다. 다시 확인해주세요";
		String url = "findID";
		
		String email = mdto.getT_email();
		
		String id = dao.findID(email);
		
		if(id!=null) {
			String mailSet_Server=Private.server; // 보내는 메일 server
			String mailSet_ID=Private.id;        // 보내는 메일 ID
			String mailSet_PW=Private.pw;        // 보내는 메일 비밀번호

			String mailFromName ="JSL";            // 보내는 사람 이름
			String mailFromAddress =Private.sender; // 보내는 메일 주소
			
			String mailTo    = email;           // 받는  메일 주소
			String mailTitle =" JSL에서 아이디를 재발송 합니다.";   // 메일 제목
			String content = 	                             // 메일내용
			" <table width='400' height='200' border='0' > "+
			" <tr> "+
			" 	<td colspan='2' height='100' style='text-align:center;'>ID 안내</td> "+
			" </tr> "+
			" <tr>"+
			" 	<td width='120' align='center'>ID는</td> "+
			" 	<td width='280' align='left'>"+id+
			"        <font size='5' color='red'></font> 입니다</td> "+
			" </tr> "+
			" </table> ";
			
			msg = "메일 주소로 ID를 발송했습니다.";
			url = "login";
			
			try {
				MailContentSend mail = new MailContentSend();
				mail.setMail(mailSet_Server, mailSet_ID, mailSet_PW);
				mail.sendMail(mailFromName, mailFromAddress, mailTo, mailTitle, content);
			}catch(Exception e) {
				e.printStackTrace();
				msg = "메일 발송 오류가 발생했습니다.";
			}
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
	}

}
