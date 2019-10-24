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

import java.util.HashSet;

import com.doccuty.epill.disease.Disease;
import com.doccuty.epill.drug.Drug;

import java.util.Collection;
import de.uniks.networkparser.list.NumberList;
import de.uniks.networkparser.list.ObjectSet;
import java.util.Collections;
import com.doccuty.epill.model.util.DrugSet;
import com.doccuty.epill.model.util.UserSet;
import com.doccuty.epill.user.User;

public class DiseaseSet extends HashSet<Disease>
{
	protected Class<?> getTypClass() {
		return Disease.class;
	}

   public DiseaseSet()
   {
      // empty
   }

   public DiseaseSet(Disease... objects)
   {
      for (Disease obj : objects)
      {
         this.add(obj);
      }
   }

   public DiseaseSet(Collection<Disease> objects)
   {
      this.addAll(objects);
   }

   public static final DiseaseSet EMPTY_SET = new DiseaseSet();


   public String getEntryType()
   {
      return "com.doccuty.epill.model.Disease";
   }


   @SuppressWarnings("unchecked")
   public DiseaseSet with(Object value)
   {
      if (value == null)
      {
         return this;
      }
      else if (value instanceof java.util.Collection)
      {
         this.addAll((Collection<Disease>)value);
      }
      else if (value != null)
      {
         this.add((Disease) value);
      }
      
      return this;
   }
   
   public DiseaseSet without(Disease value)
   {
      this.remove(value);
      return this;
   }


   /**
    * Loop through the current set of Disease objects and collect a list of the id attribute values. 
    * 
    * @return List of int objects reachable via id attribute
    */
   public NumberList getId()
   {
      NumberList result = new NumberList();
      
      for (Disease obj : this)
      {
         result.add(obj.getId());
      }
      
      return result;
   }


   /**
    * Loop through the current set of Disease objects and collect those Disease objects where the id attribute matches the parameter value. 
    * 
    * @param value Search value
    * 
    * @return Subset of Disease objects that match the parameter
    */
   public DiseaseSet filterId(int value)
   {
      DiseaseSet result = new DiseaseSet();
      
      for (Disease obj : this)
      {
         if (value == obj.getId())
         {
            result.add(obj);
         }
      }
      
      return result;
   }


   /**
    * Loop through the current set of Disease objects and collect those Disease objects where the id attribute is between lower and upper. 
    * 
    * @param lower Lower bound 
    * @param upper Upper bound 
    * 
    * @return Subset of Disease objects that match the parameter
    */
   public DiseaseSet filterId(int lower, int upper)
   {
      DiseaseSet result = new DiseaseSet();
      
      for (Disease obj : this)
      {
         if (lower <= obj.getId() && obj.getId() <= upper)
         {
            result.add(obj);
         }
      }
      
      return result;
   }


   /**
    * Loop through the current set of Disease objects and assign value to the id attribute of each of it. 
    * 
    * @param value New attribute value
    * 
    * @return Current set of Disease objects now with new attribute values.
    */
   public DiseaseSet withId(int value)
   {
      for (Disease obj : this)
      {
         obj.setId(value);
      }
      
      return this;
   }


   /**
    * Loop through the current set of Disease objects and collect a list of the name attribute values. 
    * 
    * @return List of String objects reachable via name attribute
    */
   public ObjectSet getName()
   {
      ObjectSet result = new ObjectSet();
      
      for (Disease obj : this)
      {
         result.add(obj.getName());
      }
      
      return result;
   }


   /**
    * Loop through the current set of Disease objects and collect those Disease objects where the name attribute matches the parameter value. 
    * 
    * @param value Search value
    * 
    * @return Subset of Disease objects that match the parameter
    */
   public DiseaseSet filterName(String value)
   {
      DiseaseSet result = new DiseaseSet();
      
      for (Disease obj : this)
      {
         if (value.equals(obj.getName()))
         {
            result.add(obj);
         }
      }
      
      return result;
   }


   /**
    * Loop through the current set of Disease objects and collect those Disease objects where the name attribute is between lower and upper. 
    * 
    * @param lower Lower bound 
    * @param upper Upper bound 
    * 
    * @return Subset of Disease objects that match the parameter
    */
   public DiseaseSet filterName(String lower, String upper)
   {
      DiseaseSet result = new DiseaseSet();
      
      for (Disease obj : this)
      {
         if (lower.compareTo(obj.getName()) <= 0 && obj.getName().compareTo(upper) <= 0)
         {
            result.add(obj);
         }
      }
      
      return result;
   }


   /**
    * Loop through the current set of Disease objects and assign value to the name attribute of each of it. 
    * 
    * @param value New attribute value
    * 
    * @return Current set of Disease objects now with new attribute values.
    */
   public DiseaseSet withName(String value)
   {
      for (Disease obj : this)
      {
         obj.setName(value);
      }
      
      return this;
   }

   /**
    * Loop through the current set of Disease objects and collect a set of the Drug objects reached via drug. 
    * 
    * @return Set of Drug objects reachable via drug
    */
   public DrugSet getDrug()
   {
      DrugSet result = new DrugSet();
      
      for (Disease obj : this)
      {
         result.with(obj.getDrug());
      }
      
      return result;
   }

   /**
    * Loop through the current set of Disease objects and collect all contained objects with reference drug pointing to the object passed as parameter. 
    * 
    * @param value The object required as drug neighbor of the collected results. 
    * 
    * @return Set of Drug objects referring to value via drug
    */
   public DiseaseSet filterDrug(Object value)
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
      
      DiseaseSet answer = new DiseaseSet();
      
      for (Disease obj : this)
      {
         if ( ! Collections.disjoint(neighbors, obj.getDrug()))
         {
            answer.add(obj);
         }
      }
      
      return answer;
   }

   /**
    * Loop through current set of ModelType objects and attach the Disease object passed as parameter to the Drug attribute of each of it. 
    * 
    * @return The original set of ModelType objects now with the new neighbor attached to their Drug attributes.
    */
   public DiseaseSet withDrug(Drug value)
   {
      for (Disease obj : this)
      {
         obj.withDrug(value);
      }
      
      return this;
   }

   /**
    * Loop through current set of ModelType objects and remove the Disease object passed as parameter from the Drug attribute of each of it. 
    * 
    * @return The original set of ModelType objects now without the old neighbor.
    */
   public DiseaseSet withoutDrug(Drug value)
   {
      for (Disease obj : this)
      {
         obj.withoutDrug(value);
      }
      
      return this;
   }

   /**
    * Loop through the current set of Disease objects and collect a set of the User objects reached via user. 
    * 
    * @return Set of User objects reachable via user
    */
   public UserSet getUser()
   {
      UserSet result = new UserSet();
      
      for (Disease obj : this)
      {
         result.with(obj.getUser());
      }
      
      return result;
   }

   /**
    * Loop through the current set of Disease objects and collect all contained objects with reference user pointing to the object passed as parameter. 
    * 
    * @param value The object required as user neighbor of the collected results. 
    * 
    * @return Set of User objects referring to value via user
    */
   public DiseaseSet filterUser(Object value)
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
      
      DiseaseSet answer = new DiseaseSet();
      
      for (Disease obj : this)
      {
         if ( ! Collections.disjoint(neighbors, obj.getUser()))
         {
            answer.add(obj);
         }
      }
      
      return answer;
   }

   /**
    * Loop through current set of ModelType objects and attach the Disease object passed as parameter to the User attribute of each of it. 
    * 
    * @return The original set of ModelType objects now with the new neighbor attached to their User attributes.
    */
   public DiseaseSet withUser(User value)
   {
      for (Disease obj : this)
      {
         obj.withUser(value);
      }
      
      return this;
   }

   /**
    * Loop through current set of ModelType objects and remove the Disease object passed as parameter from the User attribute of each of it. 
    * 
    * @return The original set of ModelType objects now without the old neighbor.
    */
   public DiseaseSet withoutUser(User value)
   {
      for (Disease obj : this)
      {
         obj.withoutUser(value);
      }
      
      return this;
   }

}
