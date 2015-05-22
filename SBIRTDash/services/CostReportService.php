<?php
include_once 'CostReportVO.php';
include_once 'ConnectionManager.php';

class CostReportService

{
    var $tablename = "cost_reports";
    public $connection;
    
    //activity types
    private $PRESCREEN = 0;
    private $SCREEN = 1;
    private $EDUCATION = 2;
    private $BI = 3;
    private $RT = 4;
    private $ADMIN = 5;
    private $TRAINING = 6;
    private $SUPPORT = 7;
    private $OTHER = 8;

    public function __construct ()
    {
		$cm = new ConnectionManager();

        $this->connection = mysqli_connect($cm->server, $cm->username,
        $cm->password, $cm->databasename, $cm->port);

        $this->throwExceptionOnError($this->connection);
    }
    
	/**
	 * Create a data report
	 * 
	 * @param CostReportVO $item
	 * @return CostReportVO
	 */
    public function createCostReport ($item)
    {        
        $stmt = $this->connection->prepare("INSERT IGNORE INTO $this->tablename
        (	userid, dataReportID, prescreenTime, screenTime, educationTime, biTime, rtTime, adminTime, trainingTime, 
			supportTime, otherTime, otherTimeSpec, tech, supplies, otherCost, otherCostSpec, facilityCost, 	facilityPercent, 
			prescreenTotal, screenTotal, educationTotal, biTotal, rtTotal, adminTotal, trainingTotal, supportTotal, otherTotal, 
			serviceTotal, nonserviceTotal, expenseTotal, grandTotal, perPatientCost, comments) 
			VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        $this->throwExceptionOnError();

        $stmt->bind_param('ii'.'ddddddddds'.'dddsdd'.'ddddddddd'.'ddddds', $item->userid, $item->dataReportID, 
        	$item->prescreenTime, $item->screenTime, $item->educationTime, $item->biTime, $item->rtTime, $item->adminTime, 
        	$item->trainingTime, $item->supportTime, $item->otherTime, $item->otherTimeSpec, 
        	$item->tech, $item->supplies, $item->otherCost, $item->otherCostSpec, $item->facilityCost, $item->facilityPercent, 
        	$item->prescreenTotal, $item->screenTotal, $item->educationTotal, $item->biTotal, $item->rtTotal, 
        	$item->adminTotal, $item->trainingTotal, $item->supportTotal, $item->otherTotal, 
        	$item->serviceTotal, $item->nonserviceTotal, $item->expenseTotal, $item->grandTotal, $item->perPatientCost,
			$item->comments);
        $this->throwExceptionOnError();

        $rs = $stmt->execute();
        $this->throwExceptionOnError();

        $item->autoid = $stmt->insert_id;
        $stmt->free_result();
        
        //Salaries
        $this->uploadSalary($item->salaries, $item->autoid);
        $this->uploadWorkload($item->workloadPrescreen, $item->autoid, $this->PRESCREEN);
        $this->uploadWorkload($item->workloadScreen, $item->autoid, $this->SCREEN);
        $this->uploadWorkload($item->workloadEducation, $item->autoid, $this->EDUCATION);
        $this->uploadWorkload($item->workloadBI, $item->autoid, $this->BI);
        $this->uploadWorkload($item->workloadRT, $item->autoid, $this->RT);
        $this->uploadWorkload($item->workloadAdmin, $item->autoid, $this->ADMIN);
        $this->uploadWorkload($item->workloadTraining, $item->autoid, $this->TRAINING);
        $this->uploadWorkload($item->workloadSupport, $item->autoid, $this->SUPPORT);
        $this->uploadWorkload($item->workloadOther, $item->autoid, $this->OTHER);

        $this->connection->close();
        
        return $item; 
    }
    
    protected function uploadSalary($salaries, $reportid)
    {
    	$stmt = $this->connection->prepare("INSERT IGNORE INTO salaries (reportid, position, salary)
        	VALUES (?,?,?)");
        $this->throwExceptionOnError();

        foreach($salaries as $position => $salary)
        {
        	$position = mysqli_real_escape_string($this->connection,$position);
        	
        	$stmt->bind_param('isd',$reportid, $position, $salary);
        	$this->throwExceptionOnError();

	        $rs = $stmt->execute();
	        $this->throwExceptionOnError();
	        $stmt->free_result();
	        
	        next($salaries);
        }
    }
    
	protected function uploadWorkload($workloads, $reportid, $activityType)
    {
    	$stmt = $this->connection->prepare("INSERT IGNORE INTO workloads (reportid, position, percent, activityType)
        	VALUES (?,?,?,?)");
        $this->throwExceptionOnError();

        foreach($workloads as $position => $percent)
        {
        	$position = mysqli_real_escape_string($this->connection,$position);
        	
        	$stmt->bind_param('isdi',$reportid, $position, $percent, $activityType);
        	$this->throwExceptionOnError();

	        $rs = $stmt->execute();
	        $this->throwExceptionOnError();
	        $stmt->free_result();
	        
	        next($workloads);
        }
    }
    
	/**
	 * Retrieve a data report
	 * 
	 * @param $autoid
	 * @return CostReportVO
	 */
    public function getCostReportByID ($autoid)
    {        
        $stmt = $this->connection->prepare("SELECT 
        	autoid, userid, dataReportID, prescreenTime, screenTime, educationTime, biTime, rtTime, adminTime, trainingTime, 
			supportTime, otherTime, otherTimeSpec, tech, supplies, otherCost, otherCostSpec, facilityCost, 	facilityPercent, 
			prescreenTotal, screenTotal, educationTotal, biTotal, rtTotal, adminTotal, trainingTotal, supportTotal, otherTotal, 
			serviceTotal, nonserviceTotal, expenseTotal, grandTotal, perPatientCost, comments
			FROM $this->tablename WHERE autoid = ?");
        $this->throwExceptionOnError();

        $stmt->bind_param('i',$autoid);
        $this->throwExceptionOnError();

        $rs = $stmt->execute();
        $this->throwExceptionOnError();

        $item = new CostReportVO();
        $stmt->bind_result($item->autoid, $item->userid, $item->dataReportID, 
        	$item->prescreenTime, $item->screenTime, $item->educationTime, $item->biTime, $item->rtTime, $item->adminTime, 
        	$item->trainingTime, $item->supportTime, $item->otherTime, $item->otherTimeSpec, 
        	$item->tech, $item->supplies, $item->otherCost, $item->otherCostSpec, $item->facilityCost, $item->facilityPercent, 
        	$item->prescreenTotal, $item->screenTotal, $item->educationTotal, $item->biTotal, $item->rtTotal, 
        	$item->adminTotal, $item->trainingTotal, $item->supportTotal, $item->otherTotal, 
        	$item->serviceTotal, $item->nonserviceTotal, $item->expenseTotal, $item->grandTotal, $item->perPatientCost,
			$item->comments);
        $stmt->fetch();
        $stmt->free_result();
        
        //Salaries & workload
        $item->salaries = $this->getSalaries($autoid);
        $item->workloadPrescreen = $this->getWorkloads($autoid, $this->PRESCREEN);
        $item->workloadScreen = $this->getWorkloads($autoid, $this->SCREEN);
        $item->workloadEducation = $this->getWorkloads($autoid, $this->EDUCATION);
        $item->workloadBI = $this->getWorkloads($autoid, $this->BI);
        $item->workloadRT = $this->getWorkloads($autoid, $this->RT);
        $item->workloadAdmin = $this->getWorkloads($autoid, $this->ADMIN);
        $item->workloadTraining = $this->getWorkloads($autoid, $this->TRAINING);
        $item->workloadSupport = $this->getWorkloads($autoid, $this->SUPPORT);
        $item->workloadOther = $this->getWorkloads($autoid, $this->OTHER);

        $this->connection->close();
        
        return $item; 
    }
    
	private function getSalaries($reportid)
    {
    	$stmt = $this->connection->prepare("SELECT position, salary FROM salaries WHERE reportid = ?");
        $this->throwExceptionOnError();

        $stmt->bind_param('i',$reportid);
        $this->throwExceptionOnError();

        $stmt->execute();
        $this->throwExceptionOnError();
        
    	$salaries = array();
    	$position = "";
    	$salary = 0;
        $stmt->bind_result($position, $salary);
		
        while($stmt->fetch())
        {
        	$salaries[$position] = $salary;
	    }
	    
	    $stmt->free_result();
	    return $salaries;
    }
    
	private function getWorkloads($reportid, $activityType)
    {
    	$stmt = $this->connection->prepare("SELECT position, percent FROM workloads WHERE reportid = ? AND activityType = ?");
        $this->throwExceptionOnError();

        $stmt->bind_param('ii',$reportid, $activityType);
        $this->throwExceptionOnError();

        $stmt->execute();
        $this->throwExceptionOnError();
        
    	$workloads = array();
    	$position = "";
    	$percent = 0;
        $stmt->bind_result($position, $percent);
		
        while($stmt->fetch())
        {
        	$workloads[$position] = $percent;
	    }
	    
	    $stmt->free_result();
	    return $workloads;
    }

    
	/**
	 * Utility function to throw an exception if an error occurs 
	 * while running a mysql command.
	 */
	private function throwExceptionOnError($link = null) {
		if($link == null) {
			$link = $this->connection;
		}
		if(mysqli_error($link)) {
			$msg = mysqli_errno($link) . ": " . mysqli_error($link);
			throw new Exception('MySQL Error - '. $msg);
		}		
	}
}

?>