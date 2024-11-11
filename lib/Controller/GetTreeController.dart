import 'package:get/get.dart';
import '../Api_Services/ApiServices.dart';
import '../Model/GetTreeModel.dart';

class GetTreeController extends GetxController{
  RxBool isLoading = false.obs;
  var response = GetTreeModel().obs;

  Future<void> getTreeCont()async{
    try{
      isLoading(true);
      final respo =await ApiServices().getTree();
      if(respo.responseCode=="1"){
        response = respo.obs;
        print("${response.value.message}");
      }
    }catch (e){
      print("Get Tree error $e");
    }
    finally{
      isLoading(false);
    }
  }
}