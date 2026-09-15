$pageCount:=WP Get page count:C1412(wpDoc3)


If ($pageCount>1)
	ALERT:C41("There are "+String:C10($pageCount)+" pages in your document.")
Else 
	ALERT:C41("There is only "+String:C10($pageCount)+" page in your document.")
End if 