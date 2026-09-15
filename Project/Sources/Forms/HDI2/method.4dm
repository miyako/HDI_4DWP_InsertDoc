
Case of 
	: (Form event code:C388=On Load:K2:1)
		
		init_HDI
		
		wpDoc2:=WP New:C1317
		
	: (Form event code:C388=On Page Change:K2:54)
		
		$path:=Get 4D folder:C485(Current resources folder:K5:16)+"doc.4wp"
		wpDoc1:=WP Import document:C1318($path)
		
		$currentPage:=FORM Get current page:C276
		Case of 
			: ($currentPage=2)
				//Create a default selection 
				WP SELECT:C1348(wpDoc1; wk start text:K81:165; 387)
			: ($currentPage=3)
				ALL RECORDS:C47([Countries:1])
			: ($currentPage=5)
				$path:=Get 4D folder:C485(Current resources folder:K5:16)+"doc2.4wp"
				wpDoc3:=WP Import document:C1318($path)
		End case 
		
		
		// update bottom document text for the number of page /characaters 
		mUpdateDocumentBottomText
		
		
End case 
