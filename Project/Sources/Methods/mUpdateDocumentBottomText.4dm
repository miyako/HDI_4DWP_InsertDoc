//%attributes = {}
C_LONGINT:C283($vTotalPage; $vStartRange; $vEndRange; $vStartRangeTempo; $vCharTotal; $vEndRangeTempo; $vCharSelected)
C_OBJECT:C1216($wpRange; $wpRangeTempo)

If (OB Is defined:C1231(wpDoc1))
	$vTotalPage:=WP Get page count:C1412(wpDoc1)
	
	$wpRange:=WP Selection range:C1340(wpDoc1)
	If (OB Is defined:C1231($wpRange; "rangeStart"))
		
		$vStartRange:=OB Get:C1224($wpRange; "rangeStart")
		$vEndRange:=OB Get:C1224($wpRange; "rangeEnd")
		
		$wpRangeTempo:=WP Text range:C1341(wpDoc1; wk start text:K81:165; wk end text:K81:164)
		$vStartRangeTempo:=OB Get:C1224($wpRangeTempo; "rangeStart")
		$vEndRangeTempo:=OB Get:C1224($wpRangeTempo; "rangeEnd")
		
		$vCharTotal:=$vEndRangeTempo-$vStartRangeTempo
		
		$wpRangeTempo:=WP Selection range:C1340(wpDoc1)
		$vStartRange:=OB Get:C1224($wpRangeTempo; "rangeStart")
		$vEndRange:=OB Get:C1224($wpRangeTempo; "rangeEnd")
		
		
		$vCharSelected:=$vEndRange-$vStartRange
		
		vDocumentBottomText:="Number of pages: "+Char:C90(Tab:K15:37)+Char:C90(Tab:K15:37)+String:C10($vTotalPage)+"."+Char:C90(Carriage return:K15:38)+"Number of characters: "+Char:C90(Tab:K15:37)+String:C10($vCharSelected)+Char:C90(Tab:K15:37)+"/ "+String:C10($vCharTotal)
	End if 
End if 