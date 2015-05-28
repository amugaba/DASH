/**
 * This is a generated sub-class of _DataReportService.as and is intended for behavior
 * customization.  This class is only generated when there is no file already present
 * at its target location.  Thus custom behavior that you add here will survive regeneration
 * of the super-class. 
 **/
 
package services.datareportservice
{

public class DataReportService extends _Super_DataReportService
{
    /**
     * Override super.init() to provide any initialization customization if needed.
     */
    protected override function preInitializeService():void
    {
        super.preInitializeService();
        // Initialization customization goes here
		if(SBIRTDashFlex.DEBUG_MODE == 0)
			serviceControl.endpoint = SBIRTDashFlex.ENDPOINT_RELEASE;
    }
               
}

}
