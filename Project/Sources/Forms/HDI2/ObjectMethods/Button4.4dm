//%attributes = {"invisible":true}
var $pageCount : Integer
$pageCount:=WP Get page count:C1412(wpDoc3)


If ($pageCount>1)
	ALERT:C41(Replace string(Localized string("AlertPageCountPlural"); "{count}"; String:C10($pageCount)))
Else 
	ALERT:C41(Replace string(Localized string("AlertPageCountSingular"); "{count}"; String:C10($pageCount)))
End if 