
Case of 
	: (Form event code:C388=On Load:K2:1)
		initHDI
		
		// create menu for push button (See example 4)
		menu:=Create menu:C408
		//insert menu item
		APPEND MENU ITEM:C411(menu; Localized string:C991("HDI2_BtnToggleRuler"))
		SET MENU ITEM PROPERTY:C973(menu; -1; Associated standard action:K56:1; "visibleHorizontalRuler")
		
		// create a contextual menu for 4D Write Pro area (See example 6)
		menuContext:=Create menu:C408
		//insert menu item
		APPEND MENU ITEM:C411(menuContext; ak cut:K76:53)
		SET MENU ITEM PROPERTY:C973(menuContext; -1; Associated standard action:K56:1; ak cut:K76:53)
		
		APPEND MENU ITEM:C411(menuContext; ak copy:K76:54)
		SET MENU ITEM PROPERTY:C973(menuContext; -1; Associated standard action:K56:1; ak copy:K76:54)
		
		APPEND MENU ITEM:C411(menuContext; ak paste:K76:55)
		SET MENU ITEM PROPERTY:C973(menuContext; -1; Associated standard action:K56:1; ak paste:K76:55)
		
		APPEND MENU ITEM:C411(menuContext; "-")
		
		APPEND MENU ITEM:C411(menuContext; Localized string:C991("MenuItemStyle"))
		SET MENU ITEM PROPERTY:C973(menuContext; -1; Associated standard action:K56:1; "fontStyle")
		
		APPEND MENU ITEM:C411(menuContext; Localized string:C991("HDI2_BtnToggleRuler"))
		SET MENU ITEM PROPERTY:C973(menuContext; -1; Associated standard action:K56:1; "visibleHorizontalRuler")
		
		
	: (Form event code:C388=On Page Change:K2:54)
		// set focus to 4D Write Pro area
		OBJECT SET VISIBLE:C603(*; "WParea"; (FORM Get current page:C276>1))
		GOTO OBJECT:C206(*; "WParea")
		
		Var:=TextTabControl{FORM Get current page:C276}
		
	: (Form event code:C388=On Unload:K2:2)
		// release menu
		RELEASE MENU:C978(menu)
		RELEASE MENU:C978(menuContext)
		
End case 

