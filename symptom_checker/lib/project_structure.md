# Project Structure (a bit outdated)

## Directories:

### lib/
	- main.dart
		- Application entry point.
		- Homepage with all category buttons.
		- Button to go to the selected symptoms page.

### components/
	- bodypart_components.dart
		- Contains `bodypartbutton`, `bodypartpage`, and `addsymptomcard`.
		- Handles the functionality for viewing and adding all symptoms from a specific body part.
	- body_selector.dart (deprecated)
		- Image with coordinate selection-based navigation.
	- category_components.dart
		- Contains `categorybutton` and `categorypage`.
		- Handles functionality for viewing all body parts for a specific category.
	- selected_symptoms_components.dart
		- Contains `allsymptomsbutton`, `allsymptomspage`, and `deletesymptomcard`.
		- Handles functionality for viewing and removing selected symptoms.

### models/
	- data_store.dart
		- Contains `datastore` class, which currently stores all categories, body parts, symptoms, and their image locations.
	- location_store.dart (deprecated)
		- Supports coordinate selection navigation.
	- selected_symptoms_store.dart
		- Contains the event handler for adding symptoms to a list.

### utility/
	- button_util.dart
		- Contains home button to return to the homepage.
	- footer_util.dart
		- Contains footer, which has a home button and all symptoms button.
	- grid_util.dart
		- Contains the `autogrid`, which adjusts depending on screen size.
	- image_button_util.dart
		- Contains the `imagebutton`, which returns an icon depending on the input identifier.
