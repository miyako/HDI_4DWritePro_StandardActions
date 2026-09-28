Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		If (Application version:C493<Form.minimumVersion)
			
			Form.quit:=True:C214
			OBJECT SET TITLE:C194(*; "BtnDemo"; Localized string("BtnClose"))
			OBJECT SET VISIBLE:C603(*; "TxtSorry@"; True:C214)
			OBJECT SET VISIBLE:C603(*; "TxtInfo@"; False:C215)
			
		Else 
			
			Form.quit:=False:C215
			
		End if 
		
End case 
