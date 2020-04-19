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
import com.doccuty.epill.adverseeffectcontent.AdverseEffectContent;
import de.uniks.networkparser.list.NumberList;
import de.uniks.networkparser.list.ObjectSet;

import java.util.Collection;
import java.util.HashSet;

public class AdverseEffectContentSet extends HashSet<AdverseEffectContent>
{
	protected Class<?> getTypClass() {
		return AdverseEffectContent.class;
	}

   public AdverseEffectContentSet()
   {
      // empty
   }

   public AdverseEffectContentSet(AdverseEffectContent... objects)
   {
      for (AdverseEffectContent obj : objects)
      {
         this.add(obj);
      }
   }

   public AdverseEffectContentSet(Collection<AdverseEffectContent> objects)
   {
      this.addAll(objects);
   }

   public static final AdverseEffectContentSet EMPTY_SET = new AdverseEffectContentSet();


   public String getEntryType()
   {
      return "com.doccuty.epill.model.AdverseEffectContent";
   }


   @SuppressWarnings("unchecked")
   public AdverseEffectContentSet with(Object value)
   {
      if (value == null)
      {
         return this;
      }
      else if (value instanceof Collection)
      {
         this.addAll((Collection<AdverseEffectContent>)value);
      }
      else if (value != null)
      {
         this.add((AdverseEffectContent) value);
      }
      
      return this;
   }
   
   public AdverseEffectContentSet without(AdverseEffectContent value)
   {
      this.remove(value);
      return this;
   }


   /**
    * Loop through the current set of AdverseEffectContent objects and collect a list of the id attribute values. 
    * 
    * @return List of int objects reachable via id attribute
    */
   public NumberList getId()
   {
      NumberList result = new NumberList();
      
      for (AdverseEffectContent obj : this)
      {
         result.add(obj.getId());
      }
      
      return result;
   }


   /**
    * Loop through the current set of AdverseEffectContent objects and collect those AdverseEffectContent objects where the id attribute matches the parameter value. 
    * 
    * @param value Search value
    * 
    * @return Subset of AdverseEffectContent objects that match the parameter
    */
   public AdverseEffectContentSet filterId(int value)
   {
      AdverseEffectContentSet result = new AdverseEffectContentSet();
      
      for (AdverseEffectContent obj : this)
      {
         if (value == obj.getId())
         {
            result.add(obj);
         }
      }
      
      return result;
   }


   /**
    * Loop through the current set of AdverseEffectContent objects and collect those AdverseEffectContent objects where the id attribute is between lower and upper. 
    * 
    * @param lower Lower bound 
    * @param upper Upper bound 
    * 
    * @return Subset of AdverseEffectContent objects that match the parameter
    */
   public AdverseEffectContentSet filterId(int lower, int upper)
   {
      AdverseEffectContentSet result = new AdverseEffectContentSet();
      
      for (AdverseEffectContent obj : this)
      {
         if (lower <= obj.getId() && obj.getId() <= upper)
         {
            result.add(obj);
         }
      }
      
      return result;
   }


   /**
    * Loop through the current set of AdverseEffectContent objects and assign value to the id attribute of each of it. 
    * 
    * @param value New attribute value
    * 
    * @return Current set of AdverseEffectContent objects now with new attribute values.
    */
   public AdverseEffectContentSet withId(int value)
   {
      for (AdverseEffectContent obj : this)
      {
         obj.setId(value);
      }
      
      return this;
   }


   /**
    * Loop through the current set of AdverseEffectContent objects and collect a list of the topic attribute values. 
    * 
    * @return List of com.doccuty.epill.model.PackagingTopic objects reachable via topic attribute
    */
   public AdverseEffectSet getTopic()
   {
      AdverseEffectSet result = new AdverseEffectSet();
      
      for (AdverseEffectContent obj : this)
      {
         result.add(obj.getTopic());
      }
      
      return result;
   }


   /**
    * Loop through the current set of AdverseEffectContent objects and collect those AdverseEffectContent objects where the topic attribute matches the parameter value. 
    * 
    * @param value Search value
    * 
    * @return Subset of AdverseEffectContent objects that match the parameter
    */
   public AdverseEffectContentSet filterTopic(AdverseEffect value)
   {
      AdverseEffectContentSet result = new AdverseEffectContentSet();
      
      for (AdverseEffectContent obj : this)
      {
         if (value == obj.getTopic())
         {
            result.add(obj);
         }
      }
      
      return result;
   }


   /**
    * Loop through the current set of AdverseEffectContent objects and assign value to the topic attribute of each of it. 
    * 
    * @param value New attribute value
    * 
    * @return Current set of AdverseEffectContent objects now with new attribute values.
    */
   public AdverseEffectContentSet withTopic(AdverseEffect value)
   {
      for (AdverseEffectContent obj : this)
      {
         obj.setTopic(value);
      }
      
      return this;
   }


   /**
    * Loop through the current set of AdverseEffectContent objects and collect a list of the text attribute values. 
    * 
    * @return List of String objects reachable via text attribute
    */
   public ObjectSet getText()
   {
      ObjectSet result = new ObjectSet();
      
      for (AdverseEffectContent obj : this)
      {
         result.add(obj.getText());
      }
      
      return result;
   }



   /**
    * Loop through the current set of AdverseEffectContent objects and collect those AdverseEffectContent objects where the text attribute matches the parameter value. 
    * 
    * @param value Search value
    * 
    * @return Subset of AdverseEffectContent objects that match the parameter
    */
   public AdverseEffectContentSet filterText(String value)
   {
      AdverseEffectContentSet result = new AdverseEffectContentSet();
      
      for (AdverseEffectContent obj : this)
      {
         if (value.equals(obj.getText()))
         {
            result.add(obj);
         }
      }
      
      return result;
   }


   /**
    * Loop through the current set of AdverseEffectContent objects and collect those AdverseEffectContent objects where the text attribute is between lower and upper. 
    * 
    * @param lower Lower bound 
    * @param upper Upper bound 
    * 
    * @return Subset of AdverseEffectContent objects that match the parameter
    */
   public AdverseEffectContentSet filterText(String lower, String upper)
   {
      AdverseEffectContentSet result = new AdverseEffectContentSet();
      
      for (AdverseEffectContent obj : this)
      {
         if (lower.compareTo(obj.getText()) <= 0 && obj.getText().compareTo(upper) <= 0)
         {
            result.add(obj);
         }
      }
      
      return result;
   }


   /**
    * Loop through the current set of AdverseEffectContent objects and assign value to the text attribute of each of it. 
    * 
    * @param value New attribute value
    * 
    * @return Current set of AdverseEffectContent objects now with new attribute values.
    */
   public AdverseEffectContentSet withText(String value)
   {
      for (AdverseEffectContent obj : this)
      {
         obj.setText(value);
      }
      
      return this;
   }
   /**
    * Loop through the current set of AdverseEffectContent objects and collect a list of the Purpose attribute values.
    *
    * @return List of String objects reachable via Purpose attribute
    */
   public ObjectSet getPurpose()
   {
      ObjectSet result = new ObjectSet();

      for (AdverseEffectContent obj : this)
      {
         result.add(obj.getPurpose());
      }

      return result;
   }



   /**
    * Loop through the current set of AdverseEffectContent objects and collect those AdverseEffectContent objects where the Purpose attribute matches the parameter value.
    *
    * @param value Search value
    *
    * @return Subset of AdverseEffectContent objects that match the parameter
    */
   public AdverseEffectContentSet filterPurpose(String value)
   {
      AdverseEffectContentSet result = new AdverseEffectContentSet();

      for (AdverseEffectContent obj : this)
      {
         if (value.equals(obj.getPurpose()))
         {
            result.add(obj);
         }
      }

      return result;
   }


   /**
    * Loop through the current set of AdverseEffectContent objects and collect those AdverseEffectContent objects where the Purpose attribute is between lower and upper.
    *
    * @param lower Lower bound
    * @param upper Upper bound
    *
    * @return Subset of AdverseEffectContent objects that match the parameter
    */
   public AdverseEffectContentSet filterPurpose(String lower, String upper)
   {
      AdverseEffectContentSet result = new AdverseEffectContentSet();

      for (AdverseEffectContent obj : this)
      {
         if (lower.compareTo(obj.getPurpose()) <= 0 && obj.getPurpose().compareTo(upper) <= 0)
         {
            result.add(obj);
         }
      }

      return result;
   }


   /**
    * Loop through the current set of AdverseEffectContent objects and assign value to the Purpose attribute of each of it.
    *
    * @param value New attribute value
    *
    * @return Current set of AdverseEffectContent objects now with new attribute values.
    */
   public AdverseEffectContentSet withPurpose(String value)
   {
      for (AdverseEffectContent obj : this)
      {
         obj.setPurpose(value);
      }

      return this;
   }

   /**
    * Loop through the current set of AdverseEffectContent objects and collect a set of the Drug objects reached via drug. 
    * 
    * @return Set of Drug objects reachable via drug
    */
   public DrugSet getDrug()
   {
      DrugSet result = new DrugSet();
      
      for (AdverseEffectContent obj : this)
      {
         result.with(obj.getDrug());
      }
      
      return result;
   }

   /**
    * Loop through the current set of AdverseEffectContent objects and collect all contained objects with reference drug pointing to the object passed as parameter. 
    * 
    * @param value The object required as drug neighbor of the collected results. 
    * 
    * @return Set of Drug objects referring to value via drug
    */
   public AdverseEffectContentSet filterDrug(Object value)
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
      
      AdverseEffectContentSet answer = new AdverseEffectContentSet();
      
      for (AdverseEffectContent obj : this)
      {
         if (neighbors.contains(obj.getDrug()) || (neighbors.isEmpty() && obj.getDrug() == null))
         {
            answer.add(obj);
         }
      }
      
      return answer;
   }

   /**
    * Loop through current set of ModelType objects and attach the AdverseEffectContent object passed as parameter to the Drug attribute of each of it. 
    * 
    * @return The original set of ModelType objects now with the new neighbor attached to their Drug attributes.
    */
   public AdverseEffectContentSet withDrug(Drug value)
   {
      for (AdverseEffectContent obj : this)
      {
         obj.withDrug(value);
      }
      
      return this;
   }



}
