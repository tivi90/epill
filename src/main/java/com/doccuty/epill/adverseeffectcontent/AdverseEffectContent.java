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

package com.doccuty.epill.adverseeffectcontent;

import com.doccuty.epill.drug.Drug;
import com.doccuty.epill.model.AdverseEffect;
import de.uniks.networkparser.interfaces.SendableEntity;
import java.beans.PropertyChangeSupport;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import java.beans.PropertyChangeListener;
import de.uniks.networkparser.EntityUtil;



@Entity
@Table(name = "adverseEffectContent")
public class AdverseEffectContent implements SendableEntity {

	// ==========================================================================

	protected PropertyChangeSupport listeners = null;

	public boolean firePropertyChange(String propertyName, Object oldValue, Object newValue) {
		if (listeners != null) {
			listeners.firePropertyChange(propertyName, oldValue, newValue);
			return true;
		}
		return false;
	}

	public boolean addPropertyChangeListener(PropertyChangeListener listener) {
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

	public boolean removePropertyChangeListener(String propertyName, PropertyChangeListener listener) {
		if (listeners != null) {
			listeners.removePropertyChangeListener(propertyName, listener);
		}
		return true;
	}

	// ==========================================================================

	public void removeYou() {
		setDrug(null);
		firePropertyChange("REMOVE_YOU", this, null);
	}

	// ==========================================================================

	public static final String PROPERTY_ID = "id";

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;

	public long getId() {
		return this.id;
	}

	public void setId(long value) {
		if (this.id != value) {

			long oldValue = this.id;
			this.id = value;
			this.firePropertyChange(PROPERTY_ID, oldValue, value);
		}
	}

	public com.doccuty.epill.adverseeffectcontent.AdverseEffectContent withId(long value) {
		setId(value);
		return this;
	}

	@Override
	public String toString() {
		StringBuilder result = new StringBuilder();

		result.append(" ").append(this.getId());
		result.append(" ").append(this.getText());
		result.append(" ").append(this.getNumber());

		return result.substring(1);
	}

	// ==========================================================================

	public static final String PROPERTY_STATE = "state";

	private int state;
	
	public int getState()
	{
	   return this.state;
	}
	
	public void setState(int value)
	{
	   if (this.state != value) {
	   
	      int oldValue = this.state;
	      this.state = value;
	      this.firePropertyChange(PROPERTY_STATE, oldValue, value);
	   }
	}
	
	public com.doccuty.epill.adverseeffectcontent.AdverseEffectContent withState(int value)
	{
	   setState(value);
	   return this;
	}
	
	

	// ==========================================================================

	public static final String PROPERTY_TOPIC = "topic";

	@ManyToOne(cascade=CascadeType.MERGE)
	@JoinColumn(name = "idadverse_effect")
	private AdverseEffect topic;

	public AdverseEffect getTopic()
   {
      return this.topic;
   }

	public void setTopic(AdverseEffect value)
   {
      if (this.topic != value) {

		  AdverseEffect oldValue = this.topic;
         this.topic = value;
         this.firePropertyChange(PROPERTY_TOPIC, oldValue, value);
      }
   }

	public com.doccuty.epill.adverseeffectcontent.AdverseEffectContent withTopic(AdverseEffect value)
   {
      setTopic(value);
      return this;
   }



	// ==========================================================================

	public static final String PROPERTY_TEXT = "text";

	@Column(name="text", columnDefinition="TEXT")
	private String text;

	public String getText()
   {
      return this.text;
   }

	public void setText(String value)
   {
      if ( ! EntityUtil.stringEquals(this.text, value)) {
      
         String oldValue = this.text;
         this.text = value;
         this.firePropertyChange(PROPERTY_TEXT, oldValue, value);
      }
   }

	public com.doccuty.epill.adverseeffectcontent.AdverseEffectContent withText(String value)
   {
	   setText(value);
      return this;
   }
	// ==========================================================================

	public static final String PROPERTY_PURPOSE = "purpose";

	@Column(name="purpose", columnDefinition="TEXT")
	private String purpose;

	public String getPurpose()
	{
		return this.purpose;
	}

	public void setPurpose(String value)
	{
		if ( ! EntityUtil.stringEquals(this.purpose, value)) {

			String oldValue = this.purpose;
			this.purpose = value;
			this.firePropertyChange(PROPERTY_PURPOSE, oldValue, value);
		}
	}

	public com.doccuty.epill.adverseeffectcontent.AdverseEffectContent withPurpose(String value)
	{
		setPurpose(value);
		return this;
	}
// ==========================================================================

	public static final String PROPERTY_NUMBER = "number";

	@Column(name="number", columnDefinition="BIGINT")
	private String number;

	public String getNumber()
	{
		return this.number;
	}

	public void setNumber(String value)
	{
		if ( ! EntityUtil.stringEquals(this.number, value)) {

			String oldValue = this.number;
			this.number = value;
			this.firePropertyChange(PROPERTY_NUMBER, oldValue, value);
		}
	}

	public com.doccuty.epill.adverseeffectcontent.AdverseEffectContent withNumber(String value)
	{
		setNumber(value);
		return this;
	}

	// ==========================================================================


	/********************************************************************
    * <pre>
    *              many                       one
    * AdverseEffectContent ----------------------------------- Drug
    *              AdverseEffectContent                   drug
    * </pre>
    */
   
   public static final String PROPERTY_DRUG = "drug";

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "iddrug")
	private Drug drug = null;

	public Drug getDrug()
   {
      return this.drug;
   }

	public boolean setDrug(Drug value)
   {
      boolean changed = false;
      
      if (this.drug != value)
      {
         Drug oldValue = this.drug;
         
         if (this.drug != null)
         {
            this.drug = null;
            oldValue.withoutAdverseEffectContent(this);
         }
         
         this.drug = value;
         
         if (value != null)
         {
            value.withAdverseEffectContent(this);
         }
         
         firePropertyChange(PROPERTY_DRUG, oldValue, value);
         changed = true;
      }
      
      return changed;
   }

	public com.doccuty.epill.adverseeffectcontent.AdverseEffectContent withDrug(Drug value)
   {
      setDrug(value);
      return this;
   }

	public Drug createDrug()
   {
      Drug value = new Drug();
      withDrug(value);
      return value;
   }


}
