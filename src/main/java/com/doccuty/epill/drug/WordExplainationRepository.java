package com.doccuty.epill.drug;

import com.doccuty.epill.model.WordExplaination;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface WordExplainationRepository extends JpaRepository<WordExplaination, Integer> {

	@Query("SELECT wE FROM WordExplaination wE WHERE wE.name LIKE :value")
	List<WordExplaination> findByName(@Param(value = "value") String value);
}
