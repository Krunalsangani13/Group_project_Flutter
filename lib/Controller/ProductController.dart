import 'package:get/get.dart';
import '../Api_Services/ApiServices.dart';
import '../Model/ProductModel.dart';

class ProductController extends GetxController {
  RxBool isLoading = false.obs;
  var response = ProductModel().obs;

  // Function to fetch products from the API
  Future<void> getProductsCont() async {
    isLoading(true);
    final respo = await ApiServices().product();
    if (respo.responseCode == "1") {
      response.value = respo;
      print("Fetched Products: ${response.value.message}");
    }
    isLoading(false);
  }
}
