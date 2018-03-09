@echo off

set testPlanFile=%1
set resultsFile=%2
set resultsFileSummary=%3
set baseUrl=%4
set versionNumber = %5
set rampup = %6
set threads =%7
set loop = %8
set ProductCodesCSVFile = %9
set BidContractReferenceNumbersCSVFile = %10
set CanadaProductCodesCSVFile = %11
set DiscontinuedProductCodesCSVFile = %12
set ManufactureCodesCSVFile = %13
set Top100DEVSearchProductCodesCSVFile = %14
set ProductcodesWithReviewscsv = %15


del -f %resultsFile%
del -f %resultsFileSummary%

call jmeter.bat -JPROTOCOL=https -JBASE_URL=%baseUrl% -JVersionNumber=%versionNumber% -JRESULTS_FILE=%resultsFile% -JProductCodesCSVFile=%ProductcodesCsvFile% -JBidContractReferenceNumbersCSVFile=%BidContractReferenceNumbersCSVFile%  -JCanadaProductCodesCSVFile=%CanadaProductCodesCSVFile% -JDiscontinuedProductCodesCSVFile=%DiscontinuedProductCodesCSVFile% -JPRODUCTCODES_CSVFILE=%ProductcodesCsvFile% -JManufactureCodesCSVFile=%ManufactureCodesCSVFile% -JTop100DEVSearchProductCodesCSVFile=%Top100DEVSearchProductCodesCSVFile% -JProductcodesWithReviewscsv=%ProductcodesWithReviewscsv% -JRAMPUP=%rampup% -JTHREADS=%threads%  -JLOOP=%loop% -n -t %testPlanFile%
call JMeterPluginsCMD.bat --generate-csv %resultsFileSummary% --input-jtl %resultsFile% --plugin-type AggregateReport