@echo off

set resultsFileSummary=%1
set testSuite=%2
set performanceResultsToSplunkFile=%3
set baseUrl=%4
set environment=%5


call casperjs.exe test --web-security=no --ignore-ssl-errors=true %performanceResultsToSplunkFile% --filename=%resultsFileSummary% --module=%testSuite% --baseUrl=%baseUrl% --testEnvironment=%environment% --apiname=Product