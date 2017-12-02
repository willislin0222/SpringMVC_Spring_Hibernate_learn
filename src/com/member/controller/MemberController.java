package com.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;

import com.member.model.MemberService;
import com.reservation.model.ReservationVO;


import java.util.Set;

@Controller
@RequestMapping("/member")
public class MemberController {

	
	/*
	 * This method will be called on listAllDept.jsp form submission, handling POST
	 */
	@RequestMapping(method = RequestMethod.POST, value = "listReservations_ByMemno")
	public String listReservations_ByMemno(@RequestParam("mem_no") String mem_no, ModelMap model, @RequestParam("requestURL") String requestURL) {
		System.out.println("requestURL="+requestURL); // 送出查詢的來源網頁路徑: 可能為【/select_page.jsp】 或 【 /member/listAllMember.jsp】

		/***************************2.開始查詢資料***************************************/
		MemberService memberSvc = new MemberService();
		Set<ReservationVO> set = memberSvc.getReservarionsByMemno(mem_no);

		/***************************3.查詢完成,準備轉交(Send the Success view)***********/
		model.addAttribute("listReservations_ByMemno", set);         // 資料庫取出的set物件,存入request
		
		String targetURL = null;
		if ("/select_page.jsp".equals(requestURL))
			targetURL = "/member/listReservations_ByMemno";            // 來自 select_page.jsp 的請求, 成功轉交目標網頁member/listReservations_ByMemno.jsp
		else if ("/member/listAllMember.jsp".equals(requestURL))
			targetURL = "/member/listAllMember";                  // 來自 member/listAllMember.jsp 的請求, 成功轉交目標網頁 member/listAllMember.jsp
		
		return targetURL; // 查詢成功後,轉交至目標網頁
	}
	
	
	/*
	 * This method will be called on listAllDept.jsp form submission, handling POST
	 */
	@RequestMapping(method = RequestMethod.POST, value = "delete_Member")
	public String delete_Member(@RequestParam("mem_no") String mem_no) {
		
		/***************************2.開始刪除資料***************************************/
		MemberService memberSvc = new MemberService();
		memberSvc.deletet(mem_no);
		
		/***************************3.查詢完成,準備轉交(Send the Success view)***********/
		return "member/listAllMember"; // 來自 member/listAllMember.jsp的刪除請求, 成功轉交 member/listAllMember.jsp
	}
	
}