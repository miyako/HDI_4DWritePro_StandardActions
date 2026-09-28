
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		If (Contextual click:C713)
			// Display my contextual menu defined in the "On load" form
			Dynamic pop up menu:C1006(menuContext)
		End if 
		
End case 