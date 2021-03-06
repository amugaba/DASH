
/**
 * This is a generated class and is not intended for modification.  
 */
package valueObjects
{
import com.adobe.fiber.styles.IStyle;
import com.adobe.fiber.styles.Style;
import com.adobe.fiber.valueobjects.AbstractEntityMetadata;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IModelType;
import mx.events.PropertyChangeEvent;

use namespace model_internal;

[ExcludeClass]
internal class _CostReportVOEntityMetadata extends com.adobe.fiber.valueobjects.AbstractEntityMetadata
{
    private static var emptyArray:Array = new Array();

    model_internal static var allProperties:Array = new Array("workloadPrescreen", "educationTime", "otherTime", "workloadRT", "otherCost", "userid", "autoid", "workloadTraining", "trainingTime", "year", "workloadAdmin", "facilityPercent", "supplies", "biTime", "workloadOther", "workloadBI", "otherCostSpec", "workloadSupport", "adminTime", "otherTimeSpec", "workloadScreen", "tech", "screenTime", "salaries", "workloadEducation", "supportTime", "month", "rtTime", "dataReportID", "prescreenTime", "facilityCost", "comments");
    model_internal static var allAssociationProperties:Array = new Array();
    model_internal static var allRequiredProperties:Array = new Array();
    model_internal static var allAlwaysAvailableProperties:Array = new Array("workloadPrescreen", "educationTime", "otherTime", "workloadRT", "otherCost", "userid", "autoid", "workloadTraining", "trainingTime", "year", "workloadAdmin", "facilityPercent", "supplies", "biTime", "workloadOther", "workloadBI", "otherCostSpec", "workloadSupport", "adminTime", "otherTimeSpec", "workloadScreen", "tech", "screenTime", "salaries", "workloadEducation", "supportTime", "month", "rtTime", "dataReportID", "prescreenTime", "facilityCost", "comments");
    model_internal static var guardedProperties:Array = new Array();
    model_internal static var dataProperties:Array = new Array("workloadPrescreen", "educationTime", "otherTime", "workloadRT", "otherCost", "userid", "autoid", "workloadTraining", "trainingTime", "year", "workloadAdmin", "facilityPercent", "supplies", "biTime", "workloadOther", "workloadBI", "otherCostSpec", "workloadSupport", "adminTime", "otherTimeSpec", "workloadScreen", "tech", "screenTime", "salaries", "workloadEducation", "supportTime", "month", "rtTime", "dataReportID", "prescreenTime", "facilityCost", "comments");
    model_internal static var sourceProperties:Array = emptyArray
    model_internal static var nonDerivedProperties:Array = new Array("workloadPrescreen", "educationTime", "otherTime", "workloadRT", "otherCost", "userid", "autoid", "workloadTraining", "trainingTime", "year", "workloadAdmin", "facilityPercent", "supplies", "biTime", "workloadOther", "workloadBI", "otherCostSpec", "workloadSupport", "adminTime", "otherTimeSpec", "workloadScreen", "tech", "screenTime", "salaries", "workloadEducation", "supportTime", "month", "rtTime", "dataReportID", "prescreenTime", "facilityCost", "comments");
    model_internal static var derivedProperties:Array = new Array();
    model_internal static var collectionProperties:Array = new Array();
    model_internal static var collectionBaseMap:Object;
    model_internal static var entityName:String = "CostReportVO";
    model_internal static var dependentsOnMap:Object;
    model_internal static var dependedOnServices:Array = new Array();
    model_internal static var propertyTypeMap:Object;


    model_internal var _instance:_Super_CostReportVO;
    model_internal static var _nullStyle:com.adobe.fiber.styles.Style = new com.adobe.fiber.styles.Style();

    public function _CostReportVOEntityMetadata(value : _Super_CostReportVO)
    {
        // initialize property maps
        if (model_internal::dependentsOnMap == null)
        {
            // dependents map
            model_internal::dependentsOnMap = new Object();
            model_internal::dependentsOnMap["workloadPrescreen"] = new Array();
            model_internal::dependentsOnMap["educationTime"] = new Array();
            model_internal::dependentsOnMap["otherTime"] = new Array();
            model_internal::dependentsOnMap["workloadRT"] = new Array();
            model_internal::dependentsOnMap["otherCost"] = new Array();
            model_internal::dependentsOnMap["userid"] = new Array();
            model_internal::dependentsOnMap["autoid"] = new Array();
            model_internal::dependentsOnMap["workloadTraining"] = new Array();
            model_internal::dependentsOnMap["trainingTime"] = new Array();
            model_internal::dependentsOnMap["year"] = new Array();
            model_internal::dependentsOnMap["workloadAdmin"] = new Array();
            model_internal::dependentsOnMap["facilityPercent"] = new Array();
            model_internal::dependentsOnMap["supplies"] = new Array();
            model_internal::dependentsOnMap["biTime"] = new Array();
            model_internal::dependentsOnMap["workloadOther"] = new Array();
            model_internal::dependentsOnMap["workloadBI"] = new Array();
            model_internal::dependentsOnMap["otherCostSpec"] = new Array();
            model_internal::dependentsOnMap["workloadSupport"] = new Array();
            model_internal::dependentsOnMap["adminTime"] = new Array();
            model_internal::dependentsOnMap["otherTimeSpec"] = new Array();
            model_internal::dependentsOnMap["workloadScreen"] = new Array();
            model_internal::dependentsOnMap["tech"] = new Array();
            model_internal::dependentsOnMap["screenTime"] = new Array();
            model_internal::dependentsOnMap["salaries"] = new Array();
            model_internal::dependentsOnMap["workloadEducation"] = new Array();
            model_internal::dependentsOnMap["supportTime"] = new Array();
            model_internal::dependentsOnMap["month"] = new Array();
            model_internal::dependentsOnMap["rtTime"] = new Array();
            model_internal::dependentsOnMap["dataReportID"] = new Array();
            model_internal::dependentsOnMap["prescreenTime"] = new Array();
            model_internal::dependentsOnMap["facilityCost"] = new Array();
            model_internal::dependentsOnMap["comments"] = new Array();

            // collection base map
            model_internal::collectionBaseMap = new Object();
        }

        // Property type Map
        model_internal::propertyTypeMap = new Object();
        model_internal::propertyTypeMap["workloadPrescreen"] = "Object";
        model_internal::propertyTypeMap["educationTime"] = "Number";
        model_internal::propertyTypeMap["otherTime"] = "Number";
        model_internal::propertyTypeMap["workloadRT"] = "Object";
        model_internal::propertyTypeMap["otherCost"] = "Number";
        model_internal::propertyTypeMap["userid"] = "int";
        model_internal::propertyTypeMap["autoid"] = "int";
        model_internal::propertyTypeMap["workloadTraining"] = "Object";
        model_internal::propertyTypeMap["trainingTime"] = "Number";
        model_internal::propertyTypeMap["year"] = "int";
        model_internal::propertyTypeMap["workloadAdmin"] = "Object";
        model_internal::propertyTypeMap["facilityPercent"] = "Number";
        model_internal::propertyTypeMap["supplies"] = "Number";
        model_internal::propertyTypeMap["biTime"] = "Number";
        model_internal::propertyTypeMap["workloadOther"] = "Object";
        model_internal::propertyTypeMap["workloadBI"] = "Object";
        model_internal::propertyTypeMap["otherCostSpec"] = "String";
        model_internal::propertyTypeMap["workloadSupport"] = "Object";
        model_internal::propertyTypeMap["adminTime"] = "Number";
        model_internal::propertyTypeMap["otherTimeSpec"] = "String";
        model_internal::propertyTypeMap["workloadScreen"] = "Object";
        model_internal::propertyTypeMap["tech"] = "Number";
        model_internal::propertyTypeMap["screenTime"] = "Number";
        model_internal::propertyTypeMap["salaries"] = "Object";
        model_internal::propertyTypeMap["workloadEducation"] = "Object";
        model_internal::propertyTypeMap["supportTime"] = "Number";
        model_internal::propertyTypeMap["month"] = "int";
        model_internal::propertyTypeMap["rtTime"] = "Number";
        model_internal::propertyTypeMap["dataReportID"] = "int";
        model_internal::propertyTypeMap["prescreenTime"] = "Number";
        model_internal::propertyTypeMap["facilityCost"] = "Number";
        model_internal::propertyTypeMap["comments"] = "String";

        model_internal::_instance = value;
    }

    override public function getEntityName():String
    {
        return model_internal::entityName;
    }

    override public function getProperties():Array
    {
        return model_internal::allProperties;
    }

    override public function getAssociationProperties():Array
    {
        return model_internal::allAssociationProperties;
    }

    override public function getRequiredProperties():Array
    {
         return model_internal::allRequiredProperties;   
    }

    override public function getDataProperties():Array
    {
        return model_internal::dataProperties;
    }

    public function getSourceProperties():Array
    {
        return model_internal::sourceProperties;
    }

    public function getNonDerivedProperties():Array
    {
        return model_internal::nonDerivedProperties;
    }

    override public function getGuardedProperties():Array
    {
        return model_internal::guardedProperties;
    }

    override public function getUnguardedProperties():Array
    {
        return model_internal::allAlwaysAvailableProperties;
    }

    override public function getDependants(propertyName:String):Array
    {
       if (model_internal::nonDerivedProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a data property of entity CostReportVO");
            
       return model_internal::dependentsOnMap[propertyName] as Array;  
    }

    override public function getDependedOnServices():Array
    {
        return model_internal::dependedOnServices;
    }

    override public function getCollectionProperties():Array
    {
        return model_internal::collectionProperties;
    }

    override public function getCollectionBase(propertyName:String):String
    {
        if (model_internal::collectionProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a collection property of entity CostReportVO");

        return model_internal::collectionBaseMap[propertyName];
    }
    
    override public function getPropertyType(propertyName:String):String
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a property of CostReportVO");

        return model_internal::propertyTypeMap[propertyName];
    }

    override public function getAvailableProperties():com.adobe.fiber.valueobjects.IPropertyIterator
    {
        return new com.adobe.fiber.valueobjects.AvailablePropertyIterator(this);
    }

    override public function getValue(propertyName:String):*
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " does not exist for entity CostReportVO");
        }

        return model_internal::_instance[propertyName];
    }

    override public function setValue(propertyName:String, value:*):void
    {
        if (model_internal::nonDerivedProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " is not a modifiable property of entity CostReportVO");
        }

        model_internal::_instance[propertyName] = value;
    }

    override public function getMappedByProperty(associationProperty:String):String
    {
        switch(associationProperty)
        {
            default:
            {
                return null;
            }
        }
    }

    override public function getPropertyLength(propertyName:String):int
    {
        switch(propertyName)
        {
            default:
            {
                return 0;
            }
        }
    }

    override public function isAvailable(propertyName:String):Boolean
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " does not exist for entity CostReportVO");
        }

        if (model_internal::allAlwaysAvailableProperties.indexOf(propertyName) != -1)
        {
            return true;
        }

        switch(propertyName)
        {
            default:
            {
                return true;
            }
        }
    }

    override public function getIdentityMap():Object
    {
        var returnMap:Object = new Object();

        return returnMap;
    }

    [Bindable(event="propertyChange")]
    override public function get invalidConstraints():Array
    {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_invalidConstraints;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            return model_internal::_instance.model_internal::_invalidConstraints;        
        }
    }

    [Bindable(event="propertyChange")]
    override public function get validationFailureMessages():Array
    {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_validationFailureMessages;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            return model_internal::_instance.model_internal::_validationFailureMessages;
        }
    }

    override public function getDependantInvalidConstraints(propertyName:String):Array
    {
        var dependants:Array = getDependants(propertyName);
        if (dependants.length == 0)
        {
            return emptyArray;
        }

        var currentlyInvalid:Array = invalidConstraints;
        if (currentlyInvalid.length == 0)
        {
            return emptyArray;
        }

        var filterFunc:Function = function(element:*, index:int, arr:Array):Boolean
        {
            return dependants.indexOf(element) > -1;
        }

        return currentlyInvalid.filter(filterFunc);
    }

    /**
     * isValid
     */
    [Bindable(event="propertyChange")] 
    public function get isValid() : Boolean
    {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_isValid;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            return model_internal::_instance.model_internal::_isValid;
        }
    }

    [Bindable(event="propertyChange")]
    public function get isWorkloadPrescreenAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isEducationTimeAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isOtherTimeAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isWorkloadRTAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isOtherCostAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isUseridAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isAutoidAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isWorkloadTrainingAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isTrainingTimeAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isYearAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isWorkloadAdminAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isFacilityPercentAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isSuppliesAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isBiTimeAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isWorkloadOtherAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isWorkloadBIAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isOtherCostSpecAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isWorkloadSupportAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isAdminTimeAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isOtherTimeSpecAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isWorkloadScreenAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isTechAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isScreenTimeAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isSalariesAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isWorkloadEducationAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isSupportTimeAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isMonthAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isRtTimeAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isDataReportIDAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isPrescreenTimeAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isFacilityCostAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isCommentsAvailable():Boolean
    {
        return true;
    }


    /**
     * derived property recalculation
     */

    model_internal function fireChangeEvent(propertyName:String, oldValue:Object, newValue:Object):void
    {
        this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, propertyName, oldValue, newValue));
    }

    [Bindable(event="propertyChange")]   
    public function get workloadPrescreenStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get educationTimeStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get otherTimeStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get workloadRTStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get otherCostStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get useridStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get autoidStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get workloadTrainingStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get trainingTimeStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get yearStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get workloadAdminStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get facilityPercentStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get suppliesStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get biTimeStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get workloadOtherStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get workloadBIStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get otherCostSpecStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get workloadSupportStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get adminTimeStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get otherTimeSpecStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get workloadScreenStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get techStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get screenTimeStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get salariesStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get workloadEducationStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get supportTimeStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get monthStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get rtTimeStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get dataReportIDStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get prescreenTimeStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get facilityCostStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get commentsStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }


     /**
     * 
     * @inheritDoc 
     */ 
     override public function getStyle(propertyName:String):com.adobe.fiber.styles.IStyle
     {
         switch(propertyName)
         {
            default:
            {
                return null;
            }
         }
     }
     
     /**
     * 
     * @inheritDoc 
     *  
     */  
     override public function getPropertyValidationFailureMessages(propertyName:String):Array
     {
         switch(propertyName)
         {
            default:
            {
                return emptyArray;
            }
         }
     }

}

}
