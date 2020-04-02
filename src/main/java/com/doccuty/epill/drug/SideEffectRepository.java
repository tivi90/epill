package com.doccuty.epill.drug;

import com.doccuty.epill.model.SideEffect;
import com.doccuty.epill.model.WordExplaination;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface SideEffectRepository extends JpaRepository<SideEffect, Long> {

	@Query("SELECT sE FROM SideEffect sE ORDER BY sE.sideEffect")
	List<SideEffect> findAllOrderByName();

	@Query("SELECT sE FROM SideEffect sE WHERE sE.sideEffect = :value")
	List<SideEffect> findByName(@Param(value = "value") String value);


	@Query("SELECT NEW SideEffect(sE.id, sE.sideEffect, sE.sideEffect) FROM SideEffect sE ORDER BY sE.sideEffect")
	List<SideEffect> findAllSimple();
}
