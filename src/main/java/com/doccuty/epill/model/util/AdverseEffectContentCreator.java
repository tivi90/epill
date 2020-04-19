/*
   Copyright (c) 2017 mac
   
   Permission is hereby granted, free of charge, to any person obtaining a copy of this software 
   and associated documentation files (the "Software"), to deal in the Software without restriction, 
   including without limitation the rights to use, copy, modify, merge, publish, distribute, 
   sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is 
   furnished to do so, subject to the following conditions: 
   
   The above copyright notice and this permission notice shall be included in all copies or 
   substantial portions of the Software. 
   
   The Software shall be used for Good, not Evil. 
   
   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING 
   BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND 
   NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, 
   DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 
 */

package com.doccuty.epill.model.util;

import com.doccuty.epill.drug.Drug;
import com.doccuty.epill.iteminvocation.ItemInvocation;
import com.doccuty.epill.model.AdverseEffect;
import com.doccuty.epill.adverseeffectcontent.AdverseEffectContent;
import de.uniks.networkparser.IdMap;
import de.uniks.networkparser.interfaces.SendableEntityCreatorNoIndex;

public class AdverseEffectContentCreator implements SendableEntityCreatorNoIndex {
    private final String[] properties = new String[]
            {
                    AdverseEffectContent.PROPERTY_ID,
                    AdverseEffectContent.PROPERTY_TOPIC,
                    AdverseEffectContent.PROPERTY_TEXT,
                    AdverseEffectContent.PROPERTY_PURPOSE,
                    AdverseEffectContent.PROPERTY_NUMBER,

                    //AdverseEffectContent.PROPERTY_DRUG,

            };

    @Override
    public String[] getProperties() {
        return properties;
    }

    @Override
    public Object getSendableInstance(boolean reference) {
        return new AdverseEffectContent();
    }

    @Override
    public Object getValue(Object target, String attrName) {
        int pos = attrName.indexOf('.');
        String attribute = attrName;

        if (pos > 0) {
            attribute = attrName.substring(0, pos);
        }

        if (AdverseEffectContent.PROPERTY_ID.equalsIgnoreCase(attribute)) {
            return ((AdverseEffectContent) target).getId();
        }

        if (AdverseEffectContent.PROPERTY_TOPIC.equalsIgnoreCase(attribute)) {
            return ((AdverseEffectContent) target).getTopic();
        }

        if (AdverseEffectContent.PROPERTY_TEXT.equalsIgnoreCase(attribute)) {
            return ((AdverseEffectContent) target).getText();
        }
        if (AdverseEffectContent.PROPERTY_PURPOSE.equalsIgnoreCase(attribute)) {
            return ((AdverseEffectContent) target).getPurpose();
        }

        if (AdverseEffectContent.PROPERTY_NUMBER.equalsIgnoreCase(attribute)) {
            return ((AdverseEffectContent) target).getNumber();
        }

        if (AdverseEffectContent.PROPERTY_DRUG.equalsIgnoreCase(attribute)) {
            return ((AdverseEffectContent) target).getDrug();
        }

        return null;
    }

    @Override
    public boolean setValue(Object target, String attrName, Object value, String type) {

        if (AdverseEffectContent.PROPERTY_TEXT.equalsIgnoreCase(attrName)) {
            ((AdverseEffectContent) target).setText((String) value);
            return true;
        }
        if (AdverseEffectContent.PROPERTY_PURPOSE.equalsIgnoreCase(attrName)) {
            ((AdverseEffectContent) target).setPurpose((String) value);
            return true;
        }
        if (AdverseEffectContent.PROPERTY_NUMBER.equalsIgnoreCase(attrName)) {
            ((AdverseEffectContent) target).setNumber((String) value);
            return true;
        }
        if (AdverseEffectContent.PROPERTY_TOPIC.equalsIgnoreCase(attrName)) {
            ((AdverseEffectContent) target).setTopic((AdverseEffect) value);
            return true;
        }

        if (AdverseEffectContent.PROPERTY_ID.equalsIgnoreCase(attrName)) {
            ((AdverseEffectContent) target).setId(Integer.parseInt(value.toString()));
            return true;
        }

        if (SendableEntityCreatorNoIndex.REMOVE.equals(type) && value != null) {
            attrName = attrName + type;
        }

        if (AdverseEffectContent.PROPERTY_DRUG.equalsIgnoreCase(attrName)) {
            ((AdverseEffectContent) target).setDrug((Drug) value);
            return true;
        }


        return false;
    }

    public static IdMap createIdMap(String sessionID) {
        return CreatorCreator.createIdMap(sessionID);
    }

    //==========================================================================
    public void removeObject(Object entity) {
        ((AdverseEffectContent) entity).removeYou();
    }
}
