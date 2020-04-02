package com.doccuty.epill.sideeffectcontent;

import com.doccuty.epill.drug.Drug;
import com.doccuty.epill.model.PackagingTopic;
import com.doccuty.epill.model.SideEffect;
import com.doccuty.epill.packagingsection.PackagingSection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SideEffectContentRepository extends JpaRepository<SideEffectContent, Long> {

	SideEffectContent findByTopicAndDrug(SideEffect topic, Drug drug);

}
