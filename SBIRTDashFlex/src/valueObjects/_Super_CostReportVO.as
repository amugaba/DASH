/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - CostReportVO.as.
 */

package valueObjects
{
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.valueobjects.IValueObject;
import flash.events.EventDispatcher;
import mx.collections.ArrayCollection;
import mx.events.PropertyChangeEvent;

import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

use namespace model_internal;

[ExcludeClass]
public class _Super_CostReportVO extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
        try
        {
            if (flash.net.getClassByAlias("CostReportVO") == null)
            {
                flash.net.registerClassAlias("CostReportVO", cz);
            }
        }
        catch (e:Error)
        {
            flash.net.registerClassAlias("CostReportVO", cz);
        }
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
    }

    model_internal var _dminternal_model : _CostReportVOEntityMetadata;
    model_internal var _changedObjects:mx.collections.ArrayCollection = new ArrayCollection();

    public function getChangedObjects() : Array
    {
        _changedObjects.addItemAt(this,0);
        return _changedObjects.source;
    }

    public function clearChangedObjects() : void
    {
        _changedObjects.removeAll();
    }

    /**
     * properties
     */
    private var _internal_workloadPrescreen : Object;
    private var _internal_educationTime : Number;
    private var _internal_otherTime : Number;
    private var _internal_workloadRT : Object;
    private var _internal_otherCost : Number;
    private var _internal_userid : int;
    private var _internal_autoid : int;
    private var _internal_workloadTraining : Object;
    private var _internal_trainingTime : Number;
    private var _internal_year : int;
    private var _internal_workloadAdmin : Object;
    private var _internal_facilityPercent : Number;
    private var _internal_supplies : Number;
    private var _internal_biTime : Number;
    private var _internal_workloadOther : Object;
    private var _internal_workloadBI : Object;
    private var _internal_otherCostSpec : String;
    private var _internal_workloadSupport : Object;
    private var _internal_adminTime : Number;
    private var _internal_otherTimeSpec : String;
    private var _internal_workloadScreen : Object;
    private var _internal_tech : Number;
    private var _internal_screenTime : Number;
    private var _internal_salaries : Object;
    private var _internal_workloadEducation : Object;
    private var _internal_supportTime : Number;
    private var _internal_month : int;
    private var _internal_rtTime : Number;
    private var _internal_dataReportID : int;
    private var _internal_prescreenTime : Number;
    private var _internal_facilityCost : Number;
    private var _internal_comments : String;

    private static var emptyArray:Array = new Array();

    // Change this value according to your application's floating-point precision
    private static var epsilon:Number = 0.0001;

    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_CostReportVO()
    {
        _model = new _CostReportVOEntityMetadata(this);

        // Bind to own data or source properties for cache invalidation triggering

    }

    /**
     * data/source property getters
     */

    [Bindable(event="propertyChange")]
    public function get workloadPrescreen() : Object
    {
        return _internal_workloadPrescreen;
    }

    [Bindable(event="propertyChange")]
    public function get educationTime() : Number
    {
        return _internal_educationTime;
    }

    [Bindable(event="propertyChange")]
    public function get otherTime() : Number
    {
        return _internal_otherTime;
    }

    [Bindable(event="propertyChange")]
    public function get workloadRT() : Object
    {
        return _internal_workloadRT;
    }

    [Bindable(event="propertyChange")]
    public function get otherCost() : Number
    {
        return _internal_otherCost;
    }

    [Bindable(event="propertyChange")]
    public function get userid() : int
    {
        return _internal_userid;
    }

    [Bindable(event="propertyChange")]
    public function get autoid() : int
    {
        return _internal_autoid;
    }

    [Bindable(event="propertyChange")]
    public function get workloadTraining() : Object
    {
        return _internal_workloadTraining;
    }

    [Bindable(event="propertyChange")]
    public function get trainingTime() : Number
    {
        return _internal_trainingTime;
    }

    [Bindable(event="propertyChange")]
    public function get year() : int
    {
        return _internal_year;
    }

    [Bindable(event="propertyChange")]
    public function get workloadAdmin() : Object
    {
        return _internal_workloadAdmin;
    }

    [Bindable(event="propertyChange")]
    public function get facilityPercent() : Number
    {
        return _internal_facilityPercent;
    }

    [Bindable(event="propertyChange")]
    public function get supplies() : Number
    {
        return _internal_supplies;
    }

    [Bindable(event="propertyChange")]
    public function get biTime() : Number
    {
        return _internal_biTime;
    }

    [Bindable(event="propertyChange")]
    public function get workloadOther() : Object
    {
        return _internal_workloadOther;
    }

    [Bindable(event="propertyChange")]
    public function get workloadBI() : Object
    {
        return _internal_workloadBI;
    }

    [Bindable(event="propertyChange")]
    public function get otherCostSpec() : String
    {
        return _internal_otherCostSpec;
    }

    [Bindable(event="propertyChange")]
    public function get workloadSupport() : Object
    {
        return _internal_workloadSupport;
    }

    [Bindable(event="propertyChange")]
    public function get adminTime() : Number
    {
        return _internal_adminTime;
    }

    [Bindable(event="propertyChange")]
    public function get otherTimeSpec() : String
    {
        return _internal_otherTimeSpec;
    }

    [Bindable(event="propertyChange")]
    public function get workloadScreen() : Object
    {
        return _internal_workloadScreen;
    }

    [Bindable(event="propertyChange")]
    public function get tech() : Number
    {
        return _internal_tech;
    }

    [Bindable(event="propertyChange")]
    public function get screenTime() : Number
    {
        return _internal_screenTime;
    }

    [Bindable(event="propertyChange")]
    public function get salaries() : Object
    {
        return _internal_salaries;
    }

    [Bindable(event="propertyChange")]
    public function get workloadEducation() : Object
    {
        return _internal_workloadEducation;
    }

    [Bindable(event="propertyChange")]
    public function get supportTime() : Number
    {
        return _internal_supportTime;
    }

    [Bindable(event="propertyChange")]
    public function get month() : int
    {
        return _internal_month;
    }

    [Bindable(event="propertyChange")]
    public function get rtTime() : Number
    {
        return _internal_rtTime;
    }

    [Bindable(event="propertyChange")]
    public function get dataReportID() : int
    {
        return _internal_dataReportID;
    }

    [Bindable(event="propertyChange")]
    public function get prescreenTime() : Number
    {
        return _internal_prescreenTime;
    }

    [Bindable(event="propertyChange")]
    public function get facilityCost() : Number
    {
        return _internal_facilityCost;
    }

    [Bindable(event="propertyChange")]
    public function get comments() : String
    {
        return _internal_comments;
    }

    public function clearAssociations() : void
    {
    }

    /**
     * data/source property setters
     */

    public function set workloadPrescreen(value:Object) : void
    {
        var oldValue:Object = _internal_workloadPrescreen;
        if (oldValue !== value)
        {
            _internal_workloadPrescreen = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "workloadPrescreen", oldValue, _internal_workloadPrescreen));
        }
    }

    public function set educationTime(value:Number) : void
    {
        var oldValue:Number = _internal_educationTime;
        if (isNaN(_internal_educationTime) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_educationTime = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "educationTime", oldValue, _internal_educationTime));
        }
    }

    public function set otherTime(value:Number) : void
    {
        var oldValue:Number = _internal_otherTime;
        if (isNaN(_internal_otherTime) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_otherTime = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "otherTime", oldValue, _internal_otherTime));
        }
    }

    public function set workloadRT(value:Object) : void
    {
        var oldValue:Object = _internal_workloadRT;
        if (oldValue !== value)
        {
            _internal_workloadRT = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "workloadRT", oldValue, _internal_workloadRT));
        }
    }

    public function set otherCost(value:Number) : void
    {
        var oldValue:Number = _internal_otherCost;
        if (isNaN(_internal_otherCost) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_otherCost = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "otherCost", oldValue, _internal_otherCost));
        }
    }

    public function set userid(value:int) : void
    {
        var oldValue:int = _internal_userid;
        if (oldValue !== value)
        {
            _internal_userid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "userid", oldValue, _internal_userid));
        }
    }

    public function set autoid(value:int) : void
    {
        var oldValue:int = _internal_autoid;
        if (oldValue !== value)
        {
            _internal_autoid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "autoid", oldValue, _internal_autoid));
        }
    }

    public function set workloadTraining(value:Object) : void
    {
        var oldValue:Object = _internal_workloadTraining;
        if (oldValue !== value)
        {
            _internal_workloadTraining = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "workloadTraining", oldValue, _internal_workloadTraining));
        }
    }

    public function set trainingTime(value:Number) : void
    {
        var oldValue:Number = _internal_trainingTime;
        if (isNaN(_internal_trainingTime) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_trainingTime = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "trainingTime", oldValue, _internal_trainingTime));
        }
    }

    public function set year(value:int) : void
    {
        var oldValue:int = _internal_year;
        if (oldValue !== value)
        {
            _internal_year = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "year", oldValue, _internal_year));
        }
    }

    public function set workloadAdmin(value:Object) : void
    {
        var oldValue:Object = _internal_workloadAdmin;
        if (oldValue !== value)
        {
            _internal_workloadAdmin = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "workloadAdmin", oldValue, _internal_workloadAdmin));
        }
    }

    public function set facilityPercent(value:Number) : void
    {
        var oldValue:Number = _internal_facilityPercent;
        if (isNaN(_internal_facilityPercent) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_facilityPercent = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "facilityPercent", oldValue, _internal_facilityPercent));
        }
    }

    public function set supplies(value:Number) : void
    {
        var oldValue:Number = _internal_supplies;
        if (isNaN(_internal_supplies) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_supplies = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "supplies", oldValue, _internal_supplies));
        }
    }

    public function set biTime(value:Number) : void
    {
        var oldValue:Number = _internal_biTime;
        if (isNaN(_internal_biTime) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_biTime = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "biTime", oldValue, _internal_biTime));
        }
    }

    public function set workloadOther(value:Object) : void
    {
        var oldValue:Object = _internal_workloadOther;
        if (oldValue !== value)
        {
            _internal_workloadOther = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "workloadOther", oldValue, _internal_workloadOther));
        }
    }

    public function set workloadBI(value:Object) : void
    {
        var oldValue:Object = _internal_workloadBI;
        if (oldValue !== value)
        {
            _internal_workloadBI = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "workloadBI", oldValue, _internal_workloadBI));
        }
    }

    public function set otherCostSpec(value:String) : void
    {
        var oldValue:String = _internal_otherCostSpec;
        if (oldValue !== value)
        {
            _internal_otherCostSpec = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "otherCostSpec", oldValue, _internal_otherCostSpec));
        }
    }

    public function set workloadSupport(value:Object) : void
    {
        var oldValue:Object = _internal_workloadSupport;
        if (oldValue !== value)
        {
            _internal_workloadSupport = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "workloadSupport", oldValue, _internal_workloadSupport));
        }
    }

    public function set adminTime(value:Number) : void
    {
        var oldValue:Number = _internal_adminTime;
        if (isNaN(_internal_adminTime) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_adminTime = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "adminTime", oldValue, _internal_adminTime));
        }
    }

    public function set otherTimeSpec(value:String) : void
    {
        var oldValue:String = _internal_otherTimeSpec;
        if (oldValue !== value)
        {
            _internal_otherTimeSpec = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "otherTimeSpec", oldValue, _internal_otherTimeSpec));
        }
    }

    public function set workloadScreen(value:Object) : void
    {
        var oldValue:Object = _internal_workloadScreen;
        if (oldValue !== value)
        {
            _internal_workloadScreen = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "workloadScreen", oldValue, _internal_workloadScreen));
        }
    }

    public function set tech(value:Number) : void
    {
        var oldValue:Number = _internal_tech;
        if (isNaN(_internal_tech) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_tech = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "tech", oldValue, _internal_tech));
        }
    }

    public function set screenTime(value:Number) : void
    {
        var oldValue:Number = _internal_screenTime;
        if (isNaN(_internal_screenTime) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_screenTime = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "screenTime", oldValue, _internal_screenTime));
        }
    }

    public function set salaries(value:Object) : void
    {
        var oldValue:Object = _internal_salaries;
        if (oldValue !== value)
        {
            _internal_salaries = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "salaries", oldValue, _internal_salaries));
        }
    }

    public function set workloadEducation(value:Object) : void
    {
        var oldValue:Object = _internal_workloadEducation;
        if (oldValue !== value)
        {
            _internal_workloadEducation = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "workloadEducation", oldValue, _internal_workloadEducation));
        }
    }

    public function set supportTime(value:Number) : void
    {
        var oldValue:Number = _internal_supportTime;
        if (isNaN(_internal_supportTime) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_supportTime = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "supportTime", oldValue, _internal_supportTime));
        }
    }

    public function set month(value:int) : void
    {
        var oldValue:int = _internal_month;
        if (oldValue !== value)
        {
            _internal_month = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "month", oldValue, _internal_month));
        }
    }

    public function set rtTime(value:Number) : void
    {
        var oldValue:Number = _internal_rtTime;
        if (isNaN(_internal_rtTime) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_rtTime = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "rtTime", oldValue, _internal_rtTime));
        }
    }

    public function set dataReportID(value:int) : void
    {
        var oldValue:int = _internal_dataReportID;
        if (oldValue !== value)
        {
            _internal_dataReportID = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dataReportID", oldValue, _internal_dataReportID));
        }
    }

    public function set prescreenTime(value:Number) : void
    {
        var oldValue:Number = _internal_prescreenTime;
        if (isNaN(_internal_prescreenTime) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_prescreenTime = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "prescreenTime", oldValue, _internal_prescreenTime));
        }
    }

    public function set facilityCost(value:Number) : void
    {
        var oldValue:Number = _internal_facilityCost;
        if (isNaN(_internal_facilityCost) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_facilityCost = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "facilityCost", oldValue, _internal_facilityCost));
        }
    }

    public function set comments(value:String) : void
    {
        var oldValue:String = _internal_comments;
        if (oldValue !== value)
        {
            _internal_comments = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "comments", oldValue, _internal_comments));
        }
    }

    /**
     * Data/source property setter listeners
     *
     * Each data property whose value affects other properties or the validity of the entity
     * needs to invalidate all previously calculated artifacts. These include:
     *  - any derived properties or constraints that reference the given data property.
     *  - any availability guards (variant expressions) that reference the given data property.
     *  - any style validations, message tokens or guards that reference the given data property.
     *  - the validity of the property (and the containing entity) if the given data property has a length restriction.
     *  - the validity of the property (and the containing entity) if the given data property is required.
     */


    /**
     * valid related derived properties
     */
    model_internal var _isValid : Boolean;
    model_internal var _invalidConstraints:Array = new Array();
    model_internal var _validationFailureMessages:Array = new Array();

    /**
     * derived property calculators
     */

    /**
     * isValid calculator
     */
    model_internal function calculateIsValid():Boolean
    {
        var violatedConsts:Array = new Array();
        var validationFailureMessages:Array = new Array();

        var propertyValidity:Boolean = true;

        model_internal::_cacheInitialized_isValid = true;
        model_internal::invalidConstraints_der = violatedConsts;
        model_internal::validationFailureMessages_der = validationFailureMessages;
        return violatedConsts.length == 0 && propertyValidity;
    }

    /**
     * derived property setters
     */

    model_internal function set isValid_der(value:Boolean) : void
    {
        var oldValue:Boolean = model_internal::_isValid;
        if (oldValue !== value)
        {
            model_internal::_isValid = value;
            _model.model_internal::fireChangeEvent("isValid", oldValue, model_internal::_isValid);
        }
    }

    /**
     * derived property getters
     */

    [Transient]
    [Bindable(event="propertyChange")]
    public function get _model() : _CostReportVOEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _CostReportVOEntityMetadata) : void
    {
        var oldValue : _CostReportVOEntityMetadata = model_internal::_dminternal_model;
        if (oldValue !== value)
        {
            model_internal::_dminternal_model = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_model", oldValue, model_internal::_dminternal_model));
        }
    }

    /**
     * methods
     */


    /**
     *  services
     */
    private var _managingService:com.adobe.fiber.services.IFiberManagingService;

    public function set managingService(managingService:com.adobe.fiber.services.IFiberManagingService):void
    {
        _managingService = managingService;
    }

    model_internal function set invalidConstraints_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_invalidConstraints;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_invalidConstraints = value;
            _model.model_internal::fireChangeEvent("invalidConstraints", oldValue, model_internal::_invalidConstraints);
        }
    }

    model_internal function set validationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_validationFailureMessages;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_validationFailureMessages = value;
            _model.model_internal::fireChangeEvent("validationFailureMessages", oldValue, model_internal::_validationFailureMessages);
        }
    }


}

}
