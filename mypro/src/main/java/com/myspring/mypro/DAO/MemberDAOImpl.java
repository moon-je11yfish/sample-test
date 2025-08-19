package com.myspring.mypro.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.mypro.DAO.MemberDAO;
import com.myspring.mypro.VO.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberVO login(MemberVO memberVO) throws DataAccessException {
		// TODO Auto-generated method stub
		MemberVO result = sqlSession.selectOne("mapper.member.selectLoginMember", memberVO);
		return result;
	}
	
	@Override
	public int insertMember(MemberVO memberVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.member.insertMember", memberVO);
		return result;
	}
	
	@Override
	public List selectAllMembers() throws DataAccessException{
	
		List<MemberVO> membersList = null;
		membersList = sqlSession.selectList("mapper.member.selectAllMemberList");
		return membersList;
	}
	
	@Override
	public void deleteMember(String id) throws DataAccessException {
		sqlSession.insert("mapper.member.deleteMember", id);
	}
}
