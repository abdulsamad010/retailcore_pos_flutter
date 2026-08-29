import 'package:get/get.dart';
import 'package:retailcore_pos/core/database/database_helper.dart';

class SalesHistoryController extends GetxController{

  @override
  void onInit(){
    super.onInit();
    showSales();
  }

  DatabaseHelper db=DatabaseHelper();

  RxList<Map<String,dynamic>> sales=<Map<String,dynamic>>[].obs;
  RxInt total=0.obs;

  void showSales()async{
    sales.value=await db.showSalesDb();
    total.value=0;
    for(int i=0;i<sales.length;i++){
      total.value=total.value+sales[i]["TOTAL_AMOUNT"] as int;
    }
  }
}