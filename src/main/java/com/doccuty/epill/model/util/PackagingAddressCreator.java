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

import de.uniks.networkparser.interfaces.SendableEntityCreatorNoIndex;

import com.doccuty.epill.model.PackagingAddress;
import com.doccuty.epill.user.User;

import de.uniks.networkparser.IdMap;

public class PackagingAddressCreator implements SendableEntityCreatorNoIndex {
    private final String[] properties = new String[]
            {
                    PackagingAddress.PROPERTY_ID,
                    PackagingAddress.PROPERTY_TITLE,
                    PackagingAddress.PROPERTY_TEXT

                    //PackagingAddress.PROPERTY_USER,
            };

    @Override
    public String[] getProperties() {
        return properties;
    }

    @Override
    public Object getSendableInstance(boolean reference) {
        return new PackagingAddress();
    }

    @Override
    public Object getValue(Object target, String attrName) {
        int pos = attrName.indexOf('.');
        String attribute = attrName;

        if (pos > 0) {
            attribute = attrName.substring(0, pos);
        }

        if (PackagingAddress.PROPERTY_ID.equalsIgnoreCase(attribute)) {
            return ((PackagingAddress) target).getId();
        }

        if (PackagingAddress.PROPERTY_TITLE.equalsIgnoreCase(attribute)) {
            return ((PackagingAddress) target).getTitle();
        }

       if (PackagingAddress.PROPERTY_TEXT.equalsIgnoreCase(attribute)) {
          return ((PackagingAddress) target).getText();
       }



        return null;
    }

    @Override
    public boolean setValue(Object target, String attrName, Object value, String type) {
        if (PackagingAddress.PROPERTY_TITLE.equalsIgnoreCase(attrName)) {
            ((PackagingAddress) target).setTitle((String) value);
            return true;
        }
       if (PackagingAddress.PROPERTY_TEXT.equalsIgnoreCase(attrName)) {
          ((PackagingAddress) target).setText((String) value);
          return true;
       }
        if (PackagingAddress.PROPERTY_ID.equalsIgnoreCase(attrName)) {
            ((PackagingAddress) target).setId(Integer.parseInt(value.toString()));
            return true;
        }

        if (SendableEntityCreatorNoIndex.REMOVE.equals(type) && value != null) {
            attrName = attrName + type;
        }

            return false;
    }

    public static IdMap createIdMap(String sessionID) {
        return com.doccuty.epill.model.util.CreatorCreator.createIdMap(sessionID);
    }


}
