package com.myspring.mypro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.myspring.mypro.DAO.MemberDAO;
import com.myspring.mypro.VO.MemberVO;

@Service("HomeService")
public class HomeServiceImpl implements HomeService {

	@Autowired
	private MemberDAO memberDAO; 
	
	public MemberVO login(MemberVO memberVO) throws DataAccessException{
		MemberVO loginMember = new MemberVO();
		loginMember = memberDAO.login(memberVO);
		return loginMember;
	}
	@Override
	public List listMembers() throws DataAccessException{
		List membersList = null;
		membersList = memberDAO.selectAllMembers();
		return membersList;
	}
	
	@Override
	public int addMember(MemberVO memberVO) throws DataAccessException{
		int addMember = 0;
		addMember = memberDAO.insertMember(memberVO);
		return addMember;
	}
	
	@Override
	public void delMember(String id) throws DataAccessException{
		memberDAO.deleteMember(id);
	}
}
