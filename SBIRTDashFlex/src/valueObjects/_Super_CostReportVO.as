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
    private var _internal_autoid : int;
    private var _internal_userid : int;
    private var _internal_dataReportID : int;
    private var _internal_salaries : ArrayCollection;
    private var _internal_prescreenTime : int;
    private var _internal_screenTime : int;
    private var _internal_educationTime : int;
    private var _internal_biTime : int;
    private var _internal_rtTime : int;
    private var _internal_adminTime : int;
    private var _internal_trainingTime : int;
    private var _internal_supportTime : int;
    private var _internal_otherTime : int;
    private var _internal_otherTimeSpec : String;
    private var _internal_workloadPrescreen : ArrayCollection;
    private var _internal_workloadScreen : ArrayCollection;
    private var _internal_workloadEducation : ArrayCollection;
    private var _internal_workloadBI : ArrayCollection;
    private var _internal_workloadRT : ArrayCollection;
    private var _internal_workloadAdmin : ArrayCollection;
    private var _internal_workloadTraining : ArrayCollection;
    private var _internal_workloadSupport : ArrayCollection;
    private var _internal_workloadOther : ArrayCollection;
    private var _internal_tech : int;
    private var _internal_supplies : int;
    private var _internal_otherCost : int;
    private var _internal_otherCostSpec : String;
    private var _internal_facilityCost : int;
    private var _internal_facilityPercent : int;
    private var _internal_prescreenTotal : int;
    private var _internal_screenTotal : int;
    private var _internal_educationTotal : int;
    private var _internal_biTotal : int;
    private var _internal_rtTotal : int;
    private var _internal_adminTotal : int;
    private var _internal_trainingTotal : int;
    private var _internal_supportTotal : int;
    private var _internal_otherTotal : int;
    private var _internal_serviceTotal : int;
    private var _internal_nonserviceTotal : int;
    private var _internal_expenseTotal : int;
    private var _internal_grandTotal : int;
    private var _internal_perPatientCost : int;
    private var _internal_comments : String;

    private static var emptyArray:Array = new Array();


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
    public function get autoid() : int
    {
        return _internal_autoid;
    }

    [Bindable(event="propertyChange")]
    public function get userid() : int
    {
        return _internal_userid;
    }

    [Bindable(event="propertyChange")]
    public function get dataReportID() : int
    {
        return _internal_dataReportID;
    }

    [Bindable(event="propertyChange")]
    public function get salaries() : ArrayCollection
    {
        return _internal_salaries;
    }

    [Bindable(event="propertyChange")]
    public function get prescreenTime() : int
    {
        return _internal_prescreenTime;
    }

    [Bindable(event="propertyChange")]
    public function get screenTime() : int
    {
        return _internal_screenTime;
    }

    [Bindable(event="propertyChange")]
    public function get educationTime() : int
    {
        return _internal_educationTime;
    }

    [Bindable(event="propertyChange")]
    public function get biTime() : int
    {
        return _internal_biTime;
    }

    [Bindable(event="propertyChange")]
    public function get rtTime() : int
    {
        return _internal_rtTime;
    }

    [Bindable(event="propertyChange")]
    public function get adminTime() : int
    {
        return _internal_adminTime;
    }

    [Bindable(event="propertyChange")]
    public function get trainingTime() : int
    {
        return _internal_trainingTime;
    }

    [Bindable(event="propertyChange")]
    public function get supportTime() : int
    {
        return _internal_supportTime;
    }

    [Bindable(event="propertyChange")]
    public function get otherTime() : int
    {
        return _internal_otherTime;
    }

    [Bindable(event="propertyChange")]
    public function get otherTimeSpec() : String
    {
        return _internal_otherTimeSpec;
    }

    [Bindable(event="propertyChange")]
    public function get workloadPrescreen() : ArrayCollection
    {
        return _internal_workloadPrescreen;
    }

    [Bindable(event="propertyChange")]
    public function get workloadScreen() : ArrayCollection
    {
        return _internal_workloadScreen;
    }

    [Bindable(event="propertyChange")]
    public function get workloadEducation() : ArrayCollection
    {
        return _internal_workloadEducation;
    }

    [Bindable(event="propertyChange")]
    public function get workloadBI() : ArrayCollection
    {
        return _internal_workloadBI;
    }

    [Bindable(event="propertyChange")]
    public function get workloadRT() : ArrayCollection
    {
        return _internal_workloadRT;
    }

    [Bindable(event="propertyChange")]
    public function get workloadAdmin() : ArrayCollection
    {
        return _internal_workloadAdmin;
    }

    [Bindable(event="propertyChange")]
    public function get workloadTraining() : ArrayCollection
    {
        return _internal_workloadTraining;
    }

    [Bindable(event="propertyChange")]
    public function get workloadSupport() : ArrayCollection
    {
        return _internal_workloadSupport;
    }

    [Bindable(event="propertyChange")]
    public function get workloadOther() : ArrayCollection
    {
        return _internal_workloadOther;
    }

    [Bindable(event="propertyChange")]
    public function get tech() : int
    {
        return _internal_tech;
    }

    [Bindable(event="propertyChange")]
    public function get supplies() : int
    {
        return _internal_supplies;
    }

    [Bindable(event="propertyChange")]
    public function get otherCost() : int
    {
        return _internal_otherCost;
    }

    [Bindable(event="propertyChange")]
    public function get otherCostSpec() : String
    {
        return _internal_otherCostSpec;
    }

    [Bindable(event="propertyChange")]
    public function get facilityCost() : int
    {
        return _internal_facilityCost;
    }

    [Bindable(event="propertyChange")]
    public function get facilityPercent() : int
    {
        return _internal_facilityPercent;
    }

    [Bindable(event="propertyChange")]
    public function get prescreenTotal() : int
    {
        return _internal_prescreenTotal;
    }

    [Bindable(event="propertyChange")]
    public function get screenTotal() : int
    {
        return _internal_screenTotal;
    }

    [Bindable(event="propertyChange")]
    public function get educationTotal() : int
    {
        return _internal_educationTotal;
    }

    [Bindable(event="propertyChange")]
    public function get biTotal() : int
    {
        return _internal_biTotal;
    }

    [Bindable(event="propertyChange")]
    public function get rtTotal() : int
    {
        return _internal_rtTotal;
    }

    [Bindable(event="propertyChange")]
    public function get adminTotal() : int
    {
        return _internal_adminTotal;
    }

    [Bindable(event="propertyChange")]
    public function get trainingTotal() : int
    {
        return _internal_trainingTotal;
    }

    [Bindable(event="propertyChange")]
    public function get supportTotal() : int
    {
        return _internal_supportTotal;
    }

    [Bindable(event="propertyChange")]
    public function get otherTotal() : int
    {
        return _internal_otherTotal;
    }

    [Bindable(event="propertyChange")]
    public function get serviceTotal() : int
    {
        return _internal_serviceTotal;
    }

    [Bindable(event="propertyChange")]
    public function get nonserviceTotal() : int
    {
        return _internal_nonserviceTotal;
    }

    [Bindable(event="propertyChange")]
    public function get expenseTotal() : int
    {
        return _internal_expenseTotal;
    }

    [Bindable(event="propertyChange")]
    public function get grandTotal() : int
    {
        return _internal_grandTotal;
    }

    [Bindable(event="propertyChange")]
    public function get perPatientCost() : int
    {
        return _internal_perPatientCost;
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

    public function set autoid(value:int) : void
    {
        var oldValue:int = _internal_autoid;
        if (oldValue !== value)
        {
            _internal_autoid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "autoid", oldValue, _internal_autoid));
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

    public function set dataReportID(value:int) : void
    {
        var oldValue:int = _internal_dataReportID;
        if (oldValue !== value)
        {
            _internal_dataReportID = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dataReportID", oldValue, _internal_dataReportID));
        }
    }

    public function set salaries(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_salaries;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_salaries = value;
            }
            else if (value is Array)
            {
                _internal_salaries = new ArrayCollection(value);
            }
            else if (value == null)
            {
                _internal_salaries = null;
            }
            else
            {
                throw new Error("value of salaries must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "salaries", oldValue, _internal_salaries));
        }
    }

    public function set prescreenTime(value:int) : void
    {
        var oldValue:int = _internal_prescreenTime;
        if (oldValue !== value)
        {
            _internal_prescreenTime = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "prescreenTime", oldValue, _internal_prescreenTime));
        }
    }

    public function set screenTime(value:int) : void
    {
        var oldValue:int = _internal_screenTime;
        if (oldValue !== value)
        {
            _internal_screenTime = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "screenTime", oldValue, _internal_screenTime));
        }
    }

    public function set educationTime(value:int) : void
    {
        var oldValue:int = _internal_educationTime;
        if (oldValue !== value)
        {
            _internal_educationTime = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "educationTime", oldValue, _internal_educationTime));
        }
    }

    public function set biTime(value:int) : void
    {
        var oldValue:int = _internal_biTime;
        if (oldValue !== value)
        {
            _internal_biTime = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "biTime", oldValue, _internal_biTime));
        }
    }

    public function set rtTime(value:int) : void
    {
        var oldValue:int = _internal_rtTime;
        if (oldValue !== value)
        {
            _internal_rtTime = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "rtTime", oldValue, _internal_rtTime));
        }
    }

    public function set adminTime(value:int) : void
    {
        var oldValue:int = _internal_adminTime;
        if (oldValue !== value)
        {
            _internal_adminTime = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "adminTime", oldValue, _internal_adminTime));
        }
    }

    public function set trainingTime(value:int) : void
    {
        var oldValue:int = _internal_trainingTime;
        if (oldValue !== value)
        {
            _internal_trainingTime = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "trainingTime", oldValue, _internal_trainingTime));
        }
    }

    public function set supportTime(value:int) : void
    {
        var oldValue:int = _internal_supportTime;
        if (oldValue !== value)
        {
            _internal_supportTime = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "supportTime", oldValue, _internal_supportTime));
        }
    }

    public function set otherTime(value:int) : void
    {
        var oldValue:int = _internal_otherTime;
        if (oldValue !== value)
        {
            _internal_otherTime = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "otherTime", oldValue, _internal_otherTime));
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

    public function set workloadPrescreen(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_workloadPrescreen;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_workloadPrescreen = value;
            }
            else if (value is Array)
            {
                _internal_workloadPrescreen = new ArrayCollection(value);
            }
            else if (value == null)
            {
                _internal_workloadPrescreen = null;
            }
            else
            {
                throw new Error("value of workloadPrescreen must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "workloadPrescreen", oldValue, _internal_workloadPrescreen));
        }
    }

    public function set workloadScreen(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_workloadScreen;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_workloadScreen = value;
            }
            else if (value is Array)
            {
                _internal_workloadScreen = new ArrayCollection(value);
            }
            else if (value == null)
            {
                _internal_workloadScreen = null;
            }
            else
            {
                throw new Error("value of workloadScreen must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "workloadScreen", oldValue, _internal_workloadScreen));
        }
    }

    public function set workloadEducation(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_workloadEducation;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_workloadEducation = value;
            }
            else if (value is Array)
            {
                _internal_workloadEducation = new ArrayCollection(value);
            }
            else if (value == null)
            {
                _internal_workloadEducation = null;
            }
            else
            {
                throw new Error("value of workloadEducation must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "workloadEducation", oldValue, _internal_workloadEducation));
        }
    }

    public function set workloadBI(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_workloadBI;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_workloadBI = value;
            }
            else if (value is Array)
            {
                _internal_workloadBI = new ArrayCollection(value);
            }
            else if (value == null)
            {
                _internal_workloadBI = null;
            }
            else
            {
                throw new Error("value of workloadBI must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "workloadBI", oldValue, _internal_workloadBI));
        }
    }

    public function set workloadRT(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_workloadRT;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_workloadRT = value;
            }
            else if (value is Array)
            {
                _internal_workloadRT = new ArrayCollection(value);
            }
            else if (value == null)
            {
                _internal_workloadRT = null;
            }
            else
            {
                throw new Error("value of workloadRT must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "workloadRT", oldValue, _internal_workloadRT));
        }
    }

    public function set workloadAdmin(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_workloadAdmin;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_workloadAdmin = value;
            }
            else if (value is Array)
            {
                _internal_workloadAdmin = new ArrayCollection(value);
            }
            else if (value == null)
            {
                _internal_workloadAdmin = null;
            }
            else
            {
                throw new Error("value of workloadAdmin must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "workloadAdmin", oldValue, _internal_workloadAdmin));
        }
    }

    public function set workloadTraining(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_workloadTraining;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_workloadTraining = value;
            }
            else if (value is Array)
            {
                _internal_workloadTraining = new ArrayCollection(value);
            }
            else if (value == null)
            {
                _internal_workloadTraining = null;
            }
            else
            {
                throw new Error("value of workloadTraining must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "workloadTraining", oldValue, _internal_workloadTraining));
        }
    }

    public function set workloadSupport(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_workloadSupport;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_workloadSupport = value;
            }
            else if (value is Array)
            {
                _internal_workloadSupport = new ArrayCollection(value);
            }
            else if (value == null)
            {
                _internal_workloadSupport = null;
            }
            else
            {
                throw new Error("value of workloadSupport must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "workloadSupport", oldValue, _internal_workloadSupport));
        }
    }

    public function set workloadOther(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_workloadOther;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_workloadOther = value;
            }
            else if (value is Array)
            {
                _internal_workloadOther = new ArrayCollection(value);
            }
            else if (value == null)
            {
                _internal_workloadOther = null;
            }
            else
            {
                throw new Error("value of workloadOther must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "workloadOther", oldValue, _internal_workloadOther));
        }
    }

    public function set tech(value:int) : void
    {
        var oldValue:int = _internal_tech;
        if (oldValue !== value)
        {
            _internal_tech = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "tech", oldValue, _internal_tech));
        }
    }

    public function set supplies(value:int) : void
    {
        var oldValue:int = _internal_supplies;
        if (oldValue !== value)
        {
            _internal_supplies = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "supplies", oldValue, _internal_supplies));
        }
    }

    public function set otherCost(value:int) : void
    {
        var oldValue:int = _internal_otherCost;
        if (oldValue !== value)
        {
            _internal_otherCost = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "otherCost", oldValue, _internal_otherCost));
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

    public function set facilityCost(value:int) : void
    {
        var oldValue:int = _internal_facilityCost;
        if (oldValue !== value)
        {
            _internal_facilityCost = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "facilityCost", oldValue, _internal_facilityCost));
        }
    }

    public function set facilityPercent(value:int) : void
    {
        var oldValue:int = _internal_facilityPercent;
        if (oldValue !== value)
        {
            _internal_facilityPercent = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "facilityPercent", oldValue, _internal_facilityPercent));
        }
    }

    public function set prescreenTotal(value:int) : void
    {
        var oldValue:int = _internal_prescreenTotal;
        if (oldValue !== value)
        {
            _internal_prescreenTotal = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "prescreenTotal", oldValue, _internal_prescreenTotal));
        }
    }

    public function set screenTotal(value:int) : void
    {
        var oldValue:int = _internal_screenTotal;
        if (oldValue !== value)
        {
            _internal_screenTotal = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "screenTotal", oldValue, _internal_screenTotal));
        }
    }

    public function set educationTotal(value:int) : void
    {
        var oldValue:int = _internal_educationTotal;
        if (oldValue !== value)
        {
            _internal_educationTotal = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "educationTotal", oldValue, _internal_educationTotal));
        }
    }

    public function set biTotal(value:int) : void
    {
        var oldValue:int = _internal_biTotal;
        if (oldValue !== value)
        {
            _internal_biTotal = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "biTotal", oldValue, _internal_biTotal));
        }
    }

    public function set rtTotal(value:int) : void
    {
        var oldValue:int = _internal_rtTotal;
        if (oldValue !== value)
        {
            _internal_rtTotal = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "rtTotal", oldValue, _internal_rtTotal));
        }
    }

    public function set adminTotal(value:int) : void
    {
        var oldValue:int = _internal_adminTotal;
        if (oldValue !== value)
        {
            _internal_adminTotal = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "adminTotal", oldValue, _internal_adminTotal));
        }
    }

    public function set trainingTotal(value:int) : void
    {
        var oldValue:int = _internal_trainingTotal;
        if (oldValue !== value)
        {
            _internal_trainingTotal = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "trainingTotal", oldValue, _internal_trainingTotal));
        }
    }

    public function set supportTotal(value:int) : void
    {
        var oldValue:int = _internal_supportTotal;
        if (oldValue !== value)
        {
            _internal_supportTotal = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "supportTotal", oldValue, _internal_supportTotal));
        }
    }

    public function set otherTotal(value:int) : void
    {
        var oldValue:int = _internal_otherTotal;
        if (oldValue !== value)
        {
            _internal_otherTotal = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "otherTotal", oldValue, _internal_otherTotal));
        }
    }

    public function set serviceTotal(value:int) : void
    {
        var oldValue:int = _internal_serviceTotal;
        if (oldValue !== value)
        {
            _internal_serviceTotal = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "serviceTotal", oldValue, _internal_serviceTotal));
        }
    }

    public function set nonserviceTotal(value:int) : void
    {
        var oldValue:int = _internal_nonserviceTotal;
        if (oldValue !== value)
        {
            _internal_nonserviceTotal = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "nonserviceTotal", oldValue, _internal_nonserviceTotal));
        }
    }

    public function set expenseTotal(value:int) : void
    {
        var oldValue:int = _internal_expenseTotal;
        if (oldValue !== value)
        {
            _internal_expenseTotal = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "expenseTotal", oldValue, _internal_expenseTotal));
        }
    }

    public function set grandTotal(value:int) : void
    {
        var oldValue:int = _internal_grandTotal;
        if (oldValue !== value)
        {
            _internal_grandTotal = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "grandTotal", oldValue, _internal_grandTotal));
        }
    }

    public function set perPatientCost(value:int) : void
    {
        var oldValue:int = _internal_perPatientCost;
        if (oldValue !== value)
        {
            _internal_perPatientCost = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "perPatientCost", oldValue, _internal_perPatientCost));
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
