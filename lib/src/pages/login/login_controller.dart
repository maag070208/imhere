import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../models/tResult.dart';
import '../../providers/auth_provider.dart';

class LoginController extends GetxController{

  AuthProvider authProvider = new AuthProvider();
  final login_form = FormGroup({
    'email': FormControl<String>(value:'m@gmail.com',
        validators: [
        Validators.required,
        Validators.email
        ]),
    'password': FormControl<String>(value:'maag',
        validators: [
        Validators.required,
        Validators.minLength(2)
        ]),
  });
  String getemail() => this.login_form.control('email').value;
  String getpassword() => this.login_form.control('password').value;


  void goToRegisterPage(){
    Get.toNamed('/register');
  }
  void goToHomePage(){
    Get.toNamed('/home');
  }

  void login() async{
    String email = getemail().trim();
    String password = getpassword().trim();
    if(isValidForm(email,password)){
      TResult loginResponse = await authProvider.login(email, password);
      if(loginResponse.success == true){
        goToHomePage();
      }else{
        Get.snackbar(loginResponse.messages.toString(), ':c', margin: EdgeInsets.only(top:10));
      }
    }
  }

  bool isValidForm(String email, String password){
    if(email.isEmpty){
      Get.snackbar('Formulario no valido', 'Debes de ingresar el email', margin: EdgeInsets.only(top:10));
      return false;
    }
    if(!GetUtils.isEmail(email)){
      Get.snackbar('Formulario no valido', 'Email no valido', margin: EdgeInsets.only(top:10));
      return false;
    }
    if(password.isEmpty){
      Get.snackbar('Formulario no valido', 'Debes de ingresar el password', margin: EdgeInsets.only(top:10));
      return false;
    }
    return true;
  }

}