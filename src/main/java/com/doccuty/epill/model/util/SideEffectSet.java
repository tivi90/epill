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
import com.doccuty.epill.model.SideEffect;
import de.uniks.networkparser.list.NumberList;
import de.uniks.networkparser.list.ObjectSet;

import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;

public class SideEffectSet extends HashSet<SideEffect>
{
	protected Class<?> getTypClass() {
		return SideEffect.class;
	}

   public SideEffectSet()
   {
      // empty
   }

   public SideEffectSet(SideEffect... objects)
   {
      for (SideEffect obj : objects)
      {
         this.add(obj);
      }
   }

   public SideEffectSet(Collection<SideEffect> objects)
   {
      this.addAll(objects);
   }

   public static final SideEffectSet EMPTY_SET = new SideEffectSet();


   public String getEntryType()
   {
      return "com.doccuty.epill.model.SideEffect";
   }


   @SuppressWarnings("unchecked")
   public SideEffectSet with(Object value)
   {
      if (value == null)
      {
         return this;
      }
      else if (value instanceof Collection)
      {
         this.addAll((Collection<SideEffect>)value);
      }
      else if (value != null)
      {
         this.add((SideEffect) value);
      }
      
      return this;
   }
   
   public SideEffectSet without(SideEffect value)
   {
      this.remove(value);
      return this;
   }


   /**
    * Loop through the current set of SideEffect objects and collect a list of the id attribute values. 
    * 
    * @return List of int objects reachable via id attribute
    */
   public NumberList getId()
   {
      NumberList result = new NumberList();
      
      for (SideEffect obj : this)
      {
         result.add(obj.getId());
      }
      
      return result;
   }


   /**
    * Loop through the current set of SideEffect objects and collect those SideEffect objects where the id attribute matches the parameter value. 
    * 
    * @param value Search value
    * 
    * @return Subset of SideEffect objects that match the parameter
    */
   public SideEffectSet filterId(int value)
   {
      SideEffectSet result = new SideEffectSet();
      
      for (SideEffect obj : this)
      {
         if (value == obj.getId())
         {
            result.add(obj);
         }
      }
      
      return result;
   }


   /**
    * Loop through the current set of SideEffect objects and collect those SideEffect objects where the id attribute is between lower and upper. 
    * 
    * @param lower Lower bound 
    * @param upper Upper bound 
    * 
    * @return Subset of SideEffect objects that match the parameter
    */
   public SideEffectSet filterId(int lower, int upper)
   {
      SideEffectSet result = new SideEffectSet();
      
      for (SideEffect obj : this)
      {
         if (lower <= obj.getId() && obj.getId() <= upper)
         {
            result.add(obj);
         }
      }
      
      return result;
   }


   /**
    * Loop through the current set of SideEffect objects and assign value to the id attribute of each of it. 
    * 
    * @param value New attribute value
    * 
    * @return Current set of SideEffect objects now with new attribute values.
    */
   public SideEffectSet withId(int value)
   {
      for (SideEffect obj : this)
      {
         obj.setId(value);
      }
      
      return this;
   }


   /**
    * Loop through the current set of SideEffect objects and collect a list of the country attribute values. 
    * 
    * @return List of String objects reachable via country attribute
    */
   public ObjectSet getSideEffect()
   {
      ObjectSet result = new ObjectSet();
      
      for (SideEffect obj : this)
      {
         result.add(obj.getSideEffect());
      }
      
      return result;
   }


   /**
    * Loop through the current set of SideEffect objects and collect those SideEffect objects where the country attribute matches the parameter value. 
    * 
    * @param value Search value
    * 
    * @return Subset of SideEffect objects that match the parameter
    */
   public SideEffectSet filterSideEffect(String value)
   {
      SideEffectSet result = new SideEffectSet();
      
      for (SideEffect obj : this)
      {
         if (value.equals(obj.getSideEffect()))
         {
            result.add(obj);
         }
      }
      
      return result;
   }


   /**
    * Loop through the current set of SideEffect objects and collect those SideEffect objects where the country attribute is between lower and upper. 
    * 
    * @param lower Lower bound 
    * @param upper Upper bound 
    * 
    * @return Subset of SideEffect objects that match the parameter
    */
   public SideEffectSet filterSideEffect(String lower, String upper)
   {
      SideEffectSet result = new SideEffectSet();
      
      for (SideEffect obj : this)
      {
         if (lower.compareTo(obj.getSideEffect()) <= 0 && obj.getSideEffect().compareTo(upper) <= 0)
         {
            result.add(obj);
         }
      }
      
      return result;
   }


   /**
    * Loop through the current set of SideEffect objects and assign value to the country attribute of each of it. 
    * 
    * @param value New attribute value
    * 
    * @return Current set of SideEffect objects now with new attribute values.
    */
   public SideEffectSet withSideEffect(String value)
   {
      for (SideEffect obj : this)
      {
         obj.setSideEffect(value);
      }
      
      return this;
   }

   /**
    * Loop through the current set of SideEffect objects and collect a set of the Drug objects reached via user. 
    * 
    * @return Set of Drug objects reachable via user
    */
   public DrugSet getDrug()
   {
      DrugSet result = new DrugSet();
      
      for (SideEffect obj : this)
      {
         result.with(obj.getDrug());
      }
      
      return result;
   }

   /**
    * Loop through the current set of SideEffect objects and collect all contained objects with reference user pointing to the object passed as parameter. 
    * 
    * @param value The object required as user neighbor of the collected results. 
    * 
    * @return Set of Drug objects referring to value via user
    */
   public SideEffectSet filterDrug(Object value)
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
      
      SideEffectSet answer = new SideEffectSet();
      
      for (SideEffect obj : this)
      {
         if ( ! Collections.disjoint(neighbors, obj.getDrug()))
         {
            answer.add(obj);
         }
      }
      
      return answer;
   }

   /**
    * Loop through current set of ModelType objects and attach the SideEffect object passed as parameter to the Drug attribute of each of it. 
    * 
    * @return The original set of ModelType objects now with the new neighbor attached to their Drug attributes.
    */
   public SideEffectSet withDrug(Drug value)
   {
      for (SideEffect obj : this)
      {
         obj.withDrug(value);
      }
      
      return this;
   }

   /**
    * Loop through current set of ModelType objects and remove the SideEffect object passed as parameter from the Drug attribute of each of it. 
    * 
    * @return The original set of ModelType objects now without the old neighbor.
    */
   public SideEffectSet withoutDrug(Drug value)
   {
      for (SideEffect obj : this)
      {
         obj.withoutDrug(value);
      }
      
      return this;
   }

}
