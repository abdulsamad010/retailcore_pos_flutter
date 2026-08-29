import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:retailcore_pos/features/add_product/add_product_screen.dart';
import 'package:retailcore_pos/features/customer/customer_controller.dart';
import 'package:retailcore_pos/features/customer/customer_screen.dart';
import 'package:retailcore_pos/features/new_sales/new_sales_controller.dart';
import 'package:retailcore_pos/features/sales_history/sales_history_controller.dart';

import '../../core/widgets/custom_app_bar.dart';
import '../daily_sales_report/daily_sales_report_controller.dart';
import '../daily_sales_report/daily_sales_report_screen.dart';
import '../new_sales/new_sales_screen.dart';
import '../product/product_controller.dart';
import '../product/product_screen.dart';
import '../sales_history/sales_history_screen.dart';
import '../stock_movement/stock_movement_controller.dart';
import '../stock_movement/stock_movement_screen.dart';
import '../supplier/supplier_controller.dart';
import '../supplier/supplier_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> listOptions=["Products",
    "Stock In / Out",
    "Customers",
    "Suppliers",
    "New Sale (POS)",
    "Sales History",
    "Daily Sales Reports",
    "Add Product"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(name: "RetailCore POS"),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent,width: 1),borderRadius: BorderRadius.circular(5)),padding: EdgeInsets.all(8),child: Text("Offline Inventory & Point-of-Sale System",style: TextStyle(color: Colors.greenAccent,fontWeight: FontWeight.bold,fontSize: 20),))),
            SizedBox(height: 8,),
            Expanded(
              child: GridView.builder(itemCount: listOptions.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 3,crossAxisCount: 2), itemBuilder: (context,index){
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.greenAccent,Colors.white],begin: AlignmentGeometry.bottomCenter,end: AlignmentGeometry.center),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blueAccent,width: 1,),
                  ),
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  child:GestureDetector(
                    onTap: (){
                      if(index==0){
                        Get.delete<ProductController>();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductScreen()));
                      }
                      else if(index==1){
                        Get.delete<StockMovementController>();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>StockMovementScreen()));
                      }
                      else if(index==2){
                        Get.delete<CustomerController>();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomerScreen()));
                      }
                      else if(index==3){
                        Get.delete<SupplierController>();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SupplierScreen()));
                      }
                      else if(index==4){
                        Get.delete<NewSalesController>();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>NewSalesScreen()));
                      }
                      else if(index==5){
                        Get.delete<SalesHistoryController>();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SalesHistoryScreen()));
                      }
                      else if(index==6){
                        Get.delete<DailySalesReportController>();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DailySalesReportScreen()));
                      }
                      else if(index==7){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProductScreen()));
                      }
                    },
                    child:  Center(child: Text("${listOptions[index]}")),
                    ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
