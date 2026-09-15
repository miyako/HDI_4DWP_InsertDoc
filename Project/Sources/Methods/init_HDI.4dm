//%attributes = {"invisible":true}
// load descriptions

ARRAY TEXT:C222(TabControl; 0)
ARRAY OBJECT:C1221(TextTabControl; 0)

var $json : Collection

If (Get database localization:C1009(Current localization:K5:22)="ja")
	$json:=JSON Parse:C1218(Folder:C1567(fk resources folder:K87:11).file("init_Table-ja.json").getText(); Is collection:K8:32)
Else 
	$json:=JSON Parse:C1218(Folder:C1567(fk resources folder:K87:11).file("init_Table-en.json").getText(); Is collection:K8:32)
End if 

$json:=$json.orderBy("SampleSort")
COLLECTION TO ARRAY:C1562($json; TabControl; "Title"; TextTabControl; "Text")

//ALL RECORDS([init_Table])
//ORDER BY([init_Table]; [init_Table]SampleSort)
//SELECTION TO ARRAY([init_Table]Title; TabControl)
//SELECTION TO ARRAY([init_Table]Text; TextTabControl)
//UNLOAD RECORD([init_Table])

If (ds:C1482.Countries.getCount()=0)
	
	$path:=File:C1566("/RESOURCES/Countries.4ie").platformPath
	$project:=File:C1566("/RESOURCES/Countries.4si").getText()
	
	IMPORT DATA:C665($path; $project)
	
End if 

Var1:=OB Copy:C1225(TextTabControl{1})
Var2:=OB Copy:C1225(TextTabControl{2})
Var3:=OB Copy:C1225(TextTabControl{3})
Var4:=OB Copy:C1225(TextTabControl{4})
Var5:=OB Copy:C1225(TextTabControl{5})

var $platform : Integer
_O_PLATFORM PROPERTIES:C365($platform)

If ($platform=Windows:K25:3)
	ST SET ATTRIBUTES:C1093(Var1; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 14)
	ST SET ATTRIBUTES:C1093(Var2; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 14)
End if 



var $path : Text
$path:=Get 4D folder:C485(Current resources folder:K5:16)+"doc.4wp"
wpDoc1:=WP Import document:C1318($path)
wpDoc2:=WP New:C1317
lineBreak:=1
bReplace:=1
bInclude:=1
mUpdateDocumentBottomText
