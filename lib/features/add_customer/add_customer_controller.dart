import 'package:get/get.dart';
import 'package:retailcore_pos/core/database/database_helper.dart';
import 'package:retailcore_pos/features/new_sales/new_sales_controller.dart';

class AddCustomerController extends GetxController{

  DatabaseHelper obj=DatabaseHelper();
  NewSalesController nC=Get.find<NewSalesController>();

  Future<void> addCustomer(String n, String p) async{
    nC.showTotal();
    final cId=await obj.addCustomerDb(n,p);
    await obj.addStockMovementCustomerDb(cId,nC.total.value);
    await obj.addSalesDb(cId,nC.total.value);
    await obj.updateProductDb(nC.productsQuantity);
  }


}

