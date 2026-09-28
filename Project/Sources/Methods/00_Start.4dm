//%attributes = {}
#DECLARE($params : Object)

var $splashWindowTitle : Text
var $window; $i; $x; $y; $bottom; $right : Integer
var $options : Object
$splashWindowTitle:=""

If (Count parameters:C259=0)
	
	ARRAY LONGINT($windows; 0)
	WINDOW LIST($windows)
	
	For ($i; 1; Size of array($windows))
		$window:=$windows{$i}
		If (Window process($window)=1) && (Get window title($window)=$splashWindowTitle)
			GET WINDOW RECT($x; $y; $bottom; $right; $window)
			CALL FORM($window; Formula(SET WINDOW RECT($x; $y; $bottom; $right; $window)))
			return 
		End if 
	End for 
	
	CALL WORKER(1; Current method name:C684; {})
	
Else 
	
	SET MENU BAR(1)
	
	$options:=New object
	$options.title:=Localized string("HDI_Title")
	$options.info:=Localized string("HDI_Info")
	$options.minimumVersion:="1630"  // 1630 = 4D v16 R3
	
	$window:=Open form window:C675("HDI"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
	SET WINDOW TITLE($splashWindowTitle; $window)
	DIALOG:C40("HDI"; $options; *)
	
End if 
