import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  void goToRegisterPage(){
    Get.toNamed('/register');
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(){
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if(isValidForm(email,password)){
      Get.snackbar('Felicidades', 'te has ganado un phone', margin: EdgeInsets.only(top:10));
    }
  }

  bool isValidForm(String email, String password){
    if(email.isEmpty){
      Get.snackbar('Formulario no valido', 'Debes de ingresar el email', margin: EdgeInsets.only(top:10));
      return false;
    }
    if(password.isEmpty){
      Get.snackbar('Formulario no valido', 'Debes de ingresar el password', margin: EdgeInsets.only(top:10));
      return false;
    }

    return true;
  }

}