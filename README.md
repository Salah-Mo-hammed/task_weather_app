# pro_task_weather_app
# Helps you manage your tasks while staying updated with the weather.

Key Features:

This application seamlessly integrates two core functionalities: task management and weather data. Users can perform a range of task-related actions, including adding, editing, deleting, and searching for specific tasks, all of which are securely stored in Firebase Firestore.

For weather functionality, users can choose to grant location permissions for automatic weather updates or manually enter a city name to retrieve current weather data. A unique aspect of the app is its ability to link weather conditions with each task, providing contextual information that enhances the user experience. This contextual data is stored alongside each task in Firestore, ensuring relevant information is always at hand.

Additionally, the app is being integrated with Firebase Authentication, enabling secure user logins that ensure personalized task and weather management.

Architecture:

Both the task management and weather functionalities are implemented as separate components following Clean Architecture principles, promoting maintainability and scalability within the application.
