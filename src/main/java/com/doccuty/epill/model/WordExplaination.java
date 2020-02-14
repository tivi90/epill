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
   
package com.doccuty.epill.model;
import de.uniks.networkparser.interfaces.SendableEntity;
import java.beans.PropertyChangeSupport;
import java.util.Set;

import javax.persistence.*;

import java.beans.PropertyChangeListener;
import de.uniks.networkparser.EntityUtil;
import com.doccuty.epill.model.util.DrugSet;
import com.doccuty.epill.drug.Drug;
/**
 *
 * @see <a href='../../../../../../../src/test/java/com/doccuty/epill/model/SDMLib/ModelCreator.java'>ModelCreator.java</a>
*/
@Entity
@Table(name="word_Explaination")
public  class WordExplaination implements SendableEntity
{


//==========================================================================

protected PropertyChangeSupport listeners = null;

public boolean firePropertyChange(String propertyName, Object oldValue, Object newValue)
{
   if (listeners != null) {
        listeners.firePropertyChange(propertyName, oldValue, newValue);
        return true;
    }
    return false;
}

public boolean addPropertyChangeListener(PropertyChangeListener listener)
{
    if (listeners == null) {
        listeners = new PropertyChangeSupport(this);
    }
    listeners.addPropertyChangeListener(listener);
    return true;
}

public boolean addPropertyChangeListener(String propertyName, PropertyChangeListener listener) {
    if (listeners == null) {
        listeners = new PropertyChangeSupport(this);
    }
    listeners.addPropertyChangeListener(propertyName, listener);
    return true;
}

public boolean removePropertyChangeListener(PropertyChangeListener listener) {
    if (listeners == null) {
        listeners.removePropertyChangeListener(listener);
    }
    listeners.removePropertyChangeListener(listener);
    return true;
}

public boolean removePropertyChangeListener(String propertyName,PropertyChangeListener listener) {
    if (listeners != null) {
        listeners.removePropertyChangeListener(propertyName, listener);
    }
    return true;
}



//==========================================================================

public static final String PROPERTY_ID = "id";

@Id
@GeneratedValue(strategy=GenerationType.AUTO)
private int id;

public int getId()
{
   return this.id;
}

public void setId(int value)
{
   if (this.id != value) {

      int oldValue = this.id;
      this.id = value;
      this.firePropertyChange(PROPERTY_ID, oldValue, value);
   }
}

public WordExplaination withId(int value)
{
   setId(value);
   return this;
}


@Override
public String toString()
{
   StringBuilder result = new StringBuilder();

   result.append(" ").append(this.getId());
   result.append(" ").append(this.getName());
   return result.substring(1);
}



//==========================================================================

public static final String PROPERTY_NAME = "name";

private String name;

public String getName()
{
   return this.name;
}

public void setName(String value)
{
   if ( ! EntityUtil.stringEquals(this.name, value)) {

      String oldValue = this.name;
      this.name = value;
      this.firePropertyChange(PROPERTY_NAME, oldValue, value);
   }
}

public WordExplaination withName(String value)
{
   setName(value);
   return this;
}


//==========================================================================

    public static final String PROPERTY_DESC = "description";
    @Column(name="description", columnDefinition="TEXT")


    private String description;

    public String getDescription()
    {
        return this.description;
    }

    public void setDescription(String value)
    {
        if ( ! EntityUtil.stringEquals(this.description, value)) {

            String oldValue = this.description;
            this.description = value;
            this.firePropertyChange(PROPERTY_DESC, oldValue, value);
        }
    }

    public WordExplaination withDescription(String value)
    {
        setDescription(value);
        return this;
    }



/********************************************************************
 * <pre>
 *              many                       many
 * WordExplaination ----------------------------------- Drug
 *              WordExplaination                   drug
 * </pre>
 */

public static final String PROPERTY_DRUG = "drug";

@ManyToMany(cascade=CascadeType.ALL, mappedBy="wordExplaination")
private Set<Drug> drug = null;

public Set<Drug> getDrug()
{
   if (this.drug == null)
   {
      return DrugSet.EMPTY_SET;
   }

   return this.drug;
}

public WordExplaination withDrug(Drug... value)
{
   if(value==null){
      return this;
   }
   for (Drug item : value)
   {
      if (item != null)
      {
         if (this.drug == null)
         {
            this.drug = new DrugSet();
         }

         boolean changed = this.drug.add (item);

         if (changed)
         {
            item.withWordExplaination(this);
            firePropertyChange(PROPERTY_DRUG, null, item);
         }
      }
   }
   return this;
}

public WordExplaination withoutDrug(Drug... value)
{
   for (Drug item : value)
   {
      if ((this.drug != null) && (item != null))
      {
         if (this.drug.remove(item))
         {
            item.withoutWordExplaination(this);
            firePropertyChange(PROPERTY_DRUG, item, null);
         }
      }
   }
   return this;
}

public Drug createDrug()
{
   Drug value = new Drug();
   withDrug(value);
   return value;
}



}
