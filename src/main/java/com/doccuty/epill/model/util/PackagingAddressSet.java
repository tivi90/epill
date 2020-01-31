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
import com.doccuty.epill.model.PackagingAddress;
import java.util.Collection;
import de.uniks.networkparser.list.NumberList;
import de.uniks.networkparser.list.ObjectSet;
import java.util.Collections;
import com.doccuty.epill.model.util.UserSet;
import com.doccuty.epill.user.User;

public class PackagingAddressSet extends HashSet<PackagingAddress>
{
	protected Class<?> getTypClass() {
		return PackagingAddress.class;
	}

   public PackagingAddressSet()
   {
      // empty
   }

   public PackagingAddressSet(PackagingAddress... objects)
   {
      for (PackagingAddress obj : objects)
      {
         this.add(obj);
      }
   }

   public PackagingAddressSet(Collection<PackagingAddress> objects)
   {
      this.addAll(objects);
   }

   public static final PackagingAddressSet EMPTY_SET = new PackagingAddressSet();


   public String getEntryType()
   {
      return "com.doccuty.epill.model.PackagingAddress";
   }


   @SuppressWarnings("unchecked")
   public PackagingAddressSet with(Object value)
   {
      if (value == null)
      {
         return this;
      }
      else if (value instanceof java.util.Collection)
      {
         this.addAll((Collection<PackagingAddress>)value);
      }
      else if (value != null)
      {
         this.add((PackagingAddress) value);
      }
      
      return this;
   }
   
   public PackagingAddressSet without(PackagingAddress value)
   {
      this.remove(value);
      return this;
   }


   /**
    * Loop through the current set of PackagingAddress objects and collect a list of the id attribute values. 
    * 
    * @return List of int objects reachable via id attribute
    */
   public NumberList getId()
   {
      NumberList result = new NumberList();
      
      for (PackagingAddress obj : this)
      {
         result.add(obj.getId());
      }
      
      return result;
   }


   /**
    * Loop through the current set of PackagingAddress objects and collect those PackagingAddress objects where the id attribute matches the parameter value. 
    * 
    * @param value Search value
    * 
    * @return Subset of PackagingAddress objects that match the parameter
    */
   public PackagingAddressSet filterId(int value)
   {
      PackagingAddressSet result = new PackagingAddressSet();
      
      for (PackagingAddress obj : this)
      {
         if (value == obj.getId())
         {
            result.add(obj);
         }
      }
      
      return result;
   }


   /**
    * Loop through the current set of PackagingAddress objects and collect those PackagingAddress objects where the id attribute is between lower and upper. 
    * 
    * @param lower Lower bound 
    * @param upper Upper bound 
    * 
    * @return Subset of PackagingAddress objects that match the parameter
    */
   public PackagingAddressSet filterId(int lower, int upper)
   {
      PackagingAddressSet result = new PackagingAddressSet();
      
      for (PackagingAddress obj : this)
      {
         if (lower <= obj.getId() && obj.getId() <= upper)
         {
            result.add(obj);
         }
      }
      
      return result;
   }


   /**
    * Loop through the current set of PackagingAddress objects and assign value to the id attribute of each of it. 
    * 
    * @param value New attribute value
    * 
    * @return Current set of PackagingAddress objects now with new attribute values.
    */
   public PackagingAddressSet withId(int value)
   {
      for (PackagingAddress obj : this)
      {
         obj.setId(value);
      }
      
      return this;
   }


   /**
    * Loop through the current set of PackagingAddress objects and collect a list of the title attribute values. 
    * 
    * @return List of String objects reachable via title attribute
    */
   public ObjectSet getTitle()
   {
      ObjectSet result = new ObjectSet();
      
      for (PackagingAddress obj : this)
      {
         result.add(obj.getTitle());
      }
      
      return result;
   }


   /**
    * Loop through the current set of PackagingAddress objects and collect those PackagingAddress objects where the title attribute matches the parameter value. 
    * 
    * @param value Search value
    * 
    * @return Subset of PackagingAddress objects that match the parameter
    */
   public PackagingAddressSet filterTitle(String value)
   {
      PackagingAddressSet result = new PackagingAddressSet();
      
      for (PackagingAddress obj : this)
      {
         if (value.equals(obj.getTitle()))
         {
            result.add(obj);
         }
      }
      
      return result;
   }


   /**
    * Loop through the current set of PackagingAddress objects and collect those PackagingAddress objects where the title attribute is between lower and upper. 
    * 
    * @param lower Lower bound 
    * @param upper Upper bound 
    * 
    * @return Subset of PackagingAddress objects that match the parameter
    */
   public PackagingAddressSet filterTitle(String lower, String upper)
   {
      PackagingAddressSet result = new PackagingAddressSet();
      
      for (PackagingAddress obj : this)
      {
         if (lower.compareTo(obj.getTitle()) <= 0 && obj.getTitle().compareTo(upper) <= 0)
         {
            result.add(obj);
         }
      }
      
      return result;
   }


   /**
    * Loop through the current set of PackagingAddress objects and assign value to the title attribute of each of it. 
    * 
    * @param value New attribute value
    * 
    * @return Current set of PackagingAddress objects now with new attribute values.
    */
   public PackagingAddressSet withTitle(String value)
   {
      for (PackagingAddress obj : this)
      {
         obj.setTitle(value);
      }
      
      return this;
   }



}
