@echo off

set testPlanFile=%1
set resultsFile=%2
set resultsFileSummary=%3
set baseUrl=%4
set versionNumber = %5
set ProductcodesCsvFile = %6
set rampup = %7
set threads =%8
set loop = %9


del -f %resultsFile%
del -f %resultsFileSummary%

call jmeter.bat -JPROTOCOL=https -JBASE_URL=%baseUrl% -JVersionNumber=%versionNumber% -JRESULTS_FILE=%resultsFile% -JPRODUCTCODES_CSVFILE=%ProductcodesCsvFile% -JRAMPUP=%rampup% -JTHREADS=%threads%  -JLOOP=%loop% -n -t %testPlanFile%
call JMeterPluginsCMD.bat --generate-csv %resultsFileSummary% --input-jtl %resultsFile% --plugin-type AggregateReport