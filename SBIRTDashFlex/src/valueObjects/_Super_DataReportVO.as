/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - DataReportVO.as.
 */

package valueObjects
{
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.util.FiberUtils;
import com.adobe.fiber.valueobjects.IValueObject;
import flash.events.Event;
import flash.events.EventDispatcher;
import mx.binding.utils.ChangeWatcher;
import mx.collections.ArrayCollection;
import mx.events.PropertyChangeEvent;
import mx.validators.ValidationResult;

import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

use namespace model_internal;

[ExcludeClass]
public class _Super_DataReportVO extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
        try
        {
            if (flash.net.getClassByAlias("DataReportVO") == null)
            {
                flash.net.registerClassAlias("DataReportVO", cz);
            }
        }
        catch (e:Error)
        {
            flash.net.registerClassAlias("DataReportVO", cz);
        }
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
    }

    model_internal var _dminternal_model : _DataReportVOEntityMetadata;
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
    private var _internal_month : int;
    private var _internal_year : int;
    private var _internal_uniquePatients : int;
    private var _internal_patientsEligible : int;
    private var _internal_prescreens : int;
    private var _internal_validPrescreens : int;
    private var _internal_alcoholPrescreens : int;
    private var _internal_drugPrescreens : int;
    private var _internal_bothPrescreens : int;
    private var _internal_screens : int;
    private var _internal_isNotScreening : int;
    private var _internal_possibleScreens : int;
    private var _internal_screensOfPossible : int;
    private var _internal_educationScores : int;
    private var _internal_biScores : int;
    private var _internal_btScores : int;
    private var _internal_rtScores : int;
    private var _internal_bis : int;
    private var _internal_bts : int;
    private var _internal_rts : int;
    private var _internal_otherComments : String;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_DataReportVO()
    {
        _model = new _DataReportVOEntityMetadata(this);

        // Bind to own data or source properties for cache invalidation triggering
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "otherComments", model_internal::setterListenerOtherComments));

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
    public function get month() : int
    {
        return _internal_month;
    }

    [Bindable(event="propertyChange")]
    public function get year() : int
    {
        return _internal_year;
    }

    [Bindable(event="propertyChange")]
    public function get uniquePatients() : int
    {
        return _internal_uniquePatients;
    }

    [Bindable(event="propertyChange")]
    public function get patientsEligible() : int
    {
        return _internal_patientsEligible;
    }

    [Bindable(event="propertyChange")]
    public function get prescreens() : int
    {
        return _internal_prescreens;
    }

    [Bindable(event="propertyChange")]
    public function get validPrescreens() : int
    {
        return _internal_validPrescreens;
    }

    [Bindable(event="propertyChange")]
    public function get alcoholPrescreens() : int
    {
        return _internal_alcoholPrescreens;
    }

    [Bindable(event="propertyChange")]
    public function get drugPrescreens() : int
    {
        return _internal_drugPrescreens;
    }

    [Bindable(event="propertyChange")]
    public function get bothPrescreens() : int
    {
        return _internal_bothPrescreens;
    }

    [Bindable(event="propertyChange")]
    public function get screens() : int
    {
        return _internal_screens;
    }

    [Bindable(event="propertyChange")]
    public function get isNotScreening() : int
    {
        return _internal_isNotScreening;
    }

    [Bindable(event="propertyChange")]
    public function get possibleScreens() : int
    {
        return _internal_possibleScreens;
    }

    [Bindable(event="propertyChange")]
    public function get screensOfPossible() : int
    {
        return _internal_screensOfPossible;
    }

    [Bindable(event="propertyChange")]
    public function get educationScores() : int
    {
        return _internal_educationScores;
    }

    [Bindable(event="propertyChange")]
    public function get biScores() : int
    {
        return _internal_biScores;
    }

    [Bindable(event="propertyChange")]
    public function get btScores() : int
    {
        return _internal_btScores;
    }

    [Bindable(event="propertyChange")]
    public function get rtScores() : int
    {
        return _internal_rtScores;
    }

    [Bindable(event="propertyChange")]
    public function get bis() : int
    {
        return _internal_bis;
    }

    [Bindable(event="propertyChange")]
    public function get bts() : int
    {
        return _internal_bts;
    }

    [Bindable(event="propertyChange")]
    public function get rts() : int
    {
        return _internal_rts;
    }

    [Bindable(event="propertyChange")]
    public function get otherComments() : String
    {
        return _internal_otherComments;
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

    public function set month(value:int) : void
    {
        var oldValue:int = _internal_month;
        if (oldValue !== value)
        {
            _internal_month = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "month", oldValue, _internal_month));
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

    public function set uniquePatients(value:int) : void
    {
        var oldValue:int = _internal_uniquePatients;
        if (oldValue !== value)
        {
            _internal_uniquePatients = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "uniquePatients", oldValue, _internal_uniquePatients));
        }
    }

    public function set patientsEligible(value:int) : void
    {
        var oldValue:int = _internal_patientsEligible;
        if (oldValue !== value)
        {
            _internal_patientsEligible = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "patientsEligible", oldValue, _internal_patientsEligible));
        }
    }

    public function set prescreens(value:int) : void
    {
        var oldValue:int = _internal_prescreens;
        if (oldValue !== value)
        {
            _internal_prescreens = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "prescreens", oldValue, _internal_prescreens));
        }
    }

    public function set validPrescreens(value:int) : void
    {
        var oldValue:int = _internal_validPrescreens;
        if (oldValue !== value)
        {
            _internal_validPrescreens = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "validPrescreens", oldValue, _internal_validPrescreens));
        }
    }

    public function set alcoholPrescreens(value:int) : void
    {
        var oldValue:int = _internal_alcoholPrescreens;
        if (oldValue !== value)
        {
            _internal_alcoholPrescreens = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "alcoholPrescreens", oldValue, _internal_alcoholPrescreens));
        }
    }

    public function set drugPrescreens(value:int) : void
    {
        var oldValue:int = _internal_drugPrescreens;
        if (oldValue !== value)
        {
            _internal_drugPrescreens = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "drugPrescreens", oldValue, _internal_drugPrescreens));
        }
    }

    public function set bothPrescreens(value:int) : void
    {
        var oldValue:int = _internal_bothPrescreens;
        if (oldValue !== value)
        {
            _internal_bothPrescreens = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "bothPrescreens", oldValue, _internal_bothPrescreens));
        }
    }

    public function set screens(value:int) : void
    {
        var oldValue:int = _internal_screens;
        if (oldValue !== value)
        {
            _internal_screens = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "screens", oldValue, _internal_screens));
        }
    }

    public function set isNotScreening(value:int) : void
    {
        var oldValue:int = _internal_isNotScreening;
        if (oldValue !== value)
        {
            _internal_isNotScreening = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "isNotScreening", oldValue, _internal_isNotScreening));
        }
    }

    public function set possibleScreens(value:int) : void
    {
        var oldValue:int = _internal_possibleScreens;
        if (oldValue !== value)
        {
            _internal_possibleScreens = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "possibleScreens", oldValue, _internal_possibleScreens));
        }
    }

    public function set screensOfPossible(value:int) : void
    {
        var oldValue:int = _internal_screensOfPossible;
        if (oldValue !== value)
        {
            _internal_screensOfPossible = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "screensOfPossible", oldValue, _internal_screensOfPossible));
        }
    }

    public function set educationScores(value:int) : void
    {
        var oldValue:int = _internal_educationScores;
        if (oldValue !== value)
        {
            _internal_educationScores = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "educationScores", oldValue, _internal_educationScores));
        }
    }

    public function set biScores(value:int) : void
    {
        var oldValue:int = _internal_biScores;
        if (oldValue !== value)
        {
            _internal_biScores = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "biScores", oldValue, _internal_biScores));
        }
    }

    public function set btScores(value:int) : void
    {
        var oldValue:int = _internal_btScores;
        if (oldValue !== value)
        {
            _internal_btScores = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "btScores", oldValue, _internal_btScores));
        }
    }

    public function set rtScores(value:int) : void
    {
        var oldValue:int = _internal_rtScores;
        if (oldValue !== value)
        {
            _internal_rtScores = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "rtScores", oldValue, _internal_rtScores));
        }
    }

    public function set bis(value:int) : void
    {
        var oldValue:int = _internal_bis;
        if (oldValue !== value)
        {
            _internal_bis = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "bis", oldValue, _internal_bis));
        }
    }

    public function set bts(value:int) : void
    {
        var oldValue:int = _internal_bts;
        if (oldValue !== value)
        {
            _internal_bts = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "bts", oldValue, _internal_bts));
        }
    }

    public function set rts(value:int) : void
    {
        var oldValue:int = _internal_rts;
        if (oldValue !== value)
        {
            _internal_rts = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "rts", oldValue, _internal_rts));
        }
    }

    public function set otherComments(value:String) : void
    {
        var oldValue:String = _internal_otherComments;
        if (oldValue !== value)
        {
            _internal_otherComments = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "otherComments", oldValue, _internal_otherComments));
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

    model_internal function setterListenerOtherComments(value:flash.events.Event):void
    {
        _model.invalidateDependentOnOtherComments();
    }


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
        if (!_model.otherCommentsIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_otherCommentsValidationFailureMessages);
        }

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
    public function get _model() : _DataReportVOEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _DataReportVOEntityMetadata) : void
    {
        var oldValue : _DataReportVOEntityMetadata = model_internal::_dminternal_model;
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

    model_internal var _doValidationCacheOfOtherComments : Array = null;
    model_internal var _doValidationLastValOfOtherComments : String;

    model_internal function _doValidationForOtherComments(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfOtherComments != null && model_internal::_doValidationLastValOfOtherComments == value)
           return model_internal::_doValidationCacheOfOtherComments ;

        _model.model_internal::_otherCommentsIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isOtherCommentsAvailable && _internal_otherComments == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "otherComments is required"));
        }

        model_internal::_doValidationCacheOfOtherComments = validationFailures;
        model_internal::_doValidationLastValOfOtherComments = value;

        return validationFailures;
    }
    

}

}
