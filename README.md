# RetailCore POS Flutter

A Flutter-based offline Point of Sale (POS) and inventory management application designed to manage products, customers, suppliers, sales, stock movements, invoices, and sales reports using a local SQLite database.

## Overview

RetailCore POS is an offline-first retail management application developed with Flutter.

The application provides a simple interface for managing daily retail operations without requiring an internet connection. Data is stored locally using SQLite, while GetX is used for state management and controller-based application logic.

## Features

### Product Management
- Add new products
- View available products
- Update product information
- Delete products
- Store product name, quantity, price, and barcode

### Supplier Management
- Add suppliers
- View suppliers
- Delete suppliers
- Store supplier name and phone number
- Record stock-in movements associated with suppliers

### Customer Management
- Add customers
- View customers
- Delete customers
- Store customer name and phone number
- Associate customers with sales and stock-out movements

### New Sales
- Browse available products
- Add products to cart
- Increase and decrease product quantities
- Track selected products
- Calculate the total bill
- Select customer information for sales

### Cart and Invoice
- Display selected products and quantities
- Calculate and display total amount
- Display invoice information
- Provide a receipt-saving workflow

### Sales History
- Display previously recorded sales
- Show sale ID, customer ID, total amount, and date
- Calculate total sales

### Daily Sales Report
- Filter sales according to the current date
- Display today's sales
- Calculate total sales for the day

### Stock Movement
Records stock movements such as:
- Stock In
- Stock Out
- Product ID
- Supplier ID
- Customer ID
- Quantity
- Price
- Date

## Technology Stack

- Flutter - Application development
- Dart - Programming language
- GetX - State management and dependency management
- SQLite - Local database
- sqflite - SQLite integration
- path - Database path management
- Material UI - User interface

## Database

The application uses a local SQLite database named `myDb.db`.

Tables:
- PRODUCTS
- SUPPLIERS
- CUSTOMERS
- SALES
- STOCK_MOVEMENTS

### PRODUCTS
- ID
- NAME
- QUANTITY
- PRICE
- BARCODE

### SUPPLIERS
- ID
- NAME
- PHONE

### CUSTOMERS
- ID
- NAME
- PHONE

### SALES
- ID
- CUSTOMER_ID
- TOTAL_AMOUNT
- DATE

### STOCK_MOVEMENTS
- ID
- PRODUCT_ID
- SUPPLIER_ID
- CUSTOMER_ID
- QUANTITY
- PRICE
- TYPE
- DATE

## Architecture

The application uses a simple feature-based architecture:

Screen
↓
Controller
↓
Database Helper
↓
SQLite Database

GetX is used for reactive state management and dependency management.

## Getting Started

### Prerequisites
- Flutter SDK
- Dart SDK
- Android Studio or another Flutter-supported IDE
- Android emulator or physical Android device

### Installation

Clone the repository:

git clone https://github.com/abdulsamad010/retailcore_pos_flutter.git

Move into the project directory:

cd retailcore_pos_flutter

Install dependencies:

flutter pub get

Run the application:

flutter run

## Development

Check the project for issues:

flutter analyze

Run tests:

flutter test

## Offline Support

RetailCore POS is designed around local data storage. Core product, customer, supplier, sales, and stock-management data is stored in SQLite on the device.

## Future Improvements

- Product search and filtering
- Barcode scanning
- Improved invoice and receipt formatting
- PDF receipt generation
- More detailed inventory reports
- Sales filtering by date range
- Dashboard statistics
- Authentication and user roles
- Backup and restore functionality
- Improved responsive UI
- Cloud synchronization

## License

This project is licensed under the MIT License.

See the LICENSE file for details.

## Author

Developed as part of an internship project at OWASoft Technologies Pvt. Ltd.
