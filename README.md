# Taxi Tera

Mobile-only Flutter app for guiding users through public taxi routes in Addis Ababa.

**Not a ride-hailing app** — it's a simple, reliable route finder using predefined static data.

## Core Features
- Select From/To stops from Firestore (dynamic, no hardcoding)
- View available routes with transfers, estimated price & duration
- Step-by-step instructions on detail screen
- Save favorite routes (requires login)
- Firebase Auth (email + Google Sign-In)

## Design Philosophy
- Static-first: All routes/stops predefined in Firestore
- No live maps or external APIs → low cost, high reliability
- Public read access for browsing, private saves for users
- Simple & defensible architecture (ideal for academic/project demo)

## Tech Stack
- Flutter (Dart)
- Firebase: Authentication + Firestore + (optional) Storage for maps
- No custom backend server

## How to Run
1. `flutter pub get`
2. Set up Firebase project (use your own or ask me)
3. `flutter run`

## Demo Video
[Link coming tomorrow – full walkthrough]

Built by Eyob Ketemaw – Addis Ababa taxi commuter helper.
## Screenshots

### Route Detail Screen
![Route Detail Screen](https://github.com/Eyobketemaw/taxi_tera/blob/main/screenshots/detail.png?raw=true)

### Home Screen (example)
![Home Screen](https://raw.githubusercontent.com/Eyobketemaw/taxi_tera/main/screenshots/home.png)

### Route Results Screen
![Route Results](https://raw.githubusercontent.com/Eyobketemaw/taxi_tera/main/screenshots/results.png)
