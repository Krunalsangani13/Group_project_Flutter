import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Api_Services/ApiServices.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../Model/RegisterModel.dart';
import '../Screen/LoginScreen.dart';

class RegisterController extends GetxController{
  RxBool isLoading = false.obs;
  var response = RegisterModel().obs;
  TextEditingController nameCTC=TextEditingController();
  TextEditingController sNameCTC=TextEditingController();
  TextEditingController emailCTC=TextEditingController();
  TextEditingController passCTC=TextEditingController();

  Future<void> registerCont()async{
    try{
      isLoading(true);
      final respo =await ApiServices().register(
          nameCTC.text,
          sNameCTC.text,
          emailCTC.text,
          passCTC.text);
      if(respo.responseCode=="1"){
        response = respo.obs;
        Get.to(LoginScreen());
        print("${response.value.message}");
      }
    }catch (e){
      print("Register error $e");
    }
    finally{
      isLoading(false);
    }
  }
}