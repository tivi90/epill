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
import com.doccuty.epill.model.AdverseEffect;
import de.uniks.networkparser.IdMap;
import de.uniks.networkparser.interfaces.SendableEntityCreatorNoIndex;

public class AdverseEffectCreator implements SendableEntityCreatorNoIndex
{
   private final String[] properties = new String[]
   {
      AdverseEffect.PROPERTY_ID,
      AdverseEffect.PROPERTY_ADVERSEFFECT,
           AdverseEffect.PROPERTY_DESCRIPTIONDRUG

           //AdverseEffect.PROPERTY_DRUG,
      //AdverseEffect.PROPERTY_USER
   };

   @Override
   public String[] getProperties()
   {
      return properties;
   }

   @Override
   public Object getSendableInstance(boolean reference)
   {
      return new AdverseEffect();
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

      if (AdverseEffect.PROPERTY_ID.equalsIgnoreCase(attribute))
      {
         return ((AdverseEffect) target).getId();
      }

      if (AdverseEffect.PROPERTY_ADVERSEFFECT.equalsIgnoreCase(attribute))
      {
         return ((AdverseEffect) target).getAdverseEffect();
      }
      if (AdverseEffect.PROPERTY_DESCRIPTIONDRUG.equalsIgnoreCase(attribute))
      {
         return ((AdverseEffect) target).getDescriptionDrug();
      }

      if (AdverseEffect.PROPERTY_DRUG.equalsIgnoreCase(attribute))
      {
         return ((AdverseEffect) target).getDrug();
      }

      return null;
   }

   @Override
   public boolean setValue(Object target, String attrName, Object value, String type)
   {
      if (AdverseEffect.PROPERTY_ADVERSEFFECT.equalsIgnoreCase(attrName))
      {
         ((AdverseEffect) target).setAdverseEffect((String) value);
         return true;
      }

      if (AdverseEffect.PROPERTY_DESCRIPTIONDRUG.equalsIgnoreCase(attrName))
      {
         ((AdverseEffect) target).setDescriptionDrug((String) value);
         return true;
      }

      if (AdverseEffect.PROPERTY_ID.equalsIgnoreCase(attrName))
      {
         ((AdverseEffect) target).setId(Integer.parseInt(value.toString()));
         return true;
      }

      if (SendableEntityCreatorNoIndex.REMOVE.equals(type) && value != null)
      {
         attrName = attrName + type;
      }

      if (AdverseEffect.PROPERTY_DRUG.equalsIgnoreCase(attrName))
      {
         ((AdverseEffect) target).withDrug((Drug) value);
         return true;
      }

      if ((AdverseEffect.PROPERTY_DRUG + SendableEntityCreatorNoIndex.REMOVE).equalsIgnoreCase(attrName))
      {
         ((AdverseEffect) target).withoutDrug((Drug) value);
         return true;
      }

      return false;
   }
   public static IdMap createIdMap(String sessionID)
   {
      return CreatorCreator.createIdMap(sessionID);
   }
   
   //==========================================================================
      public void removeObject(Object entity)
   {
      ((AdverseEffect) entity).removeYou();
   }
}
