import 'package:dio/dio.dart';
import '../Model/GetTreeModel.dart';
import '../Model/ProductModel.dart';
import '../Model/LoginModel.dart';
import '../Model/RegisterModel.dart';

class ApiServices{
  final dio = Dio();
  var baseUrl = "https://www.sparkstoideas.com/LJ/api/";

  // var baseUrl1 = "https://jsonplaceholder.typicode.com/posts";

  //Register Model
  Future<RegisterModel> register(Name, SurName, Email, Password) async {
    final user_form = FormData();

    user_form.fields.add(MapEntry("Name", Name));
    user_form.fields.add(MapEntry("SurName", SurName));
    user_form.fields.add(MapEntry("Email", Email));
    user_form.fields.add(MapEntry("Password", Password));
    final value_user = await dio.post("${baseUrl}register", data: user_form);
    if (value_user.statusCode == 200) {
      final result_user = RegisterModel.fromJson(value_user.data);
      return result_user;
    } else {
      throw 'Something went wrong';
    }
  }

  //Login Model
  Future<LoginModel>login(Email, Password) async {
    final user_form = FormData();

    user_form.fields.add(MapEntry("Email", Email));
    user_form.fields.add(MapEntry("Password", Password));

    final value_user = await dio.post("${baseUrl}login",data:user_form);
    if(value_user.statusCode == 200)
    {
      final result_user = LoginModel.fromJson(value_user.data);
      return result_user;
    }
    else {
      throw "Something went wrong.";
    }
  }

  //GetTree Model
  Future<GetTreeModel> getTree() async {
    final value_user = await dio.get("${baseUrl}get_tree_plant");
    if (value_user.statusCode == 200) {
      final result_user = GetTreeModel.fromJson(value_user.data);
      return result_user;
    } else {
      throw 'Something went wrong';
    }
  }

  //Product Model
  Future<ProductModel> product() async {
    final value_user = await dio.get("${baseUrl}get_product");
    if (value_user.statusCode == 200) {
      final result_user = ProductModel.fromJson(value_user.data);
      return result_user;
    } else {
      throw 'Something went wrong';
    }
  }

}