/*
Copyright (c) 2017 mac
*/

package com.doccuty.epill.model;

import com.doccuty.epill.drug.Drug;
import com.doccuty.epill.model.util.DrugSet;

import com.doccuty.epill.model.util.AdverseEffectContentSet;
import com.doccuty.epill.adverseeffectcontent.AdverseEffectContent;
import de.uniks.networkparser.EntityUtil;
import de.uniks.networkparser.interfaces.SendableEntity;

import javax.persistence.*;
import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;
import java.util.Set;


import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;





@Entity
@Table(name = "adverse_effect")
public class AdverseEffect implements SendableEntity {


	public AdverseEffect() {

	}

	public AdverseEffect(long id, String adverseEffect, String descriptionDrug){
		this.id = id;
		this.adverseEffect = adverseEffect;
		this.descriptionDrug = descriptionDrug;
	}
	
	
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

	public AdverseEffect withId(long value) {
		setId(value);
		return this;
	}

	@Override
	public String toString() {
		StringBuilder result = new StringBuilder();

		result.append(" ").append(this.getId());
		result.append(" ").append(this.getAdverseEffect());
		result.append(" ").append(this.getDescriptionDrug());
		return result.substring(1);
	}

	// ==========================================================================

	public static final String PROPERTY_ADVERSEFFECT = "adverseEffect";

	private String adverseEffect;

	public String getAdverseEffect() {
		return this.adverseEffect;
	}

	public void setAdverseEffect(String value) {
		if (!EntityUtil.stringEquals(this.adverseEffect, value)) {

			String oldValue = this.adverseEffect;
			this.adverseEffect = value;
			this.firePropertyChange(PROPERTY_ADVERSEFFECT, oldValue, value);
		}
	}

	public AdverseEffect withAdverseEffect(String value) {
		setAdverseEffect(value);
		return this;
	}


    // ==========================================================================

    public static final String PROPERTY_DESCRIPTIONDRUG = "descriptionDrug";
	@Column(name="descriptionDrug", columnDefinition="TEXT")

	private String descriptionDrug;

    public String getDescriptionDrug() {
        return this.descriptionDrug;
    }

    public void setDescriptionDrug(String value) {
        if (!EntityUtil.stringEquals(this.descriptionDrug, value)) {

            String oldValue = this.descriptionDrug;
            this.descriptionDrug = value;
            this.firePropertyChange(PROPERTY_DESCRIPTIONDRUG, oldValue, value);
        }
    }

	public AdverseEffect withDescriptionDrug(String value) {
		setDescriptionDrug(value);
		return this;
	}


	
	   /********************************************************************
	    * <pre>
	    *              one                       many
	    * AdverseEffect ----------------------------------- Drug
	    *
	    *
	    * </pre>
	    */
	   
	   public static final String PROPERTY_DRUG = "adverse_effect";

	   @ManyToMany(cascade=CascadeType.ALL, mappedBy="adverseEffect")
	   private Set<Drug> drug = null;
	   
	   public Set<Drug> getDrug()
	   {
	      if (this.drug == null)
	      {
	         return DrugSet.EMPTY_SET;
	      }
	   
	      return this.drug;
	   }

	   public AdverseEffect withDrug(Drug... value)
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
	               item.withAdverseEffect(this);
	               firePropertyChange(PROPERTY_ADVERSEFFECT, null, item);
	            }
	         }
	      }
	      return this;
	   } 

	   public AdverseEffect withoutDrug(Drug... value)
	   {
	      for (Drug item : value)
	      {
	         if ((this.drug != null) && (item != null))
	         {
	            if (this.drug.remove(item))
	            {
	               item.withoutAdverseEffect(this);
	               firePropertyChange(PROPERTY_ADVERSEFFECT, item, null);
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

	/********************************************************************
	 * <pre>
	 *              one                       many
	 * AdverseEffectContent ----------------------------------- Sideeffect
	 *              packagingSection                   clicks
	 * </pre>
	 */

	public static final String PROPERTY_ADVERSEFFECTCONTENT = "adverseEffectContent";

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "topic")
	private Set<AdverseEffectContent> adverseEffectContent = null;

	public Set<AdverseEffectContent> getAdverseEffectContent() {
		if (this.adverseEffectContent == null) {
			return AdverseEffectContentSet.EMPTY_SET;
		}

		return this.adverseEffectContent;
	}

	public AdverseEffect withAdverseEffectContent(AdverseEffectContent... value) {
		if (value == null) {
			return this;
		}
		for (AdverseEffectContent item : value) {
			if (item != null) {
				if (this.adverseEffectContent == null) {
					this.adverseEffectContent = new AdverseEffectContentSet();
				}

				boolean changed = this.adverseEffectContent.add(item);

				if (changed) {
					item.withTopic(this);
					firePropertyChange(PROPERTY_ADVERSEFFECTCONTENT, null, item);
				}
			}
		}
		return this;
	}

	public AdverseEffect withoutEffectContent(AdverseEffectContent... value) {
		for (AdverseEffectContent item : value) {
			if ((this.adverseEffectContent != null) && (item != null)) {
				if (this.adverseEffectContent.remove(item)) {
					item.setTopic(null);
					firePropertyChange(PROPERTY_ADVERSEFFECTCONTENT, item, null);
				}
			}
		}
		return this;
	}

	public AdverseEffectContent createClicks() {
		AdverseEffectContent value = new AdverseEffectContent();
		withAdverseEffectContent(value);
		return value;
	}
}
