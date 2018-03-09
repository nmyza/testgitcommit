@echo off

set testPlanFile=%1
set resultsFile=%2
set resultsFileSummary=%3
set baseUrl=%4
set versionNumber = %5
set rampup = %6
set threads =%7
set loop = %8


del -f %resultsFile%
del -f %resultsFileSummary%

call jmeter.bat -JPROTOCOL=https -JBASE_URL=%baseUrl% -JVersionNumber=%versionNumber% -JRESULTS_FILE=%resultsFile% -JRAMPUP=%rampup% -JTHREADS=%threads%  -JLOOP=%loop% -n -t %testPlanFile%
call JMeterPluginsCMD.bat --generate-csv %resultsFileSummary% --input-jtl %resultsFile% --plugin-type AggregateReport