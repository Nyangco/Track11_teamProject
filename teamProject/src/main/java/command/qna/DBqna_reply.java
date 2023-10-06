package command.qna;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dao.QnaDao;
import dto.ModelDto;

public class DBqna_reply implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		QnaDao dao = new QnaDao();
		int k = dao.QnaReplyUpdate(mdto,session);
		String msg = "답변 저장에 성공했습니다";
		String url = "qna_list";
		if(k != 1) {
			msg = "답변 저장에 실패했습니다";
			url = "qna_list";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);

	}

}
