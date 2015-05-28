<?php
/**
 * 
 * Financial cost data.
 * It is linked to a monthly data report.
 * Position salaries and workloads are lists of variable size, so those values need to be stored in a separate table
 * and referenced by this report's autoid.
 * Once retrieved from the DB, they can be stored on this object in an array.
 * 
 * @author David Tidd
 * 5/19/2015
 */
class CostReportVO
{
	public $autoid;
	public $userid;
	public $dataReportID;
	public $month;
	public $year;
	
	public $salaries;
	
	/**
	 * @var float
	 */
	public $prescreenTime;
	/**
	 * @var double
	 */
	public $screenTime;
	public $educationTime;
	public $biTime;
	public $rtTime;
	public $adminTime;
	public $trainingTime;
	public $supportTime;
	public $otherTime;
	public $otherTimeSpec;
	
	public $workloadPrescreen;
	public $workloadScreen;
	public $workloadEducation;
	public $workloadBI;
	public $workloadRT;
	public $workloadAdmin;
	public $workloadTraining;
	public $workloadSupport;
	public $workloadOther;
	
	public $tech;
	public $supplies;
	public $otherCost;
	public $otherCostSpec;
	public $facilityCost;
	public $facilityPercent;
	
	public $prescreenTotal;
	public $screenTotal;
	public $educationTotal;
	public $biTotal;
	public $rtTotal;
	public $adminTotal;
	public $trainingTotal;
	public $supportTotal;
	public $otherTotal;
	public $serviceTotal;
	public $nonserviceTotal;
	public $expenseTotal;
	public $grandTotal;
	public $perPatientCost;
	
	public $comments;

	public function __construct()
	{
		$this->autoid = 0;
		$this->userid = 0;
		$this->dataReportID = 0;
		$this->month = 0;
		$this->year = 0;
		$this->salaries = null;
		
		$this->prescreenTime = 0;
		$this->screenTime = 0;
		$this->educationTime = 0;
		$this->biTime = 0;
		$this->rtTime = 0;
		$this->adminTime = 0;
		$this->trainingTime = 0;
		$this->supportTime = 0;
		$this->otherTime = 0;
		$this->otherTimeSpec = "";
		
		$this->workloadPrescreen = null;
		$this->workloadScreen = null;
		$this->workloadEducation = null;
		$this->workloadBI = null;
		$this->workloadRT = null;
		$this->workloadAdmin = null;
		$this->workloadTraining = null;
		$this->workloadSupport = null;
		$this->workloadOther = null;
		
		$this->tech = 0;
		$this->supplies = 0;
		$this->otherCost = 0;
		$this->otherCostSpec = "";
		$this->facilityCost = 0;
		$this->facilityPercent = 0;
		
		$this->prescreenTotal = 0;
		$this->screenTotal = 0;
		$this->educationTotal = 0;
		$this->biTotal = 0;
		$this->rtTotal = 0;
		$this->adminTotal = 0;
		$this->trainingTotal = 0;
		$this->supportTotal = 0;
		$this->otherTotal = 0;
		$this->serviceTotal = 0;
		$this->nonserviceTotal = 0;
		$this->expenseTotal = 0;
		$this->grandTotal = 0;
		$this->perPatientCost = 0;
		
		$this->comments = "";
	}
}
?>