## Adult PROMPTS BUTTON .GD
## ********************************************************************************
## Enables/disables adult/18+ prompts
## Checked off by default
## ********************************************************************************

## ASSOCIATED SCENES
## ********************************************************************************
## MainScreen.tcsn
## ********************************************************************************

## EXTENSIONS
## ********************************************************************************
extends CheckButton
## ********************************************************************************

## SCRIPT-WIDE VARIABLES
## ********************************************************************************
# None

## FUNCTIONS
## ********************************************************************************

# Button is pressed/checked on or off
# @params: None
# @return: None
func _on_pressed() -> void:
	# Button is on
	if button_pressed == true:
		PromptsEnabledGlobals.adult_prompts_enabled = true
	else:
		# User tries to turn button off; check if adult prompts button is pressed/checked on
		# This prevents having both buttons turned off at the same time
		if PromptsEnabledGlobals.gen_prompts_enabled == true:
			PromptsEnabledGlobals.adult_prompts_enabled = false
		else:
			button_pressed = true
