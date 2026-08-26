import 'package:get/get.dart';
import 'package:retailcore_pos/core/database/database_helper.dart';

class CustomerController extends GetxController{

  DatabaseHelper obj=DatabaseHelper();
  RxList<Map<String,dynamic>> customers=<Map<String,dynamic>>[].obs;

  @override
  void onInit(){
    super.onInit();
    showCustomers();
  }

  Future<void> showCustomers() async{
    customers.value= await obj.getCustomersDb();
  }

  Future<void> deleteCustomer(int id) async{
    await obj.deleteCustomerDb(id);
  }
}

