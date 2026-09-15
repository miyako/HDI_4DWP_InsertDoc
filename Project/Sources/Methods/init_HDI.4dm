//%attributes = {}
// load descriptions

ARRAY TEXT:C222(TabControl; 0)
ARRAY OBJECT:C1221(TextTabControl; 0)

If (ds:C1482.init_Table.getCount()=0)
	If (Get database localization:C1009(Current localization:K5:22)="ja")
		$path:=File:C1566("/RESOURCES/init_Table-ja.4ie").platformPath
	Else 
		$path:=File:C1566("/RESOURCES/init_Table-en.4ie").platformPath
	End if 
	$project:=File:C1566("/RESOURCES/init_Table.4si").getText()
	IMPORT DATA:C665($path; $project)
End if 

If (ds:C1482.Countries.getCount()=0)
	$path:=File:C1566("/RESOURCES/Countries.4ie").platformPath
	$project:=File:C1566("/RESOURCES/Countries.4si").getText()
	IMPORT DATA:C665($path; $project)
End if 

ALL RECORDS:C47([init_Table:3])
ORDER BY:C49([init_Table:3]; [init_Table:3]SampleSort:4)
SELECTION TO ARRAY:C260([init_Table:3]Title:2; TabControl)
SELECTION TO ARRAY:C260([init_Table:3]Text:3; TextTabControl)
UNLOAD RECORD:C212([init_Table:3])

TabControl:=0
Var1:=OB Copy:C1225(TextTabControl{1})
Var2:=OB Copy:C1225(TextTabControl{2})
Var3:=OB Copy:C1225(TextTabControl{3})
Var4:=OB Copy:C1225(TextTabControl{4})
Var5:=OB Copy:C1225(TextTabControl{5})

C_LONGINT:C283($platform)
_O_PLATFORM PROPERTIES:C365($platform)

If ($platform=Windows:K25:3)
	ST SET ATTRIBUTES:C1093(Var1; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 14)
	ST SET ATTRIBUTES:C1093(Var2; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 14)
End if 

C_TEXT:C284($path)
$path:=Get 4D folder:C485(Current resources folder:K5:16)+"doc.4wp"
wpDoc1:=WP Import document:C1318($path)
wpDoc2:=WP New:C1317
lineBreak:=1
bReplace:=1
bInclude:=1
mUpdateDocumentBottomText