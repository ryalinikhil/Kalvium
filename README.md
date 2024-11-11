PDF Co-Viewer App

This iOS app provides a synchronized PDF viewing experience using Firebase Firestore for real-time updates. The app has two roles: Admin and Viewer.
The Admin can control the page displayed, and all viewers follow along automatically.

Demo Video Link: https://drive.google.com/file/d/1sUksbXvEalapwwb8zDrV2eq99vQArCy4/view?usp=sharing

 <img width="1352" alt="Screenshot 2024-11-12 at 1 40 53 AM" src="https://github.com/user-attachments/assets/6440a01e-c4f1-4a6d-b1a9-a28f5cf2af97">

Features

	•	Real-time PDF synchronization: The app synchronizes page navigation between an Admin and multiple Viewers using Firebase Firestore.
	•	Role-based access: Users can select a role (Admin or Viewer) upon entering the app.
	•	Passcode Protection: Admin access requires a 6-digit passcode, enhancing security.
	•	User-friendly Interface: The app includes a clean design with iOS-style buttons and a numeric keypad for Admin passcode entry.

Packages Used

	•	Firebase SDK (Firestore, FirebaseApp): Used to store and retrieve the current page number for synchronized viewing across devices.
	•	SwiftUI: Provides a modern UI with native components.
	•	PDFKit: Enables viewing, scrolling, and navigating within PDF documents.


