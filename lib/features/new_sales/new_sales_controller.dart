import 'package:get/get.dart';
import 'package:retailcore_pos/core/database/database_helper.dart';

class NewSalesController extends GetxController{

  DatabaseHelper obj=DatabaseHelper();
  RxList<Map<String,dynamic>> productsQuantity=<Map<String,dynamic>>[].obs;
  RxList<Map<String,dynamic>> products=<Map<String,dynamic>>[].obs;
  RxList<int> screenQuantityDisplay=<int>[].obs;
  RxInt total=0.obs;
  @override
  void onInit(){
    super.onInit();
    showProducts();
  }

  Future<void> showProducts() async{
    products.value= await obj.getProductDb();
    screenQuantityDisplay.value=List.filled(products.length,0);
    showTotal();
  }

  void showTotal(){
    total.value=0;
    for(int i=0;i<productsQuantity.length;i++){
      total=total+(productsQuantity[i]["QUANTITY"]*products[productsQuantity[i]["INDEX"]]["PRICE"]);
    }
  }

}

