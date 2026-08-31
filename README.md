# 🛍️ RetailCore POS Flutter

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart">
  <img src="https://img.shields.io/badge/GetX-8A2BE2?style=for-the-badge&logoColor=white" alt="GetX">
  <img src="https://img.shields.io/badge/SQLite-003B57?style=for-the-badge&logo=sqlite&logoColor=white" alt="SQLite">
  <img src="https://img.shields.io/badge/Barcode%20Scanner-FF9800?style=for-the-badge&logoColor=white" alt="Barcode Scanner">
</p>

<p align="center">
  <b>Offline Inventory & Point-of-Sale (POS) System</b>
</p>

<p align="center">
  A Flutter-based mobile application for managing products, inventory, suppliers, customers, sales, invoices, and sales reports using local SQLite storage.
</p>

---

## ✨ Highlights

- 🛒 Product-based sales management
- 📦 Product and inventory management
- 👨‍💼 Supplier management
- 👥 Customer management
- 📥 Stock In records
- 📤 Stock Out records
- 🧾 Cart and invoice workflow
- 💰 Automatic sales total calculation
- 📚 Sales history
- 📅 Daily sales reports
- 🔎 Barcode scanning for product search
- 🗑️ Barcode-based product deletion
- 💾 Offline local SQLite database
- 📱 Mobile-friendly Flutter interface

---

## 🚀 Features

### 📦 Product Management

RetailCore POS provides basic product management functionality.

- ➕ Add products
- 👀 View products
- ✏️ Update product information
- 🗑️ Delete products
- 🏷️ Store product barcode
- 📊 Store product quantity
- 💰 Store product price
- 📝 Store product name

Product information includes:

```text
ID
NAME
QUANTITY
PRICE
BARCODE
```

---

### 🔎 Barcode Product Search

The application includes barcode scanning using the mobile device camera.

The current barcode functionality is specifically used for:

- 📷 Opening the mobile camera scanner
- 🔎 Scanning a product barcode
- 🔤 Reading the barcode value
- 🔍 Searching for the matching product in the local database
- 👀 Displaying the matching product
- 🗑️ Allowing the matching product to be deleted

> **Note:** Barcode scanning is currently implemented for searching a specific product and accessing that product for deletion.

---

### 👨‍💼 Supplier Management

Supplier-related functionality includes:

- ➕ Add suppliers
- 👀 View suppliers
- 🗑️ Delete suppliers
- 📱 Store supplier phone numbers
- 📥 Record supplier-related Stock In movements

Supplier information includes:

```text
ID
NAME
PHONE
```

---

### 👥 Customer Management

Customer-related functionality includes:

- ➕ Add customers
- 👀 View customers
- 🗑️ Delete customers
- 📱 Store customer phone numbers
- 🧾 Connect customers with sales
- 📤 Record customer-related Stock Out movements

Customer information includes:

```text
ID
NAME
PHONE
```

---

### 🛒 New Sales & Cart

The sales workflow allows products to be selected and managed before completing a sale.

- 📦 Browse available products
- ➕ Add products to the cart
- ⬆️ Increase cart quantity
- ⬇️ Decrease cart quantity
- 👀 View selected products
- 💰 Calculate the total bill
- 👥 Continue the sale with customer information

---

### 🧾 Invoice

The invoice screen displays the information related to the current sale.

It includes:

- 📦 Selected products
- 🔢 Product quantities
- 💰 Product prices
- 🧾 Total bill amount
- 💾 Receipt-saving workflow

---

### 📚 Sales History

Sales History provides access to previously recorded sales.

It displays:

- 🆔 Sale ID
- 👥 Customer ID
- 💰 Total amount
- 📅 Transaction date
- 💵 Overall sales total

---

### 📅 Daily Sales Report

The Daily Sales Report displays sales recorded for the current day.

It includes:

- 🆔 Sale ID
- 👥 Customer ID
- 💰 Sale amount
- 📅 Sale date
- 📊 Total sales for today

The report uses the stored transaction date to identify sales belonging to the current day.

---

### 🔄 Stock Movements

The application records inventory movements for products.

Supported movement types include:

- 📥 **Stock In**
- 📤 **Stock Out**

Stock movement records contain:

```text
ID
PRODUCT_ID
SUPPLIER_ID
CUSTOMER_ID
QUANTITY
PRICE
TYPE
DATE
```

---

## 🛠️ Built With

| Technology | Purpose |
|---|---|
| ![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat-square&logo=flutter&logoColor=white) | Mobile application development |
| ![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat-square&logo=dart&logoColor=white) | Programming language |
| ![GetX](https://img.shields.io/badge/GetX-8A2BE2?style=flat-square) | State management |
| ![SQLite](https://img.shields.io/badge/SQLite-003B57?style=flat-square&logo=sqlite&logoColor=white) | Local database |
| `sqflite` | SQLite database integration |
| `path` | Database path handling |
| `mobile_scanner` | Mobile barcode scanning |

---

## 💾 Local Database

RetailCore POS uses a local SQLite database to store application data.

The database currently contains the following tables:

```text
PRODUCTS
SUPPLIERS
CUSTOMERS
SALES
STOCK_MOVEMENTS
```

### 📦 PRODUCTS

```text
ID
NAME
QUANTITY
PRICE
BARCODE
```

### 👨‍💼 SUPPLIERS

```text
ID
NAME
PHONE
```

### 👥 CUSTOMERS

```text
ID
NAME
PHONE
```

### 💰 SALES

```text
ID
CUSTOMER_ID
TOTAL_AMOUNT
DATE
```

### 🔄 STOCK_MOVEMENTS

```text
ID
PRODUCT_ID
SUPPLIER_ID
CUSTOMER_ID
QUANTITY
PRICE
TYPE
DATE
```

---

## 📱 Application Flow

```text
🏠 Home
   │
   ├── 📦 Products
   │      │
   │      ├── ➕ Add Product
   │      ├── ✏️ Update Product
   │      ├── 🗑️ Delete Product
   │      └── 🔎 Barcode Search
   │
   ├── 👨‍💼 Suppliers
   │      └── 📥 Stock In
   │
   ├── 👥 Customers
   │      └── 📤 Stock Out
   │
   └── 🛒 New Sale
          │
          ├── 🛍️ Cart
          │
          ├── 👥 Customer
          │
          └── 🧾 Invoice
                 │
                 ├── 📚 Sales History
                 │
                 └── 📅 Daily Sales Report
```

---

## 🎨 Application Screens

The project currently contains screens/features for:

| Screen | Purpose |
|---|---|
| 🏠 Home | Main application dashboard |
| 📦 Products | View and manage products |
| ➕ Add Product | Add new products |
| 🔎 Barcode Search | Find a product using its barcode |
| 👨‍💼 Suppliers | Manage suppliers |
| 👥 Customers | Manage customers |
| 🛒 New Sales | Start a new sale |
| 🛍️ Cart | Manage selected products |
| 🧾 Invoice | Display the current invoice |
| 📚 Sales History | View recorded sales |
| 📅 Daily Sales Report | View today's sales |

---

## 🖼️ App Logo

The application logo is stored inside the project at:

```text
assets/logo/app_logo.png
```

The same logo is used as the application's branding and launcher icon.

---

## 💾 Offline Storage

RetailCore POS is designed around local data storage.

The implemented product, supplier, customer, stock movement, and sales information is stored locally using SQLite.

This allows the core implemented data operations to work without requiring an internet connection.

---

## 📂 Project Structure

```text
retailcore_pos_flutter/
│
├── android/
├── assets/
│   └── logo/
│       └── app_logo.png
│
├── lib/
│   │
│   ├── core/
│   │   ├── database/
│   │   │   └── database_helper.dart
│   │   │
│   │   └── widgets/
│   │       └── custom_app_bar.dart
│   │
│   ├── features/
│   │   │
│   │   ├── add_customer/
│   │   ├── add_product/
│   │   ├── barcode/
│   │   ├── cart/
│   │   ├── customer/
│   │   ├── daily_sales_report/
│   │   ├── home/
│   │   ├── invoice/
│   │   ├── new_sales/
│   │   ├── product/
│   │   ├── sales_history/
│   │   ├── splash/
│   │   ├── stock_movement/
│   │   └── supplier/
│   │
│   └── main.dart
│
├── test/
├── pubspec.yaml
├── pubspec.lock
├── analysis_options.yaml
├── .gitignore
├── LICENSE
└── README.md
```

---

## ⚙️ Getting Started

### 📋 Prerequisites

Before running the project, make sure you have:

- Flutter SDK installed
- Dart SDK installed
- Android Studio or another Flutter-supported IDE
- Android emulator or physical Android device
- Android SDK configured

---

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/abdulsamad010/retailcore_pos_flutter.git
```

---

### 2️⃣ Navigate to the Project

```bash
cd retailcore_pos_flutter
```

---

### 3️⃣ Install Dependencies

```bash
flutter pub get
```

---

### 4️⃣ Run the Application

```bash
flutter run
```

---

## 🔍 Project Verification

### Analyze the Project

Run Flutter's analyzer:

```bash
flutter analyze
```

### Run Tests

```bash
flutter test
```

### Build Release APK

```bash
flutter build apk --release
```

The generated release APK can be found at:

```text
build/app/outputs/flutter-apk/app-release.apk
```

---

## 📱 Android Usage

The application is intended to run on Android devices.

For barcode scanning:

1. Open the Barcode Search screen.
2. Tap **Open Barcode Scanner**.
3. Allow camera access if requested.
4. Point the mobile camera at a supported barcode.
5. The scanner reads the barcode value.
6. The application searches the local product database.
7. If a matching product exists, its information is displayed.
8. The product can then be accessed for deletion.

---

## 🔐 Data Storage

The application stores its operational data locally.

Current stored information includes:

```text
Products
Suppliers
Customers
Sales
Stock Movements
```

No online database or cloud synchronization is required for the currently implemented local data functionality.

---

## 📌 Project Status

🟢 **Active Development**

RetailCore POS is being developed as part of a Flutter Developer internship task at:

**OWASoft Technologies Pvt. Ltd.**

The project is focused on building an offline mobile POS and inventory application using Flutter and SQLite.

---

## 🔮 Possible Future Improvements

Future versions may include:

- 🔎 More advanced product searching
- 📊 More detailed sales analytics
- 📅 Additional report filters
- 🧾 Improved invoice and receipt formatting
- 💾 Database backup and restore
- ☁️ Optional cloud synchronization
- 📱 Additional barcode-related workflows
- 🎨 Further user-interface improvements

---

## 👨‍💻 Author

**Abdul Samad**

Flutter Developer Intern  
**OWASoft Technologies Pvt. Ltd.**

---

## 🔗 Repository

The project repository is available on GitHub:

**RetailCore POS Flutter**

```text
https://github.com/abdulsamad010/retailcore_pos_flutter
```

---

## 📄 License

This project is licensed under the **MIT License**.

See the [LICENSE](LICENSE) file for the complete license text.

---

<p align="center">
  <b>🛍️ RetailCore POS</b>
  <br>
  Offline Inventory & Point-of-Sale System
  <br><br>
  Built with ❤️ using Flutter & Dart
</p>
