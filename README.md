# SheSafe

**SheSafe** is a specialized safety application designed to enhance the security and well-being of female students and faculty on college campuses. The app integrates advanced technologies like Firebase, IoT wearable devices, AI-based gender and emotion detection, and the Aadhaar API to provide robust security features and emergency response mechanisms.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Architecture](#architecture)
- [Installation](#installation)
- [Usage](#usage)
- [Screenshots](#screenshots)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Introduction

SheSafe is developed with the mission to offer a safe environment for women on college campuses. The app provides tools for secure communication, real-time location tracking, and instant access to emergency services. With the help of IoT devices, AI models, and secure verification through Aadhaar, SheSafe ensures that users can seek help swiftly and efficiently in times of need.

## Features

- **Emergency Alerts:** Quickly send an emergency alert to pre-configured contacts or campus security.
- **IoT Wearable Integration:** Connect with a wearable device for instant alerts and real-time tracking.
- **AI-Based Detection:** Uses AI to detect gender and emotional states through connected CCTV cameras on campus.
- **Secure Verification:** Leverages the Aadhaar API for secure and authenticated access.
- **Real-time Chat:** Communicate with campus security or trusted contacts through a secure messaging system.
- **Location Tracking:** Share your real-time location with trusted contacts during an emergency.
- **Automatic Alerts:** Alerts are sent automatically if unusual activity is detected by the wearable device or AI systems.

## Technology Stack

### Frontend
- **Flutter**: Cross-platform app development
- **Dart**: Programming language for Flutter

### Backend
- **Firebase**: Real-time database and authentication
- **Aadhaar API**: Secure authentication and verification
- **Python**: Backend logic and AI model integration

### IoT and AI
- **Arduino**: IoT wearable device for alerts and tracking
- **TensorFlow/Keras**: AI model training for emotion and gender detection

### Additional Tools
- **Google Maps API**: Location services
- **Firebase Cloud Messaging (FCM)**: Push notifications

## Architecture

![SheSafe Architecture](path_to_architecture_diagram.png)

1. **User Authentication**: Secure login through Firebase and Aadhaar API.
2. **Real-Time Database**: All user data, emergency contacts, and location data are stored in Firebase.
3. **IoT Integration**: Wearable devices connected through Bluetooth or Wi-Fi for real-time data exchange.
4. **AI Processing**: Emotion and gender detection models running on campus CCTV feeds, integrated with the app.
5. **Emergency Response**: Real-time alerts sent to security or emergency contacts based on AI triggers or user actions.

## Installation

### Prerequisites
- **Flutter SDK**: [Install Flutter](https://flutter.dev/docs/get-started/install)
- **Android Studio or Xcode**: For running the app on an emulator or physical device
- **Firebase Account**: Set up Firebase for authentication and database
- **Aadhaar API Access**: Obtain API keys for Aadhaar verification

### Steps to Install

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/shesafe.git
   cd shesafe
   cd calculator
