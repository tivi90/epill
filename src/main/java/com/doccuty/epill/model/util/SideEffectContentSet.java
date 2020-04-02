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
import de.uniks.networkparser.list.NumberList;
import de.uniks.networkparser.list.ObjectSet;

import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;

public class SideEffectContentSet extends HashSet<SideEffectContent>
{
	protected Class<?> getTypClass() {
		return SideEffectContent.class;
	}

   public SideEffectContentSet()
   {
      // empty
   }

   public SideEffectContentSet(SideEffectContent... objects)
   {
      for (SideEffectContent obj : objects)
      {
         this.add(obj);
      }
   }

   public SideEffectContentSet(Collection<SideEffectContent> objects)
   {
      this.addAll(objects);
   }

   public static final SideEffectContentSet EMPTY_SET = new SideEffectContentSet();


   public String getEntryType()
   {
      return "com.doccuty.epill.model.SideEffectContent";
   }


   @SuppressWarnings("unchecked")
   public SideEffectContentSet with(Object value)
   {
      if (value == null)
      {
         return this;
      }
      else if (value instanceof Collection)
      {
         this.addAll((Collection<SideEffectContent>)value);
      }
      else if (value != null)
      {
         this.add((SideEffectContent) value);
      }
      
      return this;
   }
   
   public SideEffectContentSet without(SideEffectContent value)
   {
      this.remove(value);
      return this;
   }


   /**
    * Loop through the current set of SideEffectContent objects and collect a list of the id attribute values. 
    * 
    * @return List of int objects reachable via id attribute
    */
   public NumberList getId()
   {
      NumberList result = new NumberList();
      
      for (SideEffectContent obj : this)
      {
         result.add(obj.getId());
      }
      
      return result;
   }


   /**
    * Loop through the current set of SideEffectContent objects and collect those SideEffectContent objects where the id attribute matches the parameter value. 
    * 
    * @param value Search value
    * 
    * @return Subset of SideEffectContent objects that match the parameter
    */
   public SideEffectContentSet filterId(int value)
   {
      SideEffectContentSet result = new SideEffectContentSet();
      
      for (SideEffectContent obj : this)
      {
         if (value == obj.getId())
         {
            result.add(obj);
         }
      }
      
      return result;
   }


   /**
    * Loop through the current set of SideEffectContent objects and collect those SideEffectContent objects where the id attribute is between lower and upper. 
    * 
    * @param lower Lower bound 
    * @param upper Upper bound 
    * 
    * @return Subset of SideEffectContent objects that match the parameter
    */
   public SideEffectContentSet filterId(int lower, int upper)
   {
      SideEffectContentSet result = new SideEffectContentSet();
      
      for (SideEffectContent obj : this)
      {
         if (lower <= obj.getId() && obj.getId() <= upper)
         {
            result.add(obj);
         }
      }
      
      return result;
   }


   /**
    * Loop through the current set of SideEffectContent objects and assign value to the id attribute of each of it. 
    * 
    * @param value New attribute value
    * 
    * @return Current set of SideEffectContent objects now with new attribute values.
    */
   public SideEffectContentSet withId(int value)
   {
      for (SideEffectContent obj : this)
      {
         obj.setId(value);
      }
      
      return this;
   }


   /**
    * Loop through the current set of SideEffectContent objects and collect a list of the topic attribute values. 
    * 
    * @return List of com.doccuty.epill.model.PackagingTopic objects reachable via topic attribute
    */
   public SideEffectSet getTopic()
   {
      SideEffectSet result = new SideEffectSet();
      
      for (SideEffectContent obj : this)
      {
         result.add(obj.getTopic());
      }
      
      return result;
   }


   /**
    * Loop through the current set of SideEffectContent objects and collect those SideEffectContent objects where the topic attribute matches the parameter value. 
    * 
    * @param value Search value
    * 
    * @return Subset of SideEffectContent objects that match the parameter
    */
   public SideEffectContentSet filterTopic(SideEffect value)
   {
      SideEffectContentSet result = new SideEffectContentSet();
      
      for (SideEffectContent obj : this)
      {
         if (value == obj.getTopic())
         {
            result.add(obj);
         }
      }
      
      return result;
   }


   /**
    * Loop through the current set of SideEffectContent objects and assign value to the topic attribute of each of it. 
    * 
    * @param value New attribute value
    * 
    * @return Current set of SideEffectContent objects now with new attribute values.
    */
   public SideEffectContentSet withTopic(SideEffect value)
   {
      for (SideEffectContent obj : this)
      {
         obj.setTopic(value);
      }
      
      return this;
   }


   /**
    * Loop through the current set of SideEffectContent objects and collect a list of the text attribute values. 
    * 
    * @return List of String objects reachable via text attribute
    */
   public ObjectSet getText()
   {
      ObjectSet result = new ObjectSet();
      
      for (SideEffectContent obj : this)
      {
         result.add(obj.getText());
      }
      
      return result;
   }


   /**
    * Loop through the current set of SideEffectContent objects and collect those SideEffectContent objects where the text attribute matches the parameter value. 
    * 
    * @param value Search value
    * 
    * @return Subset of SideEffectContent objects that match the parameter
    */
   public SideEffectContentSet filterText(String value)
   {
      SideEffectContentSet result = new SideEffectContentSet();
      
      for (SideEffectContent obj : this)
      {
         if (value.equals(obj.getText()))
         {
            result.add(obj);
         }
      }
      
      return result;
   }


   /**
    * Loop through the current set of SideEffectContent objects and collect those SideEffectContent objects where the text attribute is between lower and upper. 
    * 
    * @param lower Lower bound 
    * @param upper Upper bound 
    * 
    * @return Subset of SideEffectContent objects that match the parameter
    */
   public SideEffectContentSet filterText(String lower, String upper)
   {
      SideEffectContentSet result = new SideEffectContentSet();
      
      for (SideEffectContent obj : this)
      {
         if (lower.compareTo(obj.getText()) <= 0 && obj.getText().compareTo(upper) <= 0)
         {
            result.add(obj);
         }
      }
      
      return result;
   }


   /**
    * Loop through the current set of SideEffectContent objects and assign value to the text attribute of each of it. 
    * 
    * @param value New attribute value
    * 
    * @return Current set of SideEffectContent objects now with new attribute values.
    */
   public SideEffectContentSet withText(String value)
   {
      for (SideEffectContent obj : this)
      {
         obj.setText(value);
      }
      
      return this;
   }


   /**
    * Loop through the current set of SideEffectContent objects and collect a set of the Drug objects reached via drug. 
    * 
    * @return Set of Drug objects reachable via drug
    */
   public DrugSet getDrug()
   {
      DrugSet result = new DrugSet();
      
      for (SideEffectContent obj : this)
      {
         result.with(obj.getDrug());
      }
      
      return result;
   }

   /**
    * Loop through the current set of SideEffectContent objects and collect all contained objects with reference drug pointing to the object passed as parameter. 
    * 
    * @param value The object required as drug neighbor of the collected results. 
    * 
    * @return Set of Drug objects referring to value via drug
    */
   public SideEffectContentSet filterDrug(Object value)
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
      
      SideEffectContentSet answer = new SideEffectContentSet();
      
      for (SideEffectContent obj : this)
      {
         if (neighbors.contains(obj.getDrug()) || (neighbors.isEmpty() && obj.getDrug() == null))
         {
            answer.add(obj);
         }
      }
      
      return answer;
   }

   /**
    * Loop through current set of ModelType objects and attach the SideEffectContent object passed as parameter to the Drug attribute of each of it. 
    * 
    * @return The original set of ModelType objects now with the new neighbor attached to their Drug attributes.
    */
   public SideEffectContentSet withDrug(Drug value)
   {
      for (SideEffectContent obj : this)
      {
         obj.withDrug(value);
      }
      
      return this;
   }



}
