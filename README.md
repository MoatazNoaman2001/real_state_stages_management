# Real State Management Stages

A Flutter desktop/web application for managing real estate project stages and customer tracking.

## Features

- **Customer Management** - Add, edit, view, and delete customers with full details
- **Stage Tracking** - Track customers through multiple project stages (Licenses, Excavation, Execution, Modifications, Meters, Road Work, Rooftop)
- **Dashboard** - Overview with stats, recent customers, and quick-add functionality
- **Inspections & Supervision** - Manage inspections and supervision records

## Customer Fields

Each customer record includes:
- Customer name, owner name
- Plot number, project number
- Phone number
- Address (stored within notes)
- Username & password (account credentials)
- Current stage, notes

## Tech Stack

- **Flutter** (Windows desktop / Web)
- **PostgreSQL** database
- **BLoC** pattern for state management
- **Freezed** for immutable data models
- **GetIt** for dependency injection

## Getting Started

1. Ensure Flutter is installed and configured for desktop/web
2. Set up a PostgreSQL database and configure connection in `lib/core/config/database_config.dart`
3. Run code generation:
   ```bash
   flutter pub run build_runner build
   ```
4. Run the app:
   ```bash
   flutter run -d windows
   ```
