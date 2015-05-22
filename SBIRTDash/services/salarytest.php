<?php
	
	include_once 'CostReportService.php';
	
	$cs = new CostReportService();
	/*$cr = new CostReportVO();
	$cr->salaries['asdf'] = 123.4;
	$cr->salaries['hjkghj'] = 456.5;
	$cr->salaries['qwerqwe'] = 999;
	
	$cr->workloadPrescreen['yyyy'] = .231;
	$cr->workloadPrescreen['zzzz'] = .769;
	$cr->workloadScreen['yyyy'] = .5;
	
	$res = $cs->createCostReport($cr);*/
	
	$res = $cs->getCostReportByID(36);
	var_dump($res);
?>