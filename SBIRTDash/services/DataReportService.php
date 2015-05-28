<?php
include_once 'DataReportVO.php';
include_once 'ConnectionManager.php';

class DataReportService

{
    var $tablename = "data_reports";
    public $connection;

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
	 * @param DataReportVO $item
	 * @return DataReportVO
	 */
    public function createDataReport ($item)
    {        
        $stmt = $this->connection->prepare("INSERT IGNORE INTO $this->tablename
        (	userid, month, year, uniquePatients, patientsEligible, prescreens, validPrescreens, alcoholPrescreens, drugPrescreens,
			bothPrescreens, screens, isNotScreening, possibleScreens, screensOfPossible, educationScores, biScores, btScores,
			rtScores, bis, bts, rts, otherComments) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        $this->throwExceptionOnError();

        $stmt->bind_param('iiiiiiiiiiiiiiiiiiiiis', $item->userid, $item->month, $item->year, $item->uniquePatients, $item->patientsEligible,
			$item->prescreens, $item->validPrescreens, $item->alcoholPrescreens, $item->drugPrescreens, $item->bothPrescreens,
			$item->screens, $item->isNotScreening, $item->possibleScreens, $item->screensOfPossible,
			$item->educationScores,	$item->biScores, $item->btScores, $item->rtScores, $item->bis, $item->bts, $item->rts,
			$item->otherComments);
        $this->throwExceptionOnError();

        $rs = $stmt->execute();
        $this->throwExceptionOnError();

        $item->autoid = $stmt->insert_id;
        
        $stmt->free_result();
        $this->connection->close();
        
        return $item; 
    }
    
/**
	 * Update a data report
	 * 
	 * @param DataReportVO $item
	 * @return DataReportVO
	 */
    public function updateDataReport ($item)
    {        
        $stmt = $this->connection->prepare("UPDATE $this->tablename SET 
        	uniquePatients=?, patientsEligible=?, prescreens=?, validPrescreens=?, alcoholPrescreens=?, drugPrescreens=?,
			bothPrescreens=?, screens=?, isNotScreening=?, possibleScreens=?, screensOfPossible=?, educationScores=?, biScores=?, btScores=?,
			rtScores=?, bis=?, bts=?, rts=?, otherComments=? WHERE autoid=?");
        $this->throwExceptionOnError();

        $stmt->bind_param('iiiiiiiiiiiiiiiiiisi', $item->uniquePatients, $item->patientsEligible,
			$item->prescreens, $item->validPrescreens, $item->alcoholPrescreens, $item->drugPrescreens, $item->bothPrescreens,
			$item->screens, $item->isNotScreening, $item->possibleScreens, $item->screensOfPossible,
			$item->educationScores,	$item->biScores, $item->btScores, $item->rtScores, $item->bis, $item->bts, $item->rts,
			$item->otherComments, $item->autoid);
        $this->throwExceptionOnError();

        $rs = $stmt->execute();
        $this->throwExceptionOnError();
        
        $stmt->free_result();
        $this->connection->close();
        
        return $item; 
    }
    
    /**
     * Get all data reports for a user
     * 
     * @param int $userid
     * @return DataReportVO[]
     */
    public function getDataReports($userid)
    {
    	$stmt = $this->connection->prepare("SELECT autoid, userid, month, year, uniquePatients, patientsEligible, prescreens, validPrescreens, alcoholPrescreens, drugPrescreens,
			bothPrescreens, screens, isNotScreening, possibleScreens, screensOfPossible, educationScores, biScores, btScores,
			rtScores, bis, bts, rts, otherComments FROM $this->tablename WHERE userid=?");
    	$this->throwExceptionOnError();

        $stmt->bind_param('i',$userid);
        $this->throwExceptionOnError();

        $stmt->execute();
        $this->throwExceptionOnError();
        
        $reports = array();
    	$item = new DataReportVO();
        $stmt->bind_result($item->autoid, $item->userid, $item->month, $item->year, $item->uniquePatients, $item->patientsEligible,
			$item->prescreens, $item->validPrescreens, $item->alcoholPrescreens, $item->drugPrescreens, $item->bothPrescreens,
			$item->screens, $item->isNotScreening, $item->possibleScreens, $item->screensOfPossible,
			$item->educationScores,	$item->biScores, $item->btScores, $item->rtScores, $item->bis, $item->bts, $item->rts,
			$item->otherComments);
		
        while($stmt->fetch())
        {
	        array_push($reports, $item);
	        $item = new DataReportVO();
	        $stmt->bind_result($item->autoid, $item->userid, $item->month, $item->year, $item->uniquePatients, $item->patientsEligible,
			$item->prescreens, $item->validPrescreens, $item->alcoholPrescreens, $item->drugPrescreens, $item->bothPrescreens,
			$item->screens, $item->isNotScreening, $item->possibleScreens, $item->screensOfPossible,
			$item->educationScores,	$item->biScores, $item->btScores, $item->rtScores, $item->bis, $item->bts, $item->rts,
			$item->otherComments);
	    }
        
        $stmt->free_result();
        $this->connection->close();
        return $reports;
    }
    
    /**
     * Get each data report for a user that do not have a cost report assoicated with it
     * 
     * @param int $userid
     * @return DataReportVO[]
     */
    public function getDataReportsWithoutCost($userid)
    {
    	$stmt = $this->connection->prepare("SELECT autoid, userid, month, year, uniquePatients, patientsEligible, prescreens, validPrescreens, alcoholPrescreens, drugPrescreens,
			bothPrescreens, screens, isNotScreening, possibleScreens, screensOfPossible, educationScores, biScores, btScores,
			rtScores, bis, bts, rts, otherComments FROM $this->tablename WHERE userid=?");
    	$this->throwExceptionOnError();

        $stmt->bind_param('i',$userid);
        $this->throwExceptionOnError();

        $stmt->execute();
        $this->throwExceptionOnError();
        
        $reports = array();
    	$item = new DataReportVO();
        $stmt->bind_result($item->autoid, $item->userid, $item->month, $item->year, $item->uniquePatients, $item->patientsEligible,
			$item->prescreens, $item->validPrescreens, $item->alcoholPrescreens, $item->drugPrescreens, $item->bothPrescreens,
			$item->screens, $item->isNotScreening, $item->possibleScreens, $item->screensOfPossible,
			$item->educationScores,	$item->biScores, $item->btScores, $item->rtScores, $item->bis, $item->bts, $item->rts,
			$item->otherComments);
		
        while($stmt->fetch())
        {
	        array_push($reports, $item);
	        $item = new DataReportVO();
	        $stmt->bind_result($item->autoid, $item->userid, $item->month, $item->year, $item->uniquePatients, $item->patientsEligible,
			$item->prescreens, $item->validPrescreens, $item->alcoholPrescreens, $item->drugPrescreens, $item->bothPrescreens,
			$item->screens, $item->isNotScreening, $item->possibleScreens, $item->screensOfPossible,
			$item->educationScores,	$item->biScores, $item->btScores, $item->rtScores, $item->bis, $item->bts, $item->rts,
			$item->otherComments);
	    }
        
        $stmt->free_result();
        
        //exclude all reports that have a cost associated with it
        $finalReports = array();
        $reportExists = false;
        foreach($reports as $item)
        {
        	$stmt = $this->connection->prepare("SELECT EXISTS(SELECT 1 FROM cost_reports WHERE dataReportID=?)");
	    	$this->throwExceptionOnError();
	
	        $stmt->bind_param('i',$item->autoid);
	        $this->throwExceptionOnError();
	
	        $stmt->execute();
	        $this->throwExceptionOnError();
	    	
	        $stmt->bind_result($reportExists);
	        $stmt->fetch();
	        $stmt->free_result();
	        
	        if(!$reportExists)
	        	array_push($finalReports, $item);
        }
        $this->connection->close();
        return $finalReports;
    }
    
/**
     * Get all data reports for a user
     * 
     * @param int $autoid
     * @return DataReportVO
     */
    public function getDataReportByID($autoid)
    {
    	$stmt = $this->connection->prepare("SELECT autoid, userid, month, year, uniquePatients, patientsEligible, prescreens, validPrescreens, alcoholPrescreens, drugPrescreens,
			bothPrescreens, screens, isNotScreening, possibleScreens, screensOfPossible, educationScores, biScores, btScores,
			rtScores, bis, bts, rts, otherComments FROM $this->tablename WHERE autoid=?");
    	$this->throwExceptionOnError();

        $stmt->bind_param('i',$autoid);
        $this->throwExceptionOnError();

        $stmt->execute();
        $this->throwExceptionOnError();
        
    	$item = new DataReportVO();
        $stmt->bind_result($item->autoid, $item->userid, $item->month, $item->year, $item->uniquePatients, $item->patientsEligible,
			$item->prescreens, $item->validPrescreens, $item->alcoholPrescreens, $item->drugPrescreens, $item->bothPrescreens,
			$item->screens, $item->isNotScreening, $item->possibleScreens, $item->screensOfPossible,
			$item->educationScores,	$item->biScores, $item->btScores, $item->rtScores, $item->bis, $item->bts, $item->rts,
			$item->otherComments);
		
        $stmt->fetch();
        $stmt->free_result();
        $this->connection->close();
        
        return $item;
    }
    
    /**
     * Check whether a report exists with the given user, month, and year
     * 
     * @param int userid
     * @param int month
     * @param int year
     * @return bool reportExists
     */
    public function reportExists($userid, $month, $year)
    {
    	$stmt = $this->connection->prepare("SELECT EXISTS(SELECT 1 FROM $this->tablename WHERE userid=? AND month=? AND year=?)");
    	$this->throwExceptionOnError();

        $stmt->bind_param('iii',$userid, $month, $year);
        $this->throwExceptionOnError();

        $stmt->execute();
        $this->throwExceptionOnError();
    	
        $stmt->bind_result($reportExists);
        $stmt->fetch();
        
        $stmt->free_result();
        $this->connection->close();
        return $reportExists;
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