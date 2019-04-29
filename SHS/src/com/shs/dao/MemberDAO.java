package com.shs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.shs.dto.MemberDTO;
import com.shs.mybatis.SqlMapConfig;

public class MemberDAO {
	// MyBatis 세팅값 호출
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	
	// mapper에 접근하기 위한 SqlSession
	SqlSession sqlSession;
	
	// ---------------------------------------------------------------------------
	// Singleton 패턴을 활용한 DAO 객체 사용
	// : 객체 생성은 1회만 동작하고 생성된 객체를 빌려쓰는 형태
	// : + 외부에서는 객체생성이 불가능하도록 만듬
	
	private MemberDAO() {} // 외부에서 객체생성 못하게 막음
	
	private static MemberDAO instance = new MemberDAO(); // : 1회 객체 생성 (instance)
	
	public static MemberDAO getInstance() { // 외부에서 getInstance를 호출하면 객체를 빌려줌
		return instance;
	}
	// ---------------------------------------------------------------------------
	
	int result = 0;
	
	
	// 학생 등록
	public int memInsert(MemberDTO mDto) {
		sqlSession = sqlSessionFactory.openSession(true); // (true넣기) 2번 commit 방법
		// sqlSession.commit(); // 1번 commit 방법
		
		try {
			result = sqlSession.insert("memInsert", mDto);
			
			if(result > 0) {
				System.out.println("등록 성공");
			} else {
				System.out.println("등록 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	
	// 출석부 (학생 전체 출력)
	public List<MemberDTO> memSelect() {
		sqlSession = sqlSessionFactory.openSession();
		List<MemberDTO> list = null;
		try {
			list = sqlSession.selectList("memSelect");
			
			for (MemberDTO memberDTO : list) {
				System.out.print(memberDTO.getSid() + ", ");
				System.out.print(memberDTO.getSname() + ", ");
				System.out.print(memberDTO.getSphone());
				System.out.println();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
	}
	
	
	// 학생정보 출력(1명) - Update 페이지 출력시 사용
	public MemberDTO memInfo(int id) {
		
		sqlSession = sqlSessionFactory.openSession();
		MemberDTO mDto = null;
		try {
			mDto = sqlSession.selectOne("memInfo", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return mDto;
	}
	
	public int memUpdate(MemberDTO mDto) {
		sqlSession = sqlSessionFactory.openSession(true);
		try {
			result = sqlSession.update("memUpdate", mDto);
			
			if(result > 0) {
				System.out.println("회원정보 수정 성공");
			} else {
				System.out.println("회원정보 수정 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	
	public int memDelete(int id) {
		sqlSession = sqlSessionFactory.openSession(true);
		try {
			result = sqlSession.delete("memDelete", id);
			
			if(result > 0) {
				System.out.println("회원정보 삭제 성공");
			} else {
				System.out.println("회원정보 삭제 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
}
