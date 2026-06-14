# Version 2 - Product Detail and Upload Flow

## Objective
This version improves the marketplace app by adding a product detail screen and a product upload flow. It keeps the core login and product list from version 1.

## Intention
The app now supports viewing details about a product and submitting a new product. The main purpose is to add useful navigation and extend the app’s functionality while preserving the earlier foundation.

This version is designed to help users interact more meaningfully with the marketplace. By adding details and upload capabilities, we want to make it easier for people to share information about their items, compare options, and publish new listings so that the app can support a growing local exchange community.

## Work Plan
- Keep the login screen from v1
- Add a detailed product view page
- Add a product upload flow with a simple form
- Use a stateful main page to support adding new products

## How It Works
- The user logs in and reaches the main product list
- Tapping a product opens a detail page with product information
- The floating action button opens a product upload form
- Submitted products appear in the list after upload

## Changes from Version 1
- Added product detail page with name, description, price, and seller
- Added upload product screen with fields for name, description, and price
- Switched main page to a stateful workflow to support adding new products
- Introduced more realistic navigation beyond the initial screen

## How to Run
1. Open this folder in a terminal
2. Run `flutter pub get`
3. Run `flutter run`

## Notes
This version still uses local app state only and does not include the chat or profile screens yet.
