package feedback
{
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	
	import spark.collections.Sort;
	import spark.collections.SortField;

	public class Troubleshooter
	{
		public var concerns:ArrayCollection = new ArrayCollection();
		
		private var uniquePatients:DataConcern = new DataConcern("Number of unique patients", 1, true, false, "The patient volume at your clinic is noticeably different from the " +
			"average amount. Has this value been reported correctly? If so, will this impact the availability of SBIRT services due to time and staffing constraints?");
		
		private var eligiblePatients:DataConcern = new DataConcern("Rate of patients due for SBIRT prescreening", 2, true, true, "The percent of your patients this month who were due for " +
			"their annual SBIRT prescreening was noticeably different from average. Is there an error with your tracking system used for determining which patients need SBIRT?");
		
		private var prescreenCaptureRate:DataConcern = new DataConcern("Prescreen capture rate", 3,	false, true, "Your prescreen capture rate was low this month. There may be an " +
			"issue with tracking which patients need SBIRT, or there may be an issue with your staff members who administer the prescreening. A possible solution is to consult with " +
			"your prescreening staff. What percentage of patients do they think they are capturing? Are there barriers that are preventing them from prescreening such as lack of " +
			"supplies or time constraints?");
		
		private var invalidPrescreens:DataConcern = new DataConcern("Frequency of invalid prescreens", 2, false, true, "A large percentage of your prescreens were conducted with patients who " +
			"were not yet due for their annual prescreening. SBIRT is recommended to be performed once per year. Increased exposure to the prescreening may decrease its efficacy " +
			"as patients become irritated with its repetition and answer less honestly. Additionally, you may be expending resources prescreening a category of people who will not benefit " +
			"as much from it.");
		
		private var positivePrescreenRate:DataConcern = new DataConcern("Positive prescreen rate", 2, true, true, "The percentage of patients who screened positive for alcohol and/or " +
			"drugs was noticeably lower than average. If this month's value was low, it may be due to asking the prescreening questions in a biased manner. Saying \"You don't do " +
			"drugs do you?\" rather than reading the questions as written can change patients' responses. A possible solution is to consult with prescreening staff. Ask how they are " +
			"conducting the prescreening and solicit their opinions on whether patients are answering the prescreen honestly.");
		
		private var screeningCaptureRate:DataConcern = new DataConcern("Screening capture rate", 3, false, true, "Your full screening capture rate was low this month. This is a difficult " +
			"step in the SBIRT process that can break down due to several factors. Is there a communication issue between the prescreening staff and screening staff? The screening staff may " +
			"be unaware of all of the patients that need full screenings. If communication relies on phones, pagers, or flagging in the EHR, are those methods being used by all staff " +
			"and in a timely manner?<br /><br />Another possible cause is that the positive SBIRT patient volume is too high for your screening staff to see them all. When staff are contacted " +
			"to do a full screen, are they buys with other SBIRT patients or other duties? Finally, are there other constraints such as limited room availability or time in the patient visit?");
		
		private var serviceCaptureRate:DataConcern = new DataConcern("Service capture rate", 3, false, true, "Your service capture rate was low this month. Patients who screen positive " +
			"are not receiving interventions or referrals. Does a single staff member perform both the screening and service, or are those parts conducted by separate people? If " +
			"separate, there may be communication or documentation problems. Either way, consult with your SBIRT service-providing staff about any barriers they are experiencing.");
		
		
		public function Troubleshooter(rw:ReportWriter)
		{
			//For some data concerns the goal is the mean
			for each(var report:DataReportDetailed in rw.reports)
			{
				uniquePatients.goal += report.uniquePatients * 1.0 / rw.reports.length;
				eligiblePatients.goal += report.patientsEligible * 1.0 / rw.reports.length;
				positivePrescreenRate.goal += report.positivePrescreenRate * 1.0 / rw.reports.length;
			}
			//convert eligible patients to a percentage of eligible/unique
			eligiblePatients.goal = eligiblePatients.goal / uniquePatients.goal;
			
			uniquePatients.minAcceptableDeviation = -.3;
			eligiblePatients.minAcceptableDeviation = -.3;
			eligiblePatients.maxAcceptableDeviation = 0.3;
			positivePrescreenRate.minAcceptableDeviation = -.3;
			
			//Manually set some goals
			prescreenCaptureRate.goal = 1;
			prescreenCaptureRate.minAcceptableDeviation = -0.15;
			screeningCaptureRate.goal = 1;
			screeningCaptureRate.minAcceptableDeviation = -0.15;
			serviceCaptureRate.goal = 1;
			serviceCaptureRate.minAcceptableDeviation = -0.15;
			invalidPrescreens.goal = 0;
			invalidPrescreens.maxAcceptableDeviation = .10;
			
			//Enter data from active report
			uniquePatients.currentValue = rw.activeReport.uniquePatients;
			eligiblePatients.currentValue = rw.activeReport.patientsEligible * 1.0/rw.activeReport.uniquePatients;//convert to percentage
			prescreenCaptureRate.currentValue = rw.activeReport.prescreenCaptureRate;
			invalidPrescreens.currentValue = rw.activeReport.invalidPrescreens * 1.0/rw.activeReport.prescreens;//convert to percentage of invalid/prescreens
			positivePrescreenRate.currentValue = rw.activeReport.positivePrescreenRate;
			screeningCaptureRate.currentValue = rw.activeReport.screenCaptureRate;
			serviceCaptureRate.currentValue = rw.activeReport.serviceCaptureRate;
			
			//Calculate scores
			concerns.addItem(uniquePatients);
			concerns.addItem(eligiblePatients);
			concerns.addItem(prescreenCaptureRate);
			concerns.addItem(invalidPrescreens);
			concerns.addItem(positivePrescreenRate);
			concerns.addItem(screeningCaptureRate);
			concerns.addItem(serviceCaptureRate);
			
			for each(var concern:DataConcern in concerns)
			{
				concern.calculateScore();
			}
			
			//Sort all concerns by deviation and importance
			var dataSortScore:SortField = new SortField();
			dataSortScore.name = "score";
			dataSortScore.numeric = true;
			dataSortScore.descending = true;
			
			var numericDataSort:Sort = new Sort();
			numericDataSort.fields = [dataSortScore];
			concerns.sort = numericDataSort;
			concerns.refresh();
		}
		
		
	}
}