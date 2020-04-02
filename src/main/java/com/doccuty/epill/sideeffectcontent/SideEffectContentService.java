package com.doccuty.epill.sideeffectcontent;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doccuty.epill.drug.Drug;
import com.doccuty.epill.drug.DrugService;
import com.doccuty.epill.model.SideEffect;
import com.doccuty.epill.sideeffectcontent.SideEffectContentRepository;
import com.doccuty.epill.drug.SideEffectRepository;
import com.doccuty.epill.tailoredtext.TailoredTextService;
import com.doccuty.epill.user.User;
import com.doccuty.epill.user.UserService;
import java.util.List;

/**
 * Handle all CRUD operations for posts.
 */
@Service
public class SideEffectContentService {

    private static final Logger LOG = LoggerFactory.getLogger(SideEffectContentService.class);

    @Autowired
    SideEffectContentRepository repository;
    
    @Autowired
	SideEffectRepository topicRepository;


    @Autowired
    DrugService drugService;
    

	public List<SideEffectContent> getAllSideEffectContents() {
		return (List<SideEffectContent>) repository.findAll();
	}

	public SideEffectContent getSideEffectContentById(long id) {
		return repository.findOne(id);
	}

	public SideEffectContent getSideEffectContentByTopicAndDrug(long topicId, long drugId) {

		SideEffect topic = new SideEffect();
		topic.withId(topicId);
		
		Drug drug = new Drug();
		drug.withId(drugId);
		
		SideEffectContent side = repository.findByTopicAndDrug(topic, drug);
		return side;
	}
	

}
