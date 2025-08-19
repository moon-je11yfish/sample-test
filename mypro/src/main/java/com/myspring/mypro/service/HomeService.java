package com.myspring.mypro.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.mypro.VO.MemberVO;

public interface HomeService {
	public MemberVO login(MemberVO member) throws DataAccessException;

	List listMembers() throws DataAccessException;

	int addMember(MemberVO memberVO) throws DataAccessException;

	void delMember(String id) throws DataAccessException;
}
