# PineamiteApp

**PineamiteApp** is a modern iOS application designed to enhance your rally racing experience. Whether you're a fan, participant, or organizer, this app serves as your interactive companion, providing live event insights and seamless access to key rally data in real time.

<br>
<img width="300" height="652" alt="Screenshot" src="https://github.com/user-attachments/assets/2150bfdc-6b40-447f-89a8-0f4ea2373628" />
<img width="300" height="652" alt="Screenshot" src="https://github.com/user-attachments/assets/1f4b1b12-553b-4fc2-830e-36f672979755" />
<img width="300" height="652" alt="Screenshot" src="https://github.com/user-attachments/assets/0f9c4737-33a2-454d-b579-8151f2dcc4d5" />


## Features

- **Live Entry List**
  - View detailed driver and co-driver information
  - Filter entries by championship or car class
  - See car models, teams, and rally numbers

- **Stage Navigation**
  - Integrated rally map with stage tracking (coming soon)
  - Easy access to team locations and check-in points

- **Video Center**
  - Quick access to race videos and highlights
  - Capture and upload rally moments (camera support included)

- **Points & Rankings**
  - Follow championship points and positions
  - Driver/co-driver stats updated dynamically

- **Interactive UI**
  - Custom curved tab bar with elevated action button
  - Vibrant, rally-themed visuals and a clean modern layout
  - Designed with Gilroy font family for a polished look

## Architecture

The app follows a scalable modular architecture:

```
PineamiteApp/
│
├── App/
│   └── Resources/          # Fonts and assets
│
├── Packages/
│   ├── Base/
│   │   ├── Domain/         # Core models and use cases
│   │   └── Theme/          # Typography, spacing, and theming
│   │
│   ├── Features/
│   │   ├── EntryList/      # Entry list UI and logic
│   │   └── RallyMap/       # Map and location features
│   │
│   └── Infrastructure/
│       ├── DesignSystem/   # Reusable UI components
│       └── Networking/     # API and data fetching
```

## Fonts & Design

- Font: **Gilroy** (Black, Bold, SemiBold, Medium, Regular)
- Typography and colors centralized in the `Theme` module

## Deployment

- Minimum iOS Version: 15.0
- Built using SwiftUI
- Modular Package-Based Project (SPM)

## Getting Started

1. Clone the repository
2. Open `PineamiteApp.xcodeproj`
3. Run on an iPhone Simulator or real device with iOS 15+
4. Ensure `Fonts` are bundled correctly by checking `Build Phases` > `Copy Bundle Resources`

## Future Roadmap

- Real-time stage timing and GPS location
- User login and profile management
- Push notifications for live rally updates
- Community and leaderboard features

