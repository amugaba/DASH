<?php
class DataReportVO
{
	public $autoid;
	public $userid;
	public $month;
	public $year;
	public $uniquePatients;
	public $patientsEligible;
	public $prescreens;
	public $validPrescreens;
	public $alcoholPrescreens;
	public $drugPrescreens;
	public $bothPrescreens;
	public $screens;
	public $isNotScreening;
	public $possibleScreens;
	public $screensOfPossible;
	public $educationScores;
	public $biScores;
	public $btScores;
	public $rtScores;
	public $bis;
	public $bts;
	public $rts;
	public $otherComments;


	public function __construct()
	{
		$this->autoid = 0;
		$this->userid = 0;
		$this->month = 0;
		$this->year = 0;
		$this->uniquePatients = 0;
		$this->patientsEligible = 0;
		$this->prescreens = 0;
		$this->validPrescreens = 0;
		$this->alcoholPrescreens = 0;
		$this->drugPrescreens = 0;
		$this->bothPrescreens = 0;
		$this->screens = 0;
		$this->isNotScreening = 0;
		$this->possibleScreens = 0;
		$this->screensOfPossible = 0;
		$this->educationScores = 0;
		$this->biScores = 0;
		$this->btScores = 0;
		$this->rtScores = 0;
		$this->bis = 0;
		$this->bts = 0;
		$this->rts = 0;
		$this->otherComments = "";
	}
}
?>