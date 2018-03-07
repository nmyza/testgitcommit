var require = patchRequire(require),
fs = require('fs');
var fileName = casper.cli.get("filename");
var apiName = casper.cli.get("apiname");
casper.test.begin("PerformanceResultsToSplunk", function(test) {

console.log("file name is " + fileName);
console.log("api name is " + apiName);
    var data = fs.read(fileName);
    var lines = data.split("\n");
var TestCaseData={}
 
    var SplunkUrl="https://splnkfrprdvh3:8089/services/receivers/simple?sourcetype=CDW_ECommerceWeb_TestAutomationDev&index=sdlc";

    for (i = 1; i <= lines.length-3; i++) {
        var FirstComma = lines[i].indexOf(',');       
        var SecondComma = lines[i].indexOf(',', FirstComma + 1);
        var ThirdComma = lines[i].indexOf(',', SecondComma + 1);   
        var FourthComma = lines[i].indexOf(',', ThirdComma + 1);
        var FifthComma = lines[i].indexOf(',', FourthComma + 1);
		var SixthComma = lines[i].indexOf(',', FifthComma + 1);
		var SeventhComma = lines[i].indexOf(',', SixthComma + 1);
		var EightComma = lines[i].indexOf(',', SeventhComma + 1);
		var NineComma = lines[i].indexOf(',', EightComma + 1);
		var TenComma = lines[i].indexOf(',', NineComma + 1);
		var EleComma = lines[i].indexOf(',', TenComma + 1);
		var TweComma = lines[i].indexOf(',', EleComma + 1);
        var Label = lines[i].substring(0, FirstComma);
        var Count = lines[i].substring(FirstComma + 1, SecondComma);
        var Average = lines[i].substring(SecondComma + 1, ThirdComma);
        var Median = lines[i].substring(ThirdComma + 1, FourthComma);
        var NinetyPercent = lines[i].substring(FourthComma + 1, FifthComma); 
		var NinetyFivePercent = lines[i].substring(FifthComma + 1, SixthComma); 
		var NinetyNinePercent = lines[i].substring(SixthComma + 1, SeventhComma); 
		var Min = lines[i].substring(SeventhComma + 1, EightComma); 
		var Max = lines[i].substring(EightComma + 1, NineComma);
		var ErrorPercent = lines[i].substring(NineComma + 1, TenComma);	
		var ReportRate = lines[i].substring(TenComma + 1, EleComma);	
		var Bandwidth = lines[i].substring(EleComma + 1, TweComma);		
        var env = lines[i].substring(FifthComma + 1, 10000).trim();

		//console.log("I am here 1");
   
	TestCaseData = {
            "AutomationTool":"JMeter",
            "API": apiName,
            "ProductTeam": "Product",
            "Label": Label,
            "Count":Count,
            "Average": Average,
            "Median": Median,
            "NinetyPercent": NinetyPercent,
            "Min":Min,
            "Max":Max,
			"ErrorPercent": ErrorPercent,
			"Bandwidth": Bandwidth

        }; 
		
		//console.log(JSON.stringify(TestCaseData));
       var xhr = new XMLHttpRequest();
        xhr.withCredentials = true;
        xhr.open("POST", SplunkUrl, false);
        xhr.setRequestHeader("authorization", "Basic U3BsdW5rQXBpOnMjdVZVaGVTd0E1Vw==");
        xhr.setRequestHeader("Content-Type", "application/json");
        try {
		console.log("Before Splunk Call: " + new Date().toLocaleString());
            xhr.send(JSON.stringify(TestCaseData));   
			console.log("Response Code: " + xhr.status.toString());
			console.log("After Splunk Call: " + new Date().toLocaleString());
			//console.log("Posting data " + i + " to Splunk");
        } catch (e) {
            console.log(e);
			//console.log("I am here 3");
        } 
	  console.log("Posting request status is: " + xhr.status.toString());
	  
      casper.test.assertEquals(xhr.status.toString(),"200");
	  
        
        }
        
     
     
   
      test.done();
});

