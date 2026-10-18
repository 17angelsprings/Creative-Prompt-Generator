## GEN PROMPTS BUTTON .GD
## ********************************************************************************
## Enables/disables general prompts
## Checked on by default
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
## None
## ********************************************************************************

## FUNCTIONS
## ********************************************************************************

## Called when the node enters the scene tree for the first time.
## @params: None
## @return: None
func _ready() -> void:
	pass
	
## Button is pressed/checked on or off
## @params: None
## @return: None
func _on_pressed() -> void:
	# Button is on
	if button_pressed == true:
		ParametersGlobals.gen_prompts_enabled = true
	else:
		# User tries to turn button off; check if adult prompts button is pressed/checked on
		# This prevents having both buttons turned off at the same time
		if ParametersGlobals.adult_prompts_enabled == true:
			ParametersGlobals.gen_prompts_enabled = false
		else:
			button_pressed = true
