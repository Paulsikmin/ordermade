package ordermade.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ordermade.domain.Tag;

public interface TagMapper {
	public int insertTag(Tag tag);

	public int deleteTagById(String id);

	public List<Tag> selectTagsByPortfolioId(String portfolioId);

	public List<Tag> TagsFromGoogleVision(String path);
}
