
* Table of Contents:-

- Installation
- Features
- Project Structure
- Technologies Used
- Usage


Installation:- 

* Prerequisites:
- macOS with the latest version of Xcode installed.
- Swift version 5.x or higher.
- Active internet connection.

* Steps:
1. Clone the repository:
   git clone https://github.com/amrzayed/WeatherApp.git
2. open WeatherApp.xcodeproj

* Features:-

- Fetches real-time weather data for a given city.
- Displays detailed weather information.
- Manages a list of favorite cities.
- Error handling for network and API issues.

* Technologies Used:-

- SwiftUI
- Combine
- REST API
- JSON Parsing

Project Structure

<img width="335" alt="Screenshot 2024-12-10 at 2 38 53 PM" src="https://github.com/user-attachments/assets/001e8181-824f-4d2e-a90b-944bbe7416fa">



* Clean Architecture Overview

Clean Architecture is a design pattern that separates the codebase into multiple layers to ensure scalability, testability, and maintainability. Each layer has a specific responsibility and interacts with other layers through well-defined contracts (interfaces/protocols).
Layers in Clean Architecture:
1. Presentation Layer
2. Domain Layer
3. Data Layer


1. Presentation Layer:-
This layer is responsible for:
- Displaying the UI: Showing the user interface and handling user interactions.

--> Components in WeatherApp:-
-> Views:
 HomeView: The main view where users enter a city name, view weather details, and manage favorite cities.
-> Reusable Components:
- CityNameInput: Handles text input.
- FavoriteCitiesList: Displays a list of favorite cities.
- ErrorView, LoadingView: Handle specific states like errors and loading.
-> ViewModel:
- Example: HomeViewModel handles UI state, interacts with the Domain Layer, and provides data to the View.
-> Communication
- The View listens to changes in the ViewModel via @ObservedObject.
- The ViewModel uses the Domain Layer (Use Cases) to fetch or process data.

2. Domain Layer:-
The Domain Layer is independent of external frameworks. It encapsulates all business logic and defines the application's core functionalities.

-> Responsibilities:-
- Business Logic:
Use Cases execute specific tasks (e.g., HomeUseCase fetches weather details for a city).
- Contracts:
Defines interfaces/protocols for repositories that the Data Layer must implement.
Example: HomeRepositoryContract.

--> Communication:
- The ViewModel in the Presentation Layer calls Use Cases for specific business operations.
- Use Cases call the Repository Contract, ensuring the Domain Layer remains unaware of implementation details.


3. Data Layer:-
This layer is responsible for fetching, storing, and managing raw data. It provides the data needed by the Domain Layer in a structured form.
* Responsibilities:-
  
1) Data Models:
- Define the structure of the raw data (e.g., JSON response from the API).
- Example: WeatherModel, FavoriteCity.
2) Remote Data Source:
- Responsible for API/network communication.
- Example: HomeRemoteDataSource.
3) Repository Implementation:
- Implements the Repository Contract defined in the Domain Layer.
- Example: HomeRepositoryImpl.

--> Communication:
* The Repository Implementation (HomeRepositoryImpl) interacts with:
- Remote Data Source: Fetches data from the API.
- Domain Layer: Returns processed data through the HomeRepositoryContract.
