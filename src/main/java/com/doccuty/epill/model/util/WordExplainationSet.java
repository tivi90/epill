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
import com.doccuty.epill.model.WordExplaination;
import com.doccuty.epill.drug.Drug;
import de.uniks.networkparser.list.NumberList;
import de.uniks.networkparser.list.ObjectSet;

import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;

public class WordExplainationSet extends HashSet<WordExplaination>
{
    protected Class<?> getTypClass() {
        return WordExplaination.class;
    }

    public WordExplainationSet()
    {
        // empty
    }

    public WordExplainationSet(WordExplaination... objects)
    {
        for (WordExplaination obj : objects)
        {
            this.add(obj);
        }
    }

    public WordExplainationSet(Collection<WordExplaination> objects)
    {
        this.addAll(objects);
    }

    public static final WordExplainationSet EMPTY_SET = new WordExplainationSet();


    public String getEntryType()
    {
        return "com.doccuty.epill.model.WordExplaination";
    }


    @SuppressWarnings("unchecked")
    public WordExplainationSet with(Object value)
    {
        if (value == null)
        {
            return this;
        }
        else if (value instanceof Collection)
        {
            this.addAll((Collection<WordExplaination>)value);
        }
        else if (value != null)
        {
            this.add((WordExplaination) value);
        }

        return this;
    }

    public WordExplainationSet without(WordExplaination value)
    {
        this.remove(value);
        return this;
    }


    /**
     * Loop through the current set of WordExplaination objects and collect a list of the id attribute values. 
     *
     * @return List of int objects reachable via id attribute
     */
    public NumberList getId()
    {
        NumberList result = new NumberList();

        for (WordExplaination obj : this)
        {
            result.add(obj.getId());
        }

        return result;
    }


    /**
     * Loop through the current set of WordExplaination objects and collect those WordExplaination objects where the id attribute matches the parameter value. 
     *
     * @param value Search value
     *
     * @return Subset of WordExplaination objects that match the parameter
     */
    public WordExplainationSet filterId(int value)
    {
        WordExplainationSet result = new WordExplainationSet();

        for (WordExplaination obj : this)
        {
            if (value == obj.getId())
            {
                result.add(obj);
            }
        }

        return result;
    }


    /**
     * Loop through the current set of WordExplaination objects and collect those WordExplaination objects where the id attribute is between lower and upper. 
     *
     * @param lower Lower bound 
     * @param upper Upper bound 
     *
     * @return Subset of WordExplaination objects that match the parameter
     */
    public WordExplainationSet filterId(int lower, int upper)
    {
        WordExplainationSet result = new WordExplainationSet();

        for (WordExplaination obj : this)
        {
            if (lower <= obj.getId() && obj.getId() <= upper)
            {
                result.add(obj);
            }
        }

        return result;
    }


    /**
     * Loop through the current set of WordExplaination objects and assign value to the id attribute of each of it. 
     *
     * @param value New attribute value
     *
     * @return Current set of WordExplaination objects now with new attribute values.
     */
    public WordExplainationSet withId(int value)
    {
        for (WordExplaination obj : this)
        {
            obj.setId(value);
        }

        return this;
    }


    /**
     * Loop through the current set of WordExplaination objects and collect a list of the name attribute values. 
     *
     * @return List of String objects reachable via name attribute
     */
    public ObjectSet getName()
    {
        ObjectSet result = new ObjectSet();

        for (WordExplaination obj : this)
        {
            result.add(obj.getName());
        }

        return result;
    }

    /**
     * Loop through the current set of WordExplaination objects and collect a list of the name attribute values.
     *
     * @return List of String objects reachable via name attribute
     */
    public ObjectSet getDescription()
    {
        ObjectSet result = new ObjectSet();

        for (WordExplaination obj : this)
        {
            result.add(obj.getDescription());
        }

        return result;
    }


    /**
     * Loop through the current set of WordExplaination objects and collect those WordExplaination objects where the name attribute matches the parameter value. 
     *
     * @param value Search value
     *
     * @return Subset of WordExplaination objects that match the parameter
     */
    public WordExplainationSet filterName(String value)
    {
        WordExplainationSet result = new WordExplainationSet();

        for (WordExplaination obj : this)
        {
            if (value.equals(obj.getName()))
            {
                result.add(obj);
            }
        }

        return result;
    }


    /**
     * Loop through the current set of WordExplaination objects and collect those WordExplaination objects where the name attribute is between lower and upper. 
     *
     * @param lower Lower bound 
     * @param upper Upper bound 
     *
     * @return Subset of WordExplaination objects that match the parameter
     */
    public WordExplainationSet filterName(String lower, String upper)
    {
        WordExplainationSet result = new WordExplainationSet();

        for (WordExplaination obj : this)
        {
            if (lower.compareTo(obj.getName()) <= 0 && obj.getName().compareTo(upper) <= 0)
            {
                result.add(obj);
            }
        }

        return result;
    }


    /**
     * Loop through the current set of WordExplaination objects and assign value to the name attribute of each of it. 
     *
     * @param value New attribute value
     *
     * @return Current set of WordExplaination objects now with new attribute values.
     */
    public WordExplainationSet withName(String value)
    {
        for (WordExplaination obj : this)
        {
            obj.setName(value);
        }

        return this;
    }

    /**
     * Loop through the current set of WordExplaination objects and collect a set of the Drug objects reached via drug. 
     *
     * @return Set of Drug objects reachable via drug
     */
    public DrugSet getDrug()
    {
        DrugSet result = new DrugSet();

        for (WordExplaination obj : this)
        {
            result.with(obj.getDrug());
        }

        return result;
    }

    /**
     * Loop through the current set of WordExplaination objects and collect all contained objects with reference drug pointing to the object passed as parameter. 
     *
     * @param value The object required as drug neighbor of the collected results. 
     *
     * @return Set of Drug objects referring to value via drug
     */
    public WordExplainationSet filterDrug(Object value)
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

        WordExplainationSet answer = new WordExplainationSet();

        for (WordExplaination obj : this)
        {
            if ( ! Collections.disjoint(neighbors, obj.getDrug()))
            {
                answer.add(obj);
            }
        }

        return answer;
    }

    /**
     * Loop through current set of ModelType objects and attach the WordExplaination object passed as parameter to the Drug attribute of each of it. 
     *
     * @return The original set of ModelType objects now with the new neighbor attached to their Drug attributes.
     */
    public WordExplainationSet withDrug(Drug value)
    {
        for (WordExplaination obj : this)
        {
            obj.withDrug(value);
        }

        return this;
    }

    /**
     * Loop through current set of ModelType objects and remove the WordExplaination object passed as parameter from the Drug attribute of each of it. 
     *
     * @return The original set of ModelType objects now without the old neighbor.
     */
    public WordExplainationSet withoutDrug(Drug value)
    {
        for (WordExplaination obj : this)
        {
            obj.withoutDrug(value);
        }

        return this;
    }


}
