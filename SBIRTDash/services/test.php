<?php
include_once 'DataReportService.php';

$drs = new DataReportService();
$res = $drs->reportExists(0,13,2014);
var_dump($res);
?>