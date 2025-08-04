# PineamiteApp

**PineamiteApp** is a modern iOS application designed to enhance your rally racing experience. Whether you're a fan, participant, or organizer, this app serves as your interactive companion, providing live event insights and seamless access to key rally data in real time.

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

## iPhone Recording
Click to play video

<a href="https://github.com/user-attachments/assets/fe0779d1-53b3-4acf-842e-ac16f7d790a6">
<img width="300" height="652" alt="Dashboard Video" src="https://github.com/user-attachments/assets/1977cc61-88b0-4303-89db-d7281504d20a" />  
</a>




## iPhone Screenshots
<img width="300" height="652" alt="Dashboard" src="https://github.com/user-attachments/assets/1977cc61-88b0-4303-89db-d7281504d20a" />
<img width="300" height="652" alt="EntryList_SheetDown" src="https://github.com/user-attachments/assets/157ef61e-7daa-4081-b61b-7b8f3f0102ba" />
<img width="300" height="652" alt="EntryList_SheetUp" src="https://github.com/user-attachments/assets/fac8e2b4-085a-4705-bb3b-7e50900507b6" />
<img width="300" height="652" alt="SideMenu" src="https://github.com/user-attachments/assets/20b46eb6-28d3-4773-aed4-d07ec1322fe7" />
<img width="300" height="652" alt="SideMenu2" src="https://github.com/user-attachments/assets/332a3c9e-90f6-49f1-b996-103a59270247" />
<img width="300" height="652" alt="Profile" src="https://github.com/user-attachments/assets/de186dc8-a0ef-46b5-b697-bda8f1b4612e" />

## iPad Screenshots
<img width="450" height="648" alt="iPad Dashboard" src="https://github.com/user-attachments/assets/9d673fbf-c420-444f-b7dc-28db24eb5bab" />
<img width="450" height="648" alt="iPad EntryList_SheetDown" src="https://github.com/user-attachments/assets/2ab0c6ee-1889-4b27-8422-6a65b455bc18" />
<img width="450" height="648" alt="iPad EntryList_SheetUp" src="https://github.com/user-attachments/assets/f7443f6c-2ef3-4c87-8589-52fc7b77e3d7" />
<img width="450" height="648" alt="iPad Menu" src="https://github.com/user-attachments/assets/d053bd6b-a776-45b3-b2ac-85c095b1827d" />
<img width="450" height="648" alt="iPad  Menu2" src="https://github.com/user-attachments/assets/3e47b2d8-7a88-4e20-ab30-057153b79649" />
<img width="450" height="648" alt="iPad  Profile" src="https://github.com/user-attachments/assets/4d59f23b-905c-4948-9a60-1d2aa8c9a71c" />

## Relation Daigram
<img width="700" height="700" alt="RelationDaigram" src="https://github.com/user-attachments/assets/01ae14cb-7bdb-4094-83db-e11bbb0e7e19" />

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

