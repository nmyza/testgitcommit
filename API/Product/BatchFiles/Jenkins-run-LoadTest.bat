@echo off

set testPlanFile=%1
set resultsFile=%2
set resultsFileSummary=%3
set baseUrl=%4
set versionNumber=%5
set rampup=%6
set threads=%7
set loop=%8
rem set ProductCodesCSVFile=%9
rem set BidContractReferenceNumbersCSVFile=%10
rem set CanadaProductCodesCSVFile=%11
rem set DiscontinuedProductCodesCSVFile=%12
rem set ManufactureCodesCSVFile=%13
rem set Top100DEVSearchProductCodesCSVFile=%14
rem set ProductcodesWithReviewscsv=%15


del -f %resultsFile%
del -f %resultsFileSummary%

rem call jmeter.bat -JPROTOCOL=https -JBASE_URL=%baseUrl% -JVersionNumber=%versionNumber% -JRESULTS_FILE=%resultsFile% -JProductCodesCSVFile=%ProductcodesCsvFile% -JBidContractReferenceNumbersCSVFile=%BidContractReferenceNumbersCSVFile%  -JCanadaProductCodesCSVFile=%CanadaProductCodesCSVFile% -JDiscontinuedProductCodesCSVFile=%DiscontinuedProductCodesCSVFile% -JPRODUCTCODES_CSVFILE=%ProductcodesCsvFile% -JManufactureCodesCSVFile=%ManufactureCodesCSVFile% -JTop100DEVSearchProductCodesCSVFile=%Top100DEVSearchProductCodesCSVFile% -JProductcodesWithReviewscsv=%ProductcodesWithReviewscsv% -JRAMPUP=%rampup% -JTHREADS=%threads%  -JLOOP=%loop% -n -t %testPlanFile%
call jmeter.bat -JPROTOCOL=https -JBASE_URL=%baseUrl% -JVersionNumber=%versionNumber% -JRESULTS_FILE=%resultsFile% -JRAMPUP=%rampup% -JTHREADS=%threads%  -JLOOP=%loop% -n -t %testPlanFile%
call JMeterPluginsCMD.bat --generate-csv %resultsFileSummary% --input-jtl %resultsFile% --plugin-type AggregateReport