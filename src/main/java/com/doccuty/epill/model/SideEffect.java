/*
Copyright (c) 2017 mac
*/

package com.doccuty.epill.model;

import com.doccuty.epill.drug.Drug;
import com.doccuty.epill.model.util.DrugSet;

import de.uniks.networkparser.EntityUtil;
import de.uniks.networkparser.interfaces.SendableEntity;

import javax.persistence.*;
import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;
import java.util.Set;


@Entity
@Table(name = "side_effect")
public class SideEffect implements SendableEntity {


	public SideEffect() {

	}

	public SideEffect(long id, String sideEffect, String descriptionDrug){
		this.id = id;
		this.sideEffect = sideEffect;
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

	public SideEffect withId(long value) {
		setId(value);
		return this;
	}

	@Override
	public String toString() {
		StringBuilder result = new StringBuilder();

		result.append(" ").append(this.getId());
		result.append(" ").append(this.getSideEffect());
		result.append(" ").append(this.getDescriptionDrug());
		return result.substring(1);
	}

	// ==========================================================================

	public static final String PROPERTY_SIDEEFFECT = "sideEffect";

	private String sideEffect;

	public String getSideEffect() {
		return this.sideEffect;
	}

	public void setSideEffect(String value) {
		if (!EntityUtil.stringEquals(this.sideEffect, value)) {

			String oldValue = this.sideEffect;
			this.sideEffect = value;
			this.firePropertyChange(PROPERTY_SIDEEFFECT, oldValue, value);
		}
	}

	public SideEffect withSideEffect(String value) {
		setSideEffect(value);
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

	public SideEffect withDescriptionDrug(String value) {
		setDescriptionDrug(value);
		return this;
	}


	
	   /********************************************************************
	    * <pre>
	    *              one                       many
	    * SideEffect ----------------------------------- Drug
	    *
	    *
	    * </pre>
	    */
	   
	   public static final String PROPERTY_DRUG = "side_effect";

	   @ManyToMany(cascade=CascadeType.ALL, mappedBy="sideEffect")
	   private Set<Drug> drug = null;
	   
	   public Set<Drug> getDrug()
	   {
	      if (this.drug == null)
	      {
	         return DrugSet.EMPTY_SET;
	      }
	   
	      return this.drug;
	   }

	   public SideEffect withDrug(Drug... value)
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
	               item.withSideEffect(this);
	               firePropertyChange(PROPERTY_SIDEEFFECT, null, item);
	            }
	         }
	      }
	      return this;
	   } 

	   public SideEffect withoutDrug(Drug... value)
	   {
	      for (Drug item : value)
	      {
	         if ((this.drug != null) && (item != null))
	         {
	            if (this.drug.remove(item))
	            {
	               item.withoutSideEffect(this);
	               firePropertyChange(PROPERTY_SIDEEFFECT, item, null);
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
