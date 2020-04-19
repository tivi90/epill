package com.doccuty.epill.adverseeffectcontent;

import com.doccuty.epill.model.util.AdverseEffectContentCreator;
import com.doccuty.epill.user.UserService;
import de.uniks.networkparser.Deep;
import de.uniks.networkparser.Filter;
import de.uniks.networkparser.IdMap;
import de.uniks.networkparser.json.JsonArray;
import de.uniks.networkparser.json.JsonObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/adverseEffectContent")
public class AdverseEffectContentController {

    @Autowired
    private UserService userService;

    @Autowired
    private AdverseEffectContentService service;

    /**
     * get user profiles of all users
     */
    
    @RequestMapping(value="/all", method = RequestMethod.GET)
    public ResponseEntity<JsonObject> getAllAdverseEffectContent() {
    		// A pragmatic approach to security which does not use much framework-specific magic. While other approaches
        // with annotations, etc. are possible they are much more complex while this is quite easy to understand and
        // extend.
        if (userService.isAnonymous()) {
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }
        
        IdMap map = AdverseEffectContentCreator.createIdMap("");
		map.withFilter(Filter.regard(Deep.create(2)));
	    	
	    	List<com.doccuty.epill.adverseeffectcontent.AdverseEffectContent> set = service.getAllAdverseEffectContents();
	    	
	    	JsonObject json = new JsonObject();
	    	JsonArray adverseArray = new JsonArray();
	
	    	for(com.doccuty.epill.adverseeffectcontent.AdverseEffectContent adverse : set) {
	    		adverseArray.add(map.toJsonObject(adverse));
	    	}
    	
		json.add("value", adverseArray);
			
		return new ResponseEntity<>(json, HttpStatus.OK);
    }
    
    /**
     * get a packaging adverse by id
     */
    
    @RequestMapping(value={"/{id}"}, method = RequestMethod.GET)
    public ResponseEntity<JsonObject> getAdverseEffectContentById(@PathVariable(value = "id") int id) {
    		// A pragmatic approach to security which does not use much framework-specific magic. While other approaches
        // with annotations, etc. are possible they are much more complex while this is quite easy to understand and
        // extend.
        if (userService.isAnonymous()) {
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }
        
        com.doccuty.epill.adverseeffectcontent.AdverseEffectContent adverse = service.getAdverseEffectContentById(id);
        
    		IdMap map = AdverseEffectContentCreator.createIdMap("");
		map.withFilter(Filter.regard(Deep.create(2)));
    	
    	
    		JsonObject json = new JsonObject();
		json.add("value", map.toJsonObject(adverse));

		return new ResponseEntity<>(json, HttpStatus.OK);
    }


    /**
     * get original packaging adverse by topicId and drugId
     */

    @RequestMapping(value={"/{effectId}/{drugId}"}, method = RequestMethod.GET)
    public ResponseEntity<JsonObject> getAdverseEffectContentByEffectAndDrug(@PathVariable(value = "effectId") long effectId, @PathVariable(value = "drugId") long drugId) {
        // A pragmatic approach to security which does not use much framework-specific magic. While other approaches
        // with annotations, etc. are possible they are much more complex while this is quite easy to understand and
        // extend.
        if (userService.isAnonymous()) {
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }

        com.doccuty.epill.adverseeffectcontent.AdverseEffectContent adverse = service.getAdverseEffectContentByTopicAndDrug(effectId, drugId);

        IdMap map = AdverseEffectContentCreator.createIdMap("");
        map.withFilter(Filter.regard(Deep.create(2)));


        JsonObject json = map.toJsonObject(adverse);

        return new ResponseEntity<>(json, HttpStatus.OK);
    }
}
