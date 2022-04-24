import 'package:get/get.dart';
import '../../Module-API/api_service.dart';

class ProductController extends GetxController{
  var isLoading = true.obs;
  var productList = [].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = (await ApiService.fetchProducts())?.result;
      print(products);
      if (products != null) {
        Rx(productList.value = products);
      }
    } finally {
      isLoading(false);
    }
  }
}