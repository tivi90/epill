package com.doccuty.epill.adverseeffectcontent;

import com.doccuty.epill.model.AdverseEffect;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface AdverseEffectRepository extends JpaRepository<AdverseEffect, Long> {

	@Query("SELECT sE FROM AdverseEffect sE ORDER BY sE.adverseEffect")
	List<AdverseEffect> findAllOrderByName();

	@Query("SELECT sE FROM AdverseEffect sE WHERE sE.adverseEffect = :value")
	List<AdverseEffect> findByName(@Param(value = "value") String value);


	@Query("SELECT NEW AdverseEffect(sE.id, sE.adverseEffect, sE.adverseEffect) FROM AdverseEffect sE ORDER BY sE.adverseEffect")
	List<AdverseEffect> findAllSimple();
}
