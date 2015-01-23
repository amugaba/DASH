package feedback
{
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	
	import mx.graphics.codec.JPEGEncoder;
	
	import org.alivepdf.colors.RGBColor;
	import org.alivepdf.fonts.CodePage;
	import org.alivepdf.fonts.CoreFont;
	import org.alivepdf.fonts.EmbeddedFont;
	import org.alivepdf.fonts.FontFamily;
	import org.alivepdf.images.ColorSpace;
	import org.alivepdf.layout.*;
	import org.alivepdf.pdf.PDF;
	import org.alivepdf.saving.Method;
	
	import pages.FeedbackPage;
	
	import valueObjects.DataReportVO;

	public class PDFCreator
	{
		//[Embed(source="img/background-design-orange1024.jpg", mimeType="application/octet-stream")] protected var jpgBytes:Class;
		[Embed(source="assets/img/IndianaSBIRT-horizontal.jpg", mimeType="application/octet-stream")] protected var sbirtLogoClass:Class;
		[Embed( source="COPRGTL.TTF", mimeType="application/octet-stream" )] public var copperPlateGothicLightTtf:Class;
		[Embed( source="coprgtl.afm", mimeType="application/octet-stream" )] public var copperPlateGothicLightAfm:Class;
		private var copperPlateGothicLightFont:EmbeddedFont = new EmbeddedFont(new copperPlateGothicLightTtf() as ByteArray, new copperPlateGothicLightAfm() as ByteArray, CodePage.CP1251);
		
		private var titleMarginLeft:int = 15;
		private var titleMarginRight:int = 15;
		private var titleWidth:int = 200;
		private var titleY:int = 60;
		
		private var reportPeriodX:int = 65;
		private var reportPeriodY:int = 99;
		private var monthX:int = 125;		
		
		private var introMarginLeft:int = 13;
		private var introMarginRight:int = 13;
		private var introY:int = 110;
		
		private var sectionTitleX:int = 75;
		private var sectionTitleY:int = 23;
		private var pageNumberX:int = 180;
		private var pageNumberY:int = 12;
		
		private var captureMarginLeft:int = 13;
		private var captureMarginRight:int = 13;
		private var captureY:int = 35;
		private var distributionMarginLeft:int = 13;
		private var distributionMarginRight:int = 80;
		private var distributionY:int = 160;
		
		private var lineGraphX:int = 20;
		private var lineGraphY:int = 60;
		private var lineGraphWidth:int = 170;
		private var lineGraphHeight:int = 80;
		
		private var pieChartX:int = 144;
		private var pieChartY:int = 157;
		private var pieChartWidth:int = 64;
		private var pieChartHeight:int = 64;
		private var pieLabelX:int = 150;
		private var pieLabelY:int = 148;
		
		private var commentsY:int = 228;
		
		public function PDFCreator()
		{
			
		}
		
		public function createPDF(rw:ReportWriter, feedbackPage:FeedbackPage):ByteArray
		{
			var pdf:PDF = new PDF(Orientation.PORTRAIT, Unit.MM, Size.LETTER);
			
			//Cover page
			pdf.addPage();
			pdf.setMargins(0,0);
			
			//base template
			//pdf.addImageStream(new reportPage1JPG() as ByteArray,ColorSpace.DEVICE_RGB, new Resize(Mode.FIT_TO_PAGE,Position.CENTERED));
			//The title and logos should be separate
			pdf.addImageStream(new sbirtLogoClass() as ByteArray,ColorSpace.DEVICE_RGB, null, 62, 15, 100, 35);
			
			pdf.textStyle(new RGBColor(0x0040FF));
			pdf.setFont(copperPlateGothicLightFont, 26);
			pdf.setMargins(titleMarginLeft,0, titleMarginRight);
			pdf.setY(titleY);
			pdf.addMultiCell(titleWidth,10,"Screening, Brief Intervention, and Referral to Treatment (SBIRT): Report of Activities",0,Align.CENTER);
			
			//pdf.writeText(5, "Screening, Brief Intervention, Referral to Treatment (SBIRT)\nReport of Activities");
			
			//report period
			pdf.textStyle(new RGBColor(0x8A0808));
			pdf.setFontSize(20);
			pdf.addText("Report Period:", reportPeriodX, reportPeriodY);
			pdf.setFont(new CoreFont(FontFamily.HELVETICA_BOLD),18);
			pdf.textStyle(new RGBColor(0x000000));
			pdf.addText(rw.reportPeriodLabel, monthX, reportPeriodY);
			
			//intro text
			pdf.setFontSize(12);
			pdf.setMargins(introMarginLeft,0, introMarginRight);
			pdf.setY(introY);
			pdf.writeFlashHtmlText(5, "This report details the SBIRT performance at <b>" + rw.user.name + "</b> during <b>" + 
				rw.reportPeriodLabel + "</b>. Data regarding prescreening, screening, and services can be found on pages 2, 3, and 4 respectively.");
			
			pdf.setY(introY+20);
			pdf.setFontSize(16);
			pdf.writeFlashHtmlText(5, "Key Concepts:");
			pdf.setY(introY+30);
			pdf.setFontSize(12);
			pdf.writeFlashHtmlText(5, "Capture Rate - At the top of each data page is the capture rate for that section. Capture rate is the number of patients who received " +
				"an SBIRT activity, divided by the the total number of patients who should have received that activity. For example, the prescreening capture rate = " +
				"(patients prescreened)/(patients due for their yearly prescreening). The goal is to have a 100% capture rate for each section.<br /><br />" +
				"Distribution - At the bottom of each data page is the distribution of that activity. It shows how many patients fell into each screening category or service category.<br /><br />" +
				"Unknown - If a piece of data was entered as 'Missing Data' on the monthly data report, statistics related to it will be written as 'unknown' in this report.");
			
			pdf.setY(introY+95);
			pdf.setFontSize(16);
			pdf.writeFlashHtmlText(5, "Additional Comments by Data Reporter:");
			pdf.setY(introY+105);
			pdf.setFontSize(12);
			pdf.writeFlashHtmlText(5, rw.activeReport.otherComments);
			
			//Page 2
			writeContentPage(pdf, "Prescreening", 2, feedbackPage.captureRateLine, feedbackPage.prescreenPie, "Prescreening Distribution", rw.prescreenCaptureText, rw.prescreenDistributionText);
			writeContentPage(pdf, "Screening", 3, feedbackPage.screeningRateLine, feedbackPage.screeningPie, "Screening Distribution", rw.screenCaptureText, rw.screenDistributionText);
			writeContentPage(pdf, "Services", 4, feedbackPage.servicesRateLine, feedbackPage.servicesPie, "Service Distribution", rw.serviceCaptureText, rw.serviceDistributionText);
			
			//save
			return pdf.save(Method.LOCAL);
		}
		
		private function writeContentPage(pdf:PDF, title:String, pageNum:int, lineGraph:MonthlyLineChart, pieChart:PieChartSBIRT, distroTitle:String,
											captureText:String, distributionText:String):void
		{
			//Page 2
			pdf.addPage();
			pdf.setMargins(0,0);
			//pdf.addImageStream(new reportPage2JPG() as ByteArray,ColorSpace.DEVICE_RGB, new Resize(Mode.FIT_TO_PAGE,Position.CENTERED));
			
			//Title and page number
			pdf.setFont(copperPlateGothicLightFont, 26);
			pdf.textStyle(new RGBColor(0x000000));
			pdf.addText(title, sectionTitleX, sectionTitleY);
			pdf.setFont(new CoreFont(FontFamily.HELVETICA),12);
			pdf.addText("Report Page " + pageNum, pageNumberX, pageNumberY);
			
			//Figures
			addHighResSnapshot(pdf, lineGraph, new Rectangle(lineGraphX, lineGraphY, lineGraphWidth, lineGraphHeight));
			addHighResSnapshot(pdf, pieChart.getPieChart(), new Rectangle(pieChartX, pieChartY, pieChartWidth, pieChartHeight));
			pdf.setFont(new CoreFont(FontFamily.HELVETICA_BOLD),14);
			pdf.addText(distroTitle, 146, 155);
			
			//intro text
			//pdf.setFontSize(12);
			
			//Text
			pdf.setMargins(captureMarginLeft,0,captureMarginRight,20);
			pdf.setY(captureY);
			pdf.writeFlashHtmlText(5, captureText);
			
			pdf.setMargins(distributionMarginLeft,0,distributionMarginRight,20);
			pdf.setY(distributionY);
			pdf.writeFlashHtmlText(5, distributionText);
			
			//pdf.setMargins(captureMarginLeft,0,captureMarginRight,20);
			//pdf.setY(commentsY);
			//pdf.textStyle(new RGBColor(0x2E2EFE));
			//pdf.writeFlashHtmlText(5, "Additional Comments:<br />No comments provided");
			pdf.textStyle(new RGBColor(0x000000));
		}
		
		private function addHighResSnapshot(pdf: PDF, snapshotObject: DisplayObject, imageRect: Rectangle, dpi: uint = 300): void
		{
			var bitmapData: BitmapData = capture(snapshotObject, dpi);
			var encodedImage: ByteArray = new JPEGEncoder(90).encode(bitmapData);
			pdf.addImageStream(encodedImage, ColorSpace.DEVICE_RGB, null,
				imageRect.x, imageRect.y, imageRect.width, imageRect.height);
		}
		
		private function capture(source: DisplayObject, dpi:uint = 72, bgColor:Number = 0xFFFFFF): BitmapData
		{
			var scale:Number = dpi/72.0;
			var bmd:BitmapData = new BitmapData(source.width * scale, source.height * scale, false, bgColor);
			var m: Matrix = new Matrix();
			m.scale(scale, scale);
			bmd.draw(source, m);
			return bmd;
		}
	}
}