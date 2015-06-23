<?php
//include_once 'DataReportService.php';
include_once 'UserService.php';

//$drs = new DataReportService();
$us = new UserService();

//$res = $drs->reportExists(0,13,2014);
$res = $us->getUsers();

var_dump($res);
?>