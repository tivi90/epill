package com.doccuty.epill.adverseeffectcontent;

import com.doccuty.epill.drug.Drug;
import com.doccuty.epill.model.PackagingTopic;
import com.doccuty.epill.model.AdverseEffect;
import com.doccuty.epill.packagingsection.PackagingSection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdverseEffectContentRepository extends JpaRepository<AdverseEffectContent, Long> {

	AdverseEffectContent findByTopicAndDrug(AdverseEffect topic, Drug drug);

}
