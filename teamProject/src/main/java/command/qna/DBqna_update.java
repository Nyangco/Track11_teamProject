package command.qna;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dao.QnaDao;
import dto.ModelDto;

public class DBqna_update implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		QnaDao dao = new QnaDao();
		int k = dao.qna_update(mdto);
		String msg = "QNA 수정에 실패하였습니다";
		String url = "qna_list";
		if(k==1) {
			msg = "QNA 수정에 성공하였습니다";
			url = "qna_list";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
	}

}
