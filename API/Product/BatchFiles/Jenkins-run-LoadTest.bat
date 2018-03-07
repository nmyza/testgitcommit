@echo off

set testPlanFile=%1
set resultsFile=%2
set resultsFileSummary=%3
set baseUrl=%4
set versionNumber = %5
set ProductCodesCSVFile = %6
set BidContractReferenceNumbersCSVFile = %7
set CanadaProductCodesCSVFile = %8
set DiscontinuedProductCodesCSVFile = %9
set ManufactureCodesCSVFile = %10
set Top100DEVSearchProductCodesCSVFile = %11
set ProductcodesWithReviewscsv = %12
set rampup = %13
set threads =%14
set loop = %15


del -f %resultsFile%
del -f %resultsFileSummary%

call jmeter.bat -JPROTOCOL=https -JBASE_URL=%baseUrl% -JVersionNumber=%versionNumber% -JRESULTS_FILE=%resultsFile% -JProductCodesCSVFile=%ProductcodesCsvFile% -JBidContractReferenceNumbersCSVFile=%BidContractReferenceNumbersCSVFile%  -JCanadaProductCodesCSVFile=%CanadaProductCodesCSVFile% -JDiscontinuedProductCodesCSVFile=%DiscontinuedProductCodesCSVFile% -JPRODUCTCODES_CSVFILE=%ProductcodesCsvFile% -JManufactureCodesCSVFile=%ManufactureCodesCSVFile% -JTop100DEVSearchProductCodesCSVFile=%Top100DEVSearchProductCodesCSVFile% -JProductcodesWithReviewscsv=%ProductcodesWithReviewscsv% -JRAMPUP=%rampup% -JTHREADS=%threads%  -JLOOP=%loop% -n -t %testPlanFile%
call JMeterPluginsCMD.bat --generate-csv %resultsFileSummary% --input-jtl %resultsFile% --plugin-type AggregateReport