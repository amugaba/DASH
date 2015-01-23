<?php
include_once 'DataReportVO.php';


class DataReportService

{
/*
    public $username = "sbirt";
    public $password = "ry94v8co";
    public $server = "127.0.0.1";
    public $databasename = "sbirt_dash";
*/

    public $username = "root";
    public $password = "asdf2423";
    public $server = "localhost";
    public $databasename = "sbirt_dash";

    
    public $port = "3306";
    var $tablename = "data_reports";
    public $connection;

    public function __construct ()
    {

        $this->connection = mysqli_connect($this->server, $this->username,

        $this->password, $this->databasename, $this->port);

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