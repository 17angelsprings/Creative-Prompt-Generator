## GENERATED PROMPT .GD
## ********************************************************************************
## 
## ********************************************************************************

## ASSOCIATED SCENES
## ********************************************************************************
## MainScreen.tcsn
## ********************************************************************************

## EXTENSIONS
## ********************************************************************************
extends TextEdit
## ********************************************************************************

## SCRIPT-WIDE VARIABLES
## ********************************************************************************
var character1_name
var character2_name
## ********************************************************************************

## FUNCTIONS
## ********************************************************************************

## Generates prompt based on character name(s).
## No characters -> Do nothing.
## One character only -> Use solo prompts.
## Two characters -> Use couple prompts.
## @params: None
## @return: None
func _on_generate_button_pressed() -> void:
	character1_name = ParametersGlobals.character1_name
	character2_name = ParametersGlobals.character2_name
	
	# No characters
	if character1_name == "" and character2_name == "":
		print("Nothing")
	# Character 1 only
	elif character1_name != "" and character2_name == "":
		print(character1_name)
	# Character 2 only
	elif character1_name == "" and character2_name != "":
		print(character2_name)
	# Two characters
	else:
		print(character1_name," ",character2_name)
