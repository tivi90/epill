package com.doccuty.epill.sideeffectcontent;

import com.doccuty.epill.model.util.SideEffectContentCreator;
import com.doccuty.epill.sideeffectcontent.SideEffectContent;
import com.doccuty.epill.sideeffectcontent.SideEffectContentService;
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
@RequestMapping("/sideEffectContent")
public class SideEffectContentController {

    @Autowired
    private UserService userService;

    @Autowired
    private SideEffectContentService service;

    /**
     * get user profiles of all users
     */
    
    @RequestMapping(value="/all", method = RequestMethod.GET)
    public ResponseEntity<JsonObject> getAllSideEffectContent() {
    		// A pragmatic approach to security which does not use much framework-specific magic. While other approaches
        // with annotations, etc. are possible they are much more complex while this is quite easy to understand and
        // extend.
        if (userService.isAnonymous()) {
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }
        
        IdMap map = SideEffectContentCreator.createIdMap("");
		map.withFilter(Filter.regard(Deep.create(2)));
	    	
	    	List<SideEffectContent> set = service.getAllSideEffectContents();
	    	
	    	JsonObject json = new JsonObject();
	    	JsonArray sideArray = new JsonArray();
	
	    	for(SideEffectContent side : set) {
	    		sideArray.add(map.toJsonObject(side));
	    	}
    	
		json.add("value", sideArray);
			
		return new ResponseEntity<>(json, HttpStatus.OK);
    }
    
    /**
     * get a packaging side by id
     */
    
    @RequestMapping(value={"/{id}"}, method = RequestMethod.GET)
    public ResponseEntity<JsonObject> getSideEffectContentById(@PathVariable(value = "id") int id) {
    		// A pragmatic approach to security which does not use much framework-specific magic. While other approaches
        // with annotations, etc. are possible they are much more complex while this is quite easy to understand and
        // extend.
        if (userService.isAnonymous()) {
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }
        
        SideEffectContent side = service.getSideEffectContentById(id);
        
    		IdMap map = SideEffectContentCreator.createIdMap("");
		map.withFilter(Filter.regard(Deep.create(2)));
    	
    	
    		JsonObject json = new JsonObject();
		json.add("value", map.toJsonObject(side));

		return new ResponseEntity<>(json, HttpStatus.OK);
    }


    /**
     * get original packaging side by topicId and drugId
     */

    @RequestMapping(value={"/{effectId}/{drugId}"}, method = RequestMethod.GET)
    public ResponseEntity<JsonObject> getSideEffectContentByEffectAndDrug(@PathVariable(value = "effectId") long effectId, @PathVariable(value = "drugId") long drugId) {
        // A pragmatic approach to security which does not use much framework-specific magic. While other approaches
        // with annotations, etc. are possible they are much more complex while this is quite easy to understand and
        // extend.
        if (userService.isAnonymous()) {
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }

        SideEffectContent side = service.getSideEffectContentByTopicAndDrug(effectId, drugId);

        IdMap map = SideEffectContentCreator.createIdMap("");
        map.withFilter(Filter.regard(Deep.create(2)));


        JsonObject json = map.toJsonObject(side);

        return new ResponseEntity<>(json, HttpStatus.OK);
    }
}
