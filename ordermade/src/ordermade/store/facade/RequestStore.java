package ordermade.store.facade;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ordermade.domain.Request;

public interface RequestStore {
	
	public boolean insertRequest(Request request);
	public boolean updateReqeustById(Request request);
	public boolean deleteRequestById(String id);
	public Request selectRequestById(String id); 
	public List<Request> selectRequestsByBound(String bound, String page);
	public List<Request> selectRequestsByBoundAndTitle(String bound, String title, String page);
	public List<Request> selectRequestsByBoundAndContent(String bound, String content, String page);
	public List<Request> selectRequestsByConsumerId(String consumerId, String page);
	public List<Request> selectRequestsByConsumerIdWithMaker(String consumerId, String page);
	public List<Request> selectRequestsByConsumerIdWithPayment(String consumerId, String page);
	public List<Request> selectRequestsByMakerId(String makerId, String page);
	public List<Request> selectRequestsByMakerIdWithPayment(String makerId, String page);
}
