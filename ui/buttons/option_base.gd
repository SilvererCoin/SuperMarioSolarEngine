@tool
@abstract
class_name OptionBase
extends UIButton

var setting: String:
	set(val):
		var key := val.get_slice("/", 1)
		setting = key

## Variant typed so extended classes can set their own type.
var value: Variant = false


func _ready():
	if Engine.is_editor_hint():
		return

	super()

	LocalSettings.connect(&"setting_changed", update_value)

	# Initialise button
	var saved_val: Variant = LocalSettings.load_setting(
		LocalSettings.get_section(setting), setting
	)
	update_value(setting, saved_val)


func update_value(key: String, new_value: Variant = null):
	# If the entered key doesn't relate to the button running this code
	if key != setting:
		return

	value = new_value

	_update_button()


func change_setting(new_value):
	if setting.is_empty():
		return

	LocalSettings.change_setting(
		LocalSettings.get_section(setting),
		setting,
		new_value
	)


func _get_property_list() -> Array[Dictionary]:
	if not Engine.is_editor_hint():
		return []

	var all_keys: PackedStringArray = []

	for section in LocalSettings.settings:
		for key in LocalSettings.settings[section]:
			all_keys.append("%s/%s" % [section, key])

	return [
		{
			"name": "setting",
			"type": TYPE_STRING,
			"hint": PROPERTY_HINT_ENUM,
			"hint_string": ",".join(all_keys),
			"usage": PROPERTY_USAGE_DEFAULT,
		},
	]


## Overwritten by the parent class.[br]
## Defines how the option's text is displayed.
@abstract
func _update_button()
