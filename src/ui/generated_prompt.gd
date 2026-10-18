## GENERATED PROMPT .GD
## ********************************************************************************
## Uses character names and prompt rating parameters and generates a prompt from one of the prompt lists
## ********************************************************************************

## ASSOCIATED SCENES
## ********************************************************************************
## MainScreen.tcsn
## ********************************************************************************

## EXTENSIONS
## ********************************************************************************
extends RichTextLabel
## ********************************************************************************

## SCRIPT-WIDE VARIABLES
## ********************************************************************************
var character1_name
var character2_name

var gen_prompts_enabled
var adult_prompts_enabled

var text_format
var file
var json
var data
var prompt_num
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
	gen_prompts_enabled = ParametersGlobals.gen_prompts_enabled
	adult_prompts_enabled = ParametersGlobals.adult_prompts_enabled
	
	# No characters
	if character1_name == "" and character2_name == "":
		text = "Error: Both character name fields are blank. Please add in the name of at least one character."
	# Character 1 only
	elif character1_name != "" and character2_name == "":
		generate_solo_prompt(gen_prompts_enabled, adult_prompts_enabled, character1_name)
	# Character 2 only
	elif character1_name == "" and character2_name != "":
		generate_solo_prompt(gen_prompts_enabled, adult_prompts_enabled, character2_name)
	# Two characters
	else:
		generate_couple_prompt(gen_prompts_enabled, adult_prompts_enabled, character1_name, character2_name)

## Generates solo character prompt.
## @params: 
## - gen_prompts_enabled: bool that indicates whether gen prompts are allowed
## - adult_prompts_enabled: bool that indicates whether adult prompts are allowed
## - character_name: string for character name
## @return: None
func generate_solo_prompt(gen_prompts_enabled: bool, adult_prompts_enabled: bool, character_name: String) -> void:
	text_format = "Warning: %s\n\n%s%s"
	# Choose between gen/adult
	if choose_prompt_rating(gen_prompts_enabled, adult_prompts_enabled) == "gen":
		file = FileAccess.open("res://src/prompts/gen_solo_prompts.json", FileAccess.READ)
		json = file.get_as_text()
		data = JSON.parse_string(json)
		prompt_num = randi() % data.size()
		text = text_format % [data[prompt_num]["content warning"],character_name,data[prompt_num]["prompt"]]
		file.close()
	else:
		file = FileAccess.open("res://src/prompts/adult_solo_prompts.json", FileAccess.READ)
		json = file.get_as_text()
		data = JSON.parse_string(json)
		prompt_num = randi() % data.size()
		text = text_format % [data[prompt_num]["content warning"],character_name,data[prompt_num]["prompt"]]
		file.close()

## Generates couple character prompts.
## @params: 
## - gen_prompts_enabled: bool that indicates whether gen prompts are allowed
## - adult_prompts_enabled: bool that indicates whether adult prompts are allowed
## - character1_name: string for first character name
## - character2_name: string for second character name
## @return: None
func generate_couple_prompt(gen_prompts_enabled: bool, adult_prompts_enabled: bool, character1_name: String, character2_name: String) -> void:
	text_format = "Warning: %s\n\n%s %s %s%s"
	# Choose between gen/adult
	if choose_prompt_rating(gen_prompts_enabled, adult_prompts_enabled) == "gen":
		file = FileAccess.open("res://src/prompts/gen_couple_prompts.json", FileAccess.READ)
		json = file.get_as_text()
		data = JSON.parse_string(json)
		prompt_num = randi() % data.size()
		text = text_format % [data[prompt_num]["content warning"],character1_name,data[prompt_num]["prompt part 1"],character2_name,data[prompt_num]["prompt part 2"]]
		file.close()
	else:
		file = FileAccess.open("res://src/prompts/adult_couple_prompts.json", FileAccess.READ)
		json = file.get_as_text()
		data = JSON.parse_string(json)
		prompt_num = randi() % data.size()
		text = text_format % [data[prompt_num]["content warning"],character1_name,data[prompt_num]["prompt part 1"],character2_name,data[prompt_num]["prompt part 2"]]
		file.close()
	
## Logic that chooses between general and adult prompts.
## @params: 
## - gen_prompts_enabled: bool that indicates whether gen prompts are allowed
## - adult_prompts_enabled: bool that indicates whether adult prompts are allowed
## @return: String that either says "gen" or "adult"
## - "gen" if strictly gen prompts are enabled or RNG chooses 0
## - "adult" if strictly adult prompts are enabled or RNG chooses 1
func choose_prompt_rating(gen_prompts_enabled: bool, adult_prompts_enabled: bool) -> String:
	# If only gen prompts are enabled
	if gen_prompts_enabled == true and adult_prompts_enabled == false:
		return "gen"
	# If only adult prompts are enabled
	elif gen_prompts_enabled == false and adult_prompts_enabled == true:
		return "adult"
	# If both are enabled
	else:
		var num = randi() % 2 # Randomly chooses between 0 and 1
		if num == 0:
			return "gen" # Gen prompts chosen
		else:
			return "adult" # Adult prompts chosen
