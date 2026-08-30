# 🛍️ RetailCore POS Flutter

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart">
  <img src="https://img.shields.io/badge/GetX-8A2BE2?style=for-the-badge&logoColor=white" alt="GetX">
  <img src="https://img.shields.io/badge/SQLite-003B57?style=for-the-badge&logo=sqlite&logoColor=white" alt="SQLite">
</p>

<p align="center">
  <b>Offline Inventory & Point-of-Sale (POS) System</b>
</p>

<p align="center">
  A Flutter application for managing products, suppliers, customers, stock movements, sales, invoices, and sales reports with local SQLite storage.
</p>

---

## ✨ Highlights

- 🛒 Product-based POS sales
- 📦 Product and inventory management
- 👨‍💼 Supplier management
- 👥 Customer management
- 🔄 Stock In and Stock Out records
- 🧾 Invoice and cart workflow
- 💰 Sales total calculation
- 📊 Sales history
- 📅 Daily sales reports
- 💾 Local SQLite database
- 📱 Flutter-based user interface

---

## 🚀 Features

### 📦 Product Management

- Add products
- View products
- Update product information
- Delete products
- Store product name, quantity, price, and barcode

### 👨‍💼 Supplier Management

- Add suppliers
- View suppliers
- Delete suppliers
- Store supplier name and phone number
- Record supplier-related Stock In movements

### 👥 Customer Management

- Add customers
- View customers
- Delete customers
- Store customer name and phone number
- Connect customers with sales and Stock Out records

### 🛒 New Sales & Cart

- Browse available products
- Add products to the cart
- Increase and decrease cart quantities
- View selected products
- Calculate the total bill
- Continue the sale with customer information

### 🧾 Invoice

- Display selected products
- Display quantities and prices
- Display total bill amount
- Provide a receipt-saving workflow

### 📚 Sales History

- View previously recorded sales
- Display sale ID
- Display customer ID
- Display total amount
- Display transaction date
- Calculate total sales

### 📅 Daily Sales Report

- Display sales for the current day
- Filter transactions by stored date
- Display customer IDs and amounts
- Calculate today's total sales

### 🔄 Stock Movements

The application records inventory movements including:

- Stock In
- Stock Out
- Product ID
- Supplier ID
- Customer ID
- Quantity
- Price
- Date

---

## 🛠️ Built With

| Technology | Used For |
|---|---|
| ![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat-square&logo=flutter&logoColor=white) | Application development |
| ![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat-square&logo=dart&logoColor=white) | Programming language |
| ![GetX](https://img.shields.io/badge/GetX-8A2BE2?style=flat-square) | State management |
| ![SQLite](https://img.shields.io/badge/SQLite-003B57?style=flat-square&logo=sqlite&logoColor=white) | Local data storage |
| `sqflite` | SQLite integration |
| `path` | Database path handling |

---

## 💾 Local Database

RetailCore POS stores application data locally in SQLite.

### Database Tables

```text
PRODUCTS
SUPPLIERS
CUSTOMERS
SALES
STOCK_MOVEMENTS
```

### PRODUCTS

```text
ID
NAME
QUANTITY
PRICE
BARCODE
```

### SUPPLIERS

```text
ID
NAME
PHONE
```

### CUSTOMERS

```text
ID
NAME
PHONE
```

### SALES

```text
ID
CUSTOMER_ID
TOTAL_AMOUNT
DATE
```

### STOCK_MOVEMENTS

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
Products
   ↓
New Sale
   ↓
Cart
   ↓
Customer
   ↓
Invoice
   ↓
Sales History / Daily Sales Report
```

Inventory-related records can also be maintained through supplier and customer stock movements.

---

## 🎨 Interface

The application provides screens for:

- 🏠 Home
- 📦 Products
- ➕ Add Product
- 👨‍💼 Suppliers
- 👥 Customers
- 🛒 New Sale
- 🛍️ Cart
- 🧾 Invoice
- 📚 Sales History
- 📅 Daily Sales Report

---

## ⚙️ Getting Started

### Prerequisites

Make sure you have:

- Flutter SDK
- Dart SDK
- Android Studio or another Flutter-supported IDE
- Android emulator or physical Android device

### 1. Clone the repository

```bash
git clone https://github.com/dev-ASamad/retailcore_pos_flutter.git
```

### 2. Open the project

```bash
cd retailcore_pos_flutter
```

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Run the application

```bash
flutter run
```

---

## 🔍 Check the Project

Run Flutter's analyzer:

```bash
flutter analyze
```

Run tests:

```bash
flutter test
```

---

## 📂 Main Project Areas

```text
lib/
├── core/
│   ├── database/
│   └── widgets/
│
├── features/
│   ├── add_customer/
│   ├── customer/
│   ├── daily_sales_report/
│   ├── invoice/
│   ├── new_sales/
│   ├── sales_history/
│   ├── supplier/
│   └── ...
│
└── main.dart
```

---

## 📌 Project Status

🟢 **Active Development**

The project is being developed as part of a Flutter Developer internship task at **OWASoft Technologies Pvt. Ltd.**

---

## 👨‍💻 Author

**Abdul Samad**

Flutter Developer Intern  
OWASoft Technologies Pvt. Ltd.

---

## 📄 License

This project is licensed under the **MIT License**.

See the [LICENSE](LICENSE) file for details.

---

<p align="center">
  <b>RetailCore POS</b>
  <br>
  Built with ❤️ using Flutter & Dart
</p>
