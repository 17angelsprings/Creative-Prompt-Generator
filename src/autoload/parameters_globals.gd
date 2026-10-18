## PARAMETERS GLOBALS .GD
## ********************************************************************************
## Holds different parameters different elements of the program will need (e.g. prompts enabled or character names)
## ********************************************************************************

## ASSOCIATED SCENES
## ********************************************************************************
## None
## ********************************************************************************

## EXTENSIONS
## ********************************************************************************
extends Node
## ********************************************************************************

## SCRIPT-WIDE VARIABLES
## ********************************************************************************
var gen_prompts_enabled
var adult_prompts_enabled
var character1_name
var character2_name
## ********************************************************************************

## FUNCTIONS
## ********************************************************************************

## Called when the node enters the scene tree for the first time.
## @params: None
## @return: None
func _ready() -> void:
	gen_prompts_enabled = true
	adult_prompts_enabled = false
	character1_name = ""
	character2_name = ""


## Called every frame. 'delta' is the elapsed time since the previous frame.
## @params: None
## @return: None
func _process(delta: float) -> void:
	pass
