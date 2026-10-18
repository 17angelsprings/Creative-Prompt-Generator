## CHARACTER1 NAME .GD
## ********************************************************************************
## 
## ********************************************************************************

## ASSOCIATED SCENES
## ********************************************************************************
## none
## ********************************************************************************

## EXTENSIONS
## ********************************************************************************
extends LineEdit
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
	text = "" # Ensures text field is blank by default


## Called every frame. 'delta' is the elapsed time since the previous frame.
## @params: None
## @return: None
func _process(delta: float) -> void:
	ParametersGlobals.character1_name = text # Extracts character name from text field 
