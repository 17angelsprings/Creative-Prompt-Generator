## SETTINGS GLOBALS .GD
## ********************************************************************************
## Configures starting parameters when booting up program (namely prompt type buttons checked)
## ********************************************************************************

## ASSOCIATED SCENES
## ********************************************************************************
## none
## ********************************************************************************

## EXTENSIONS
## ********************************************************************************
extends Node
## ********************************************************************************

## SCRIPT-WIDE VARIABLES
## ********************************************************************************
var gen_prompts_enabled
var adult_prompts_enabled

## FUNCTIONS
## ********************************************************************************

# Called when the node enters the scene tree for the first time.
# @params: None
# @return: None
func _ready() -> void:
	gen_prompts_enabled = true
	adult_prompts_enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
