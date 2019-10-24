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

import com.doccuty.epill.drug.Drug;
import com.doccuty.epill.model.DrugFeature;

import de.uniks.networkparser.IdMap;

public class DrugFeatureCreator implements SendableEntityCreatorNoIndex
{
   private final String[] properties = new String[]
   {		   
      DrugFeature.PROPERTY_ID,
      DrugFeature.PROPERTY_DRUGFEATURE
      //DrugFeature.PROPERTY_DRUG,
      //DrugFeature.PROPERTY_USER
   };
   
   @Override
   public String[] getProperties()
   {
      return properties;
   }
   
   @Override
   public Object getSendableInstance(boolean reference)
   {
      return new DrugFeature();
   }
   
   @Override
   public Object getValue(Object target, String attrName)
   {
      int pos = attrName.indexOf('.');
      String attribute = attrName;
      
      if (pos > 0)
      {
         attribute = attrName.substring(0, pos);
      }

      if (DrugFeature.PROPERTY_ID.equalsIgnoreCase(attribute))
      {
         return ((DrugFeature) target).getId();
      }

      if (DrugFeature.PROPERTY_DRUGFEATURE.equalsIgnoreCase(attribute))
      {
         return ((DrugFeature) target).getDrugFeature();
      }

      if (DrugFeature.PROPERTY_DRUG.equalsIgnoreCase(attribute))
      {
         return ((DrugFeature) target).getDrug();
      }
      
      return null;
   }
   
   @Override
   public boolean setValue(Object target, String attrName, Object value, String type)
   {
      if (DrugFeature.PROPERTY_DRUGFEATURE.equalsIgnoreCase(attrName))
      {
         ((DrugFeature) target).setDrugFeature((String) value);
         return true;
      }

      if (DrugFeature.PROPERTY_ID.equalsIgnoreCase(attrName))
      {
         ((DrugFeature) target).setId(Integer.parseInt(value.toString()));
         return true;
      }

      if (SendableEntityCreatorNoIndex.REMOVE.equals(type) && value != null)
      {
         attrName = attrName + type;
      }

      if (DrugFeature.PROPERTY_DRUG.equalsIgnoreCase(attrName))
      {
         ((DrugFeature) target).withDrug((Drug) value);
         return true;
      }
      
      if ((DrugFeature.PROPERTY_DRUG + SendableEntityCreatorNoIndex.REMOVE).equalsIgnoreCase(attrName))
      {
         ((DrugFeature) target).withoutDrug((Drug) value);
         return true;
      }
      
      return false;
   }
   public static IdMap createIdMap(String sessionID)
   {
      return com.doccuty.epill.model.util.CreatorCreator.createIdMap(sessionID);
   }
   
   //==========================================================================
      public void removeObject(Object entity)
   {
      ((DrugFeature) entity).removeYou();
   }
}
