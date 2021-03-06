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
import de.uniks.networkparser.list.NumberList;
import de.uniks.networkparser.list.ObjectSet;

import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;

public class AdverseEffectSet extends HashSet<AdverseEffect>
{
	protected Class<?> getTypClass() {
		return AdverseEffect.class;
	}

   public AdverseEffectSet()
   {
      // empty
   }

   public AdverseEffectSet(AdverseEffect... objects)
   {
      for (AdverseEffect obj : objects)
      {
         this.add(obj);
      }
   }

   public AdverseEffectSet(Collection<AdverseEffect> objects)
   {
      this.addAll(objects);
   }

   public static final AdverseEffectSet EMPTY_SET = new AdverseEffectSet();


   public String getEntryType()
   {
      return "com.doccuty.epill.model.AdverseEffect";
   }


   @SuppressWarnings("unchecked")
   public AdverseEffectSet with(Object value)
   {
      if (value == null)
      {
         return this;
      }
      else if (value instanceof Collection)
      {
         this.addAll((Collection<AdverseEffect>)value);
      }
      else if (value != null)
      {
         this.add((AdverseEffect) value);
      }
      
      return this;
   }
   
   public AdverseEffectSet without(AdverseEffect value)
   {
      this.remove(value);
      return this;
   }


   /**
    * Loop through the current set of AdverseEffect objects and collect a list of the id attribute values. 
    * 
    * @return List of int objects reachable via id attribute
    */
   public NumberList getId()
   {
      NumberList result = new NumberList();
      
      for (AdverseEffect obj : this)
      {
         result.add(obj.getId());
      }
      
      return result;
   }


   /**
    * Loop through the current set of AdverseEffect objects and collect those AdverseEffect objects where the id attribute matches the parameter value. 
    * 
    * @param value Search value
    * 
    * @return Subset of AdverseEffect objects that match the parameter
    */
   public AdverseEffectSet filterId(int value)
   {
      AdverseEffectSet result = new AdverseEffectSet();
      
      for (AdverseEffect obj : this)
      {
         if (value == obj.getId())
         {
            result.add(obj);
         }
      }
      
      return result;
   }


   /**
    * Loop through the current set of AdverseEffect objects and collect those AdverseEffect objects where the id attribute is between lower and upper. 
    * 
    * @param lower Lower bound 
    * @param upper Upper bound 
    * 
    * @return Subset of AdverseEffect objects that match the parameter
    */
   public AdverseEffectSet filterId(int lower, int upper)
   {
      AdverseEffectSet result = new AdverseEffectSet();
      
      for (AdverseEffect obj : this)
      {
         if (lower <= obj.getId() && obj.getId() <= upper)
         {
            result.add(obj);
         }
      }
      
      return result;
   }


   /**
    * Loop through the current set of AdverseEffect objects and assign value to the id attribute of each of it. 
    * 
    * @param value New attribute value
    * 
    * @return Current set of AdverseEffect objects now with new attribute values.
    */
   public AdverseEffectSet withId(int value)
   {
      for (AdverseEffect obj : this)
      {
         obj.setId(value);
      }
      
      return this;
   }


   /**
    * Loop through the current set of AdverseEffect objects and collect a list of the country attribute values. 
    * 
    * @return List of String objects reachable via country attribute
    */
   public ObjectSet getAdverseEffect()
   {
      ObjectSet result = new ObjectSet();
      
      for (AdverseEffect obj : this)
      {
         result.add(obj.getAdverseEffect());
      }
      
      return result;
   }


   /**
    * Loop through the current set of AdverseEffect objects and collect those AdverseEffect objects where the country attribute matches the parameter value. 
    * 
    * @param value Search value
    * 
    * @return Subset of AdverseEffect objects that match the parameter
    */
   public AdverseEffectSet filterAdverseEffect(String value)
   {
      AdverseEffectSet result = new AdverseEffectSet();
      
      for (AdverseEffect obj : this)
      {
         if (value.equals(obj.getAdverseEffect()))
         {
            result.add(obj);
         }
      }
      
      return result;
   }


   /**
    * Loop through the current set of AdverseEffect objects and collect those AdverseEffect objects where the country attribute is between lower and upper. 
    * 
    * @param lower Lower bound 
    * @param upper Upper bound 
    * 
    * @return Subset of AdverseEffect objects that match the parameter
    */
   public AdverseEffectSet filterAdverseEffect(String lower, String upper)
   {
      AdverseEffectSet result = new AdverseEffectSet();
      
      for (AdverseEffect obj : this)
      {
         if (lower.compareTo(obj.getAdverseEffect()) <= 0 && obj.getAdverseEffect().compareTo(upper) <= 0)
         {
            result.add(obj);
         }
      }
      
      return result;
   }


   /**
    * Loop through the current set of AdverseEffect objects and assign value to the country attribute of each of it. 
    * 
    * @param value New attribute value
    * 
    * @return Current set of AdverseEffect objects now with new attribute values.
    */
   public AdverseEffectSet withAdverseEffect(String value)
   {
      for (AdverseEffect obj : this)
      {
         obj.setAdverseEffect(value);
      }
      
      return this;
   }

   /**
    * Loop through the current set of AdverseEffect objects and collect a set of the Drug objects reached via user. 
    * 
    * @return Set of Drug objects reachable via user
    */
   public DrugSet getDrug()
   {
      DrugSet result = new DrugSet();
      
      for (AdverseEffect obj : this)
      {
         result.with(obj.getDrug());
      }
      
      return result;
   }

   /**
    * Loop through the current set of AdverseEffect objects and collect all contained objects with reference user pointing to the object passed as parameter. 
    * 
    * @param value The object required as user neighbor of the collected results. 
    * 
    * @return Set of Drug objects referring to value via user
    */
   public AdverseEffectSet filterDrug(Object value)
   {
      ObjectSet neighbors = new ObjectSet();

      if (value instanceof Collection)
      {
         neighbors.addAll((Collection<?>) value);
      }
      else
      {
         neighbors.add(value);
      }
      
      AdverseEffectSet answer = new AdverseEffectSet();
      
      for (AdverseEffect obj : this)
      {
         if ( ! Collections.disjoint(neighbors, obj.getDrug()))
         {
            answer.add(obj);
         }
      }
      
      return answer;
   }

   /**
    * Loop through current set of ModelType objects and attach the AdverseEffect object passed as parameter to the Drug attribute of each of it. 
    * 
    * @return The original set of ModelType objects now with the new neighbor attached to their Drug attributes.
    */
   public AdverseEffectSet withDrug(Drug value)
   {
      for (AdverseEffect obj : this)
      {
         obj.withDrug(value);
      }
      
      return this;
   }

   /**
    * Loop through current set of ModelType objects and remove the AdverseEffect object passed as parameter from the Drug attribute of each of it. 
    * 
    * @return The original set of ModelType objects now without the old neighbor.
    */
   public AdverseEffectSet withoutDrug(Drug value)
   {
      for (AdverseEffect obj : this)
      {
         obj.withoutDrug(value);
      }
      
      return this;
   }

}
