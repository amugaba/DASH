
/**
 * This is a generated class and is not intended for modification.  
 */
package valueObjects
{
import com.adobe.fiber.styles.IStyle;
import com.adobe.fiber.styles.Style;
import com.adobe.fiber.styles.StyleValidator;
import com.adobe.fiber.valueobjects.AbstractEntityMetadata;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import mx.events.ValidationResultEvent;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IModelType;
import mx.events.PropertyChangeEvent;

use namespace model_internal;

[ExcludeClass]
internal class _DataReportVOEntityMetadata extends com.adobe.fiber.valueobjects.AbstractEntityMetadata
{
    private static var emptyArray:Array = new Array();

    model_internal static var allProperties:Array = new Array("autoid", "userid", "month", "year", "uniquePatients", "patientsEligible", "prescreens", "validPrescreens", "alcoholPrescreens", "drugPrescreens", "bothPrescreens", "screens", "isNotScreening", "possibleScreens", "screensOfPossible", "educationScores", "biScores", "btScores", "rtScores", "bis", "bts", "rts", "otherComments");
    model_internal static var allAssociationProperties:Array = new Array();
    model_internal static var allRequiredProperties:Array = new Array("autoid", "userid", "month", "year", "uniquePatients", "patientsEligible", "prescreens", "validPrescreens", "alcoholPrescreens", "drugPrescreens", "bothPrescreens", "screens", "isNotScreening", "possibleScreens", "screensOfPossible", "educationScores", "biScores", "btScores", "rtScores", "bis", "bts", "rts", "otherComments");
    model_internal static var allAlwaysAvailableProperties:Array = new Array("autoid", "userid", "month", "year", "uniquePatients", "patientsEligible", "prescreens", "validPrescreens", "alcoholPrescreens", "drugPrescreens", "bothPrescreens", "screens", "isNotScreening", "possibleScreens", "screensOfPossible", "educationScores", "biScores", "btScores", "rtScores", "bis", "bts", "rts", "otherComments");
    model_internal static var guardedProperties:Array = new Array();
    model_internal static var dataProperties:Array = new Array("autoid", "userid", "month", "year", "uniquePatients", "patientsEligible", "prescreens", "validPrescreens", "alcoholPrescreens", "drugPrescreens", "bothPrescreens", "screens", "isNotScreening", "possibleScreens", "screensOfPossible", "educationScores", "biScores", "btScores", "rtScores", "bis", "bts", "rts", "otherComments");
    model_internal static var sourceProperties:Array = emptyArray
    model_internal static var nonDerivedProperties:Array = new Array("autoid", "userid", "month", "year", "uniquePatients", "patientsEligible", "prescreens", "validPrescreens", "alcoholPrescreens", "drugPrescreens", "bothPrescreens", "screens", "isNotScreening", "possibleScreens", "screensOfPossible", "educationScores", "biScores", "btScores", "rtScores", "bis", "bts", "rts", "otherComments");
    model_internal static var derivedProperties:Array = new Array();
    model_internal static var collectionProperties:Array = new Array();
    model_internal static var collectionBaseMap:Object;
    model_internal static var entityName:String = "DataReportVO";
    model_internal static var dependentsOnMap:Object;
    model_internal static var dependedOnServices:Array = new Array();
    model_internal static var propertyTypeMap:Object;

    
    model_internal var _otherCommentsIsValid:Boolean;
    model_internal var _otherCommentsValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _otherCommentsIsValidCacheInitialized:Boolean = false;
    model_internal var _otherCommentsValidationFailureMessages:Array;

    model_internal var _instance:_Super_DataReportVO;
    model_internal static var _nullStyle:com.adobe.fiber.styles.Style = new com.adobe.fiber.styles.Style();

    public function _DataReportVOEntityMetadata(value : _Super_DataReportVO)
    {
        // initialize property maps
        if (model_internal::dependentsOnMap == null)
        {
            // dependents map
            model_internal::dependentsOnMap = new Object();
            model_internal::dependentsOnMap["autoid"] = new Array();
            model_internal::dependentsOnMap["userid"] = new Array();
            model_internal::dependentsOnMap["month"] = new Array();
            model_internal::dependentsOnMap["year"] = new Array();
            model_internal::dependentsOnMap["uniquePatients"] = new Array();
            model_internal::dependentsOnMap["patientsEligible"] = new Array();
            model_internal::dependentsOnMap["prescreens"] = new Array();
            model_internal::dependentsOnMap["validPrescreens"] = new Array();
            model_internal::dependentsOnMap["alcoholPrescreens"] = new Array();
            model_internal::dependentsOnMap["drugPrescreens"] = new Array();
            model_internal::dependentsOnMap["bothPrescreens"] = new Array();
            model_internal::dependentsOnMap["screens"] = new Array();
            model_internal::dependentsOnMap["isNotScreening"] = new Array();
            model_internal::dependentsOnMap["possibleScreens"] = new Array();
            model_internal::dependentsOnMap["screensOfPossible"] = new Array();
            model_internal::dependentsOnMap["educationScores"] = new Array();
            model_internal::dependentsOnMap["biScores"] = new Array();
            model_internal::dependentsOnMap["btScores"] = new Array();
            model_internal::dependentsOnMap["rtScores"] = new Array();
            model_internal::dependentsOnMap["bis"] = new Array();
            model_internal::dependentsOnMap["bts"] = new Array();
            model_internal::dependentsOnMap["rts"] = new Array();
            model_internal::dependentsOnMap["otherComments"] = new Array();

            // collection base map
            model_internal::collectionBaseMap = new Object();
        }

        // Property type Map
        model_internal::propertyTypeMap = new Object();
        model_internal::propertyTypeMap["autoid"] = "int";
        model_internal::propertyTypeMap["userid"] = "int";
        model_internal::propertyTypeMap["month"] = "int";
        model_internal::propertyTypeMap["year"] = "int";
        model_internal::propertyTypeMap["uniquePatients"] = "int";
        model_internal::propertyTypeMap["patientsEligible"] = "int";
        model_internal::propertyTypeMap["prescreens"] = "int";
        model_internal::propertyTypeMap["validPrescreens"] = "int";
        model_internal::propertyTypeMap["alcoholPrescreens"] = "int";
        model_internal::propertyTypeMap["drugPrescreens"] = "int";
        model_internal::propertyTypeMap["bothPrescreens"] = "int";
        model_internal::propertyTypeMap["screens"] = "int";
        model_internal::propertyTypeMap["isNotScreening"] = "int";
        model_internal::propertyTypeMap["possibleScreens"] = "int";
        model_internal::propertyTypeMap["screensOfPossible"] = "int";
        model_internal::propertyTypeMap["educationScores"] = "int";
        model_internal::propertyTypeMap["biScores"] = "int";
        model_internal::propertyTypeMap["btScores"] = "int";
        model_internal::propertyTypeMap["rtScores"] = "int";
        model_internal::propertyTypeMap["bis"] = "int";
        model_internal::propertyTypeMap["bts"] = "int";
        model_internal::propertyTypeMap["rts"] = "int";
        model_internal::propertyTypeMap["otherComments"] = "String";

        model_internal::_instance = value;
        model_internal::_otherCommentsValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForOtherComments);
        model_internal::_otherCommentsValidator.required = true;
        model_internal::_otherCommentsValidator.requiredFieldError = "otherComments is required";
        //model_internal::_otherCommentsValidator.source = model_internal::_instance;
        //model_internal::_otherCommentsValidator.property = "otherComments";
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
            throw new Error(propertyName + " is not a data property of entity DataReportVO");
            
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
            throw new Error(propertyName + " is not a collection property of entity DataReportVO");

        return model_internal::collectionBaseMap[propertyName];
    }
    
    override public function getPropertyType(propertyName:String):String
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a property of DataReportVO");

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
            throw new Error(propertyName + " does not exist for entity DataReportVO");
        }

        return model_internal::_instance[propertyName];
    }

    override public function setValue(propertyName:String, value:*):void
    {
        if (model_internal::nonDerivedProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " is not a modifiable property of entity DataReportVO");
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
            throw new Error(propertyName + " does not exist for entity DataReportVO");
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
    public function get isAutoidAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isUseridAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isMonthAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isYearAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isUniquePatientsAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isPatientsEligibleAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isPrescreensAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isValidPrescreensAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isAlcoholPrescreensAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isDrugPrescreensAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isBothPrescreensAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isScreensAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isIsNotScreeningAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isPossibleScreensAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isScreensOfPossibleAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isEducationScoresAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isBiScoresAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isBtScoresAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isRtScoresAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isBisAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isBtsAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isRtsAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isOtherCommentsAvailable():Boolean
    {
        return true;
    }


    /**
     * derived property recalculation
     */
    public function invalidateDependentOnOtherComments():void
    {
        if (model_internal::_otherCommentsIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfOtherComments = null;
            model_internal::calculateOtherCommentsIsValid();
        }
    }

    model_internal function fireChangeEvent(propertyName:String, oldValue:Object, newValue:Object):void
    {
        this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, propertyName, oldValue, newValue));
    }

    [Bindable(event="propertyChange")]   
    public function get autoidStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get useridStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get monthStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get yearStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get uniquePatientsStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get patientsEligibleStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get prescreensStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get validPrescreensStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get alcoholPrescreensStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get drugPrescreensStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get bothPrescreensStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get screensStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get isNotScreeningStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get possibleScreensStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get screensOfPossibleStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get educationScoresStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get biScoresStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get btScoresStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get rtScoresStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get bisStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get btsStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get rtsStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get otherCommentsStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get otherCommentsValidator() : StyleValidator
    {
        return model_internal::_otherCommentsValidator;
    }

    model_internal function set _otherCommentsIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_otherCommentsIsValid;         
        if (oldValue !== value)
        {
            model_internal::_otherCommentsIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "otherCommentsIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get otherCommentsIsValid():Boolean
    {
        if (!model_internal::_otherCommentsIsValidCacheInitialized)
        {
            model_internal::calculateOtherCommentsIsValid();
        }

        return model_internal::_otherCommentsIsValid;
    }

    model_internal function calculateOtherCommentsIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_otherCommentsValidator.validate(model_internal::_instance.otherComments)
        model_internal::_otherCommentsIsValid_der = (valRes.results == null);
        model_internal::_otherCommentsIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::otherCommentsValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::otherCommentsValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get otherCommentsValidationFailureMessages():Array
    {
        if (model_internal::_otherCommentsValidationFailureMessages == null)
            model_internal::calculateOtherCommentsIsValid();

        return _otherCommentsValidationFailureMessages;
    }

    model_internal function set otherCommentsValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_otherCommentsValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_otherCommentsValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "otherCommentsValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
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
            case("otherComments"):
            {
                return otherCommentsValidationFailureMessages;
            }
            default:
            {
                return emptyArray;
            }
         }
     }

}

}
