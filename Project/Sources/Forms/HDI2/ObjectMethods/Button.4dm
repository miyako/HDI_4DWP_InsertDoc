//%attributes = {"invisible":true}
var $wpRange : Object
//get the range from the user selection
$wpRange:=WP Selection range:C1340(wpDoc1)


var $mode; $extensionRange : Integer
//define the mode according radio button 

var $break : Integer

Case of 
	: (lineBreak=1)
		$break:=wk line break:K81:186
	: (sectionBreak=1)
		$break:=wk section break:K81:187
	: (pageBreak=1)
		$break:=wk page break:K81:188
End case 

Case of 
	: (bReplace=1)
		$mode:=wk replace:K81:177
	: (bAppend=1)
		$mode:=wk append:K81:179
	: (bPrepend=1)
		$mode:=wk prepend:K81:178
	Else 
		//default if issues occures
		$mode:=wk replace:K81:177
End case 

Case of 
	: (bInclude=1)
		$extensionRange:=wk include in range:K81:180
	: (bExclude=1)
		$extensionRange:=wk exclude from range:K81:181
	Else 
		//default if issues occures
		$extensionRange:=wk include in range:K81:180
End case 

WP Insert break:C1413($wpRange; $break; $mode; $extensionRange)

// create a selection in the document in order to see the difference in the insertion mode.
WP SELECT:C1348(*; "WriteProArea"; $wpRange)

// give the focus to the 4D Write Pro area
GOTO OBJECT:C206(*; "WriteProArea")

// update bottom document text for the number of page /characaters 
mUpdateDocumentBottomText

