package com.doccuty.epill.adverseeffectcontent;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doccuty.epill.drug.Drug;
import com.doccuty.epill.drug.DrugService;
import com.doccuty.epill.model.AdverseEffect;
import com.doccuty.epill.drug.AdverseEffectRepository;

import java.util.List;

/**
 * Handle all CRUD operations for posts.
 */
@Service
public class AdverseEffectContentService {

    private static final Logger LOG = LoggerFactory.getLogger(AdverseEffectContentService.class);

    @Autowired
    AdverseEffectContentRepository repository;
    
    @Autowired
	AdverseEffectRepository topicRepository;


    @Autowired
    DrugService drugService;
    

	public List<AdverseEffectContent> getAllAdverseEffectContents() {
		return (List<AdverseEffectContent>) repository.findAll();
	}

	public AdverseEffectContent getAdverseEffectContentById(long id) {
		return repository.findOne(id);
	}

	public AdverseEffectContent getAdverseEffectContentByTopicAndDrug(long topicId, long drugId) {

		AdverseEffect topic = new AdverseEffect();
		topic.withId(topicId);
		
		Drug drug = new Drug();
		drug.withId(drugId);
		
		AdverseEffectContent adverse = repository.findByTopicAndDrug(topic, drug);
		return adverse;
	}
	

}
