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
import com.doccuty.epill.model.SideEffect;
import com.doccuty.epill.sideeffectcontent.SideEffectContent;
import de.uniks.networkparser.IdMap;
import de.uniks.networkparser.interfaces.SendableEntityCreatorNoIndex;

public class SideEffectContentCreator implements SendableEntityCreatorNoIndex {
    private final String[] properties = new String[]
            {
                    SideEffectContent.PROPERTY_ID,
                    SideEffectContent.PROPERTY_TOPIC,
                    SideEffectContent.PROPERTY_TEXT,

                    //SideEffectContent.PROPERTY_DRUG,

            };

    @Override
    public String[] getProperties() {
        return properties;
    }

    @Override
    public Object getSendableInstance(boolean reference) {
        return new SideEffectContent();
    }

    @Override
    public Object getValue(Object target, String attrName) {
        int pos = attrName.indexOf('.');
        String attribute = attrName;

        if (pos > 0) {
            attribute = attrName.substring(0, pos);
        }

        if (SideEffectContent.PROPERTY_ID.equalsIgnoreCase(attribute)) {
            return ((SideEffectContent) target).getId();
        }

        if (SideEffectContent.PROPERTY_TOPIC.equalsIgnoreCase(attribute)) {
            return ((SideEffectContent) target).getTopic();
        }

        if (SideEffectContent.PROPERTY_TEXT.equalsIgnoreCase(attribute)) {
            return ((SideEffectContent) target).getText();
        }

        if (SideEffectContent.PROPERTY_DRUG.equalsIgnoreCase(attribute)) {
            return ((SideEffectContent) target).getDrug();
        }

        return null;
    }

    @Override
    public boolean setValue(Object target, String attrName, Object value, String type) {

        if (SideEffectContent.PROPERTY_TEXT.equalsIgnoreCase(attrName)) {
            ((SideEffectContent) target).setText((String) value);
            return true;
        }
        if (SideEffectContent.PROPERTY_TOPIC.equalsIgnoreCase(attrName)) {
            ((SideEffectContent) target).setTopic((SideEffect) value);
            return true;
        }

        if (SideEffectContent.PROPERTY_ID.equalsIgnoreCase(attrName)) {
            ((SideEffectContent) target).setId(Integer.parseInt(value.toString()));
            return true;
        }

        if (SendableEntityCreatorNoIndex.REMOVE.equals(type) && value != null) {
            attrName = attrName + type;
        }

        if (SideEffectContent.PROPERTY_DRUG.equalsIgnoreCase(attrName)) {
            ((SideEffectContent) target).setDrug((Drug) value);
            return true;
        }


        return false;
    }

    public static IdMap createIdMap(String sessionID) {
        return CreatorCreator.createIdMap(sessionID);
    }

    //==========================================================================
    public void removeObject(Object entity) {
        ((SideEffectContent) entity).removeYou();
    }
}
