package command.member;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import common.MailContentSend;
import common.Private;
import dao.MemberDao;
import dto.ModelDto;

public class DBfindPW implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		// TODO Auto-generated method stub
		MemberDao dao = new MemberDao();
		
		String email = mdto.getT_email();
		String id = mdto.getT_id();
		
		String msg = "해당하는 계정이 없습니다. 다시 확인해주세요";
		String url = "findPW";
		
		if(dao.findPW(email,id)) {
			String uuid = UUID.randomUUID().toString();
			if(dao.changePW(id,uuid)) {
				String mailSet_Server="smtp.mail.nate.com"; // 보내는 메일 server
				String mailSet_ID=Private.id;        // 보내는 메일 ID
				String mailSet_PW=Private.pw;        // 보내는 메일 비밀번호

				String mailFromName ="JSL";            // 보내는 사람 이름
				String mailFromAddress =Private.sender; // 보내는 메일 주소
				
				String mailTo    = email;           // 받는  메일 주소
				String mailTitle =" JSL에서 임시비밀번호를 발송 합니다.";   // 메일 제목
				String content = 	                             // 메일내용
				" <table width='400' height='200' border='0' > "+
				" <tr> "+
				" 	<td height='100' style='text-align:center;'>ID 안내</td> "+
				" </tr> "+
				" <tr>"+
				" 	<td width='120' align='center'>임시 비밀번호는</td> "+
				" 	<td width='280' align='left'>"+uuid+"</td>"+
				"   <td>입니다</td> "+
				" </tr> "+
				" </table> ";

				msg = "메일 주소로 임시 비밀번호를 발송했습니다.";
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
}
