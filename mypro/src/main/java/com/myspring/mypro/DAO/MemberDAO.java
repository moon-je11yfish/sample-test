package com.myspring.mypro.DAO;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.mypro.VO.MemberVO;

public interface MemberDAO {

	MemberVO login(MemberVO memberVO) throws DataAccessException ;

	int insertMember(MemberVO memberVO) throws DataAccessException;

	List selectAllMembers() throws DataAccessException;

	void deleteMember(String id) throws DataAccessException;

}
