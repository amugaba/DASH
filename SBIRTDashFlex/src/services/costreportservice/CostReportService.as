/**
 * This is a generated sub-class of _CostReportService.as and is intended for behavior
 * customization.  This class is only generated when there is no file already present
 * at its target location.  Thus custom behavior that you add here will survive regeneration
 * of the super-class. 
 **/
 
package services.costreportservice
{

public class CostReportService extends _Super_CostReportService
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
