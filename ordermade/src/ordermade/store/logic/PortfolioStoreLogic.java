package ordermade.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import ordermade.domain.Portfolio;
import ordermade.domain.Tag;
import ordermade.store.facade.PortfolioStore;
import ordermade.store.mapper.PortfolioMapper;

@Repository
public class PortfolioStoreLogic implements PortfolioStore {

	private SqlSessionFactory factory;
	
	public PortfolioStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}
	
	
	@Override
	public boolean insertPortfolio(Portfolio portfolio) {
		SqlSession session = factory.openSession();
		
		try{
			PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
			boolean check = mapper.insertPortfolio(portfolio);
			if(check) {
				session.commit();
			} else {
				session.rollback();
			}
			return check;
		
		} finally{
			session.close();
		}
		
	}

	@Override
	public boolean updatePortfolioById(Portfolio portfolio) {
		SqlSession session = factory.openSession();
		
		PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
		boolean check = mapper.updatePortfolioById(portfolio);
		if(check) {
			session.commit();
		} else {
			session.rollback();
		}
		return check;
	}

	@Override
	public boolean deletePortfolioById(String id) {
		SqlSession session = factory.openSession();
		
		PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
		boolean check = mapper.deletePortfolioById(id);
		if(check) {
			session.commit();
		} else {
			session.rollback();
		}
		return check;
	}

	public Portfolio selectPortfolioById(String id) {
		SqlSession session = factory.openSession();
		PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
		return  mapper.selectPortfolioById(id);
	}

	@Override
	public List<Portfolio> selectPortfoliosByMakerId(String makerId, String begin, String end) {
		SqlSession session = factory.openSession();
		
		List<Portfolio> pList = null;
		HashMap<String, String> map = new HashMap<>();
		map.put("makerId", makerId);
		map.put("begin", begin);
		map.put("end", end);
		try {
			PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
			pList = mapper.selectPortfoliosByMakerId(map);
		}finally {
			session.close();
		}
		return pList;
		
		//PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
		//return mapper.selectPortfoliosByMakerId(makerId, begin, end);
	}

	@Override
	public List<Portfolio> selectPortfoliosByMakerIdAndTitle(String makerId, String title, String begin, String end) {
		SqlSession session = factory.openSession();
		
		List<Portfolio> pList = null;
		HashMap<String, String> map = new HashMap<>();
		map.put("makerId", makerId);
		map.put("title", title);
		map.put("begin", begin);
		map.put("end", end);
		try {
			PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
			pList = mapper.selectPortfoliosByMakerId(map);
		}finally {
			session.close();
		}
		return pList;
		
//		PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
//		return mapper.selectPortfoliosByMakerIdAndTitle(makerId, title, page);
	}

	@Override
	public List<Portfolio> selectPortfoliosByCategory(String category, String begin, String end) {
		SqlSession session = factory.openSession();
		
		List<Portfolio> pList = null;
		HashMap<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("begin", begin);
		map.put("end", end);
		try {
			PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
			pList = mapper.selectPortfoliosByMakerId(map);
		}finally {
			session.close();
		}
		return pList;
		
//		PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
//		return mapper.selectPortfoliosByCategory(category, page);
	}
	
	@Override
	public List<Portfolio> selectPortfoliosByTags(List<Tag> tags) {
		SqlSession session = factory.openSession();
		PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
		return mapper.selectPortfoliosByTags(tags);
	}

}