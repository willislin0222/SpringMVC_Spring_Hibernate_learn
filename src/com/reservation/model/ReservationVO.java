package com.reservation.model;

import java.sql.Date;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import com.member.model.MemberVO;

public class ReservationVO {
	private String res_no;
	private MemberVO memberVO;
	private Date res_date;
	private String res_content;
	private String res_time;
	
	
	public String getRes_no() {
		return res_no;
	}
	public void setRes_no(String res_no) {
		this.res_no = res_no;
	}
	
	
	@Valid
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	
	@NotNull(message="預約日期: 請勿空白")
	public Date getRes_date() {
		return res_date;
	}
	public void setRes_date(Date res_date) {
		this.res_date = res_date;
	}
	
	
	@NotEmpty(message="預約項目: 請勿空白")
	public String getRes_content() {
		return res_content;
	}
	public void setRes_content(String res_content) {
		this.res_content = res_content;
	}
	
	
	@NotEmpty(message="預約時間: 請勿空白")
	public String getRes_time() {
		return res_time;
	}
	public void setRes_time(String res_time) {
		this.res_time = res_time;
	}
	
	
}
