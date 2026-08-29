import 'package:get/get.dart';
import 'package:retailcore_pos/core/database/database_helper.dart';

class DailySalesReportController extends GetxController{
  DatabaseHelper db=DatabaseHelper();

  RxList<Map<String,dynamic>> sales=<Map<String,dynamic>>[].obs;
  RxList<Map<String,dynamic>> sales1=<Map<String,dynamic>>[].obs;
  RxInt total=0.obs;

  @override
  void onInit(){
    super.onInit();
    showSales();
  }

  void showSales()async{
    sales1.value=await db.showSalesDb();
    sales.clear();
    for(int j=0;j<sales1.length;j++){
    if(sales1[j]["DATE"].substring(0,10)=="${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2,'0')}-${DateTime.now().day.toString().padLeft(2,'0')}"){
      sales.add(sales1[j]);
    }}

    total.value=0;
    for(int i=0;i<sales.length;i++){
      total.value=total.value+sales[i]["TOTAL_AMOUNT"] as int;
    }
  }
}