import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imhere/src/models/binding/user.dart';
import 'package:imhere/src/models/tResult.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../providers/user_provider.dart';

class RegisterController extends GetxController {

  UserProvider userProvider = new UserProvider();

  final register_form = FormGroup({
    'name': FormControl<String>(validators: [
      Validators.required
    ]),
    'email': FormControl<String>(validators: [
      Validators.required,
      Validators.email
    ]),
    'paternalLastname': FormControl<String>(validators: [
      Validators.required
    ]),
    'maternalLastname': FormControl<String>(),
    'phone': FormControl<String>(validators: [
      Validators.required
    ]),
    'password': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(8)
    ]),
    'confirmPassword': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(8)
    ]),
  });
  String getname() => this.register_form.control('name').value;
  String getemail() => this.register_form.control('email').value;
  String getpaternalLastname() => this.register_form.control('paternalLastname').value;
  String getmaternalLastname() => this.register_form.control('maternalLastname').value;
  String getphone() => this.register_form.control('phone').value;
  String getpassword() => this.register_form.control('password').value;
  String getconfirmPassword() => this.register_form.control('confirmPassword').value;

  void goToInitPage(){
    Get.toNamed('/');
  }

  void register(BuildContext context) async {
    if (this.register_form.valid)
    {
      if(getpassword() != getconfirmPassword())
      {
        Get.snackbar("Las contraseñas no coinciden", ":c", margin: EdgeInsets.only(top: 10));
      }
      else
      {
        User user = User(
          email: getemail(),
          name: getname(),
          paternalLastName: getpaternalLastname(),
          maternalLastName: getmaternalLastname(),
          phone: getphone(),
          latitude: "32.465854",
          longitude: "-116.896005",
          password: getpassword(),
        );
        TResult res = await userProvider.register(user);
        if(res.success == true){
          goToInitPage();
          Get.snackbar("Se ha creado correctamente", ":3", margin: EdgeInsets.only(top: 10));
        }else{
          Get.snackbar(res.messages.toString(), ':c', margin: EdgeInsets.only(top:10));
        }
        print(user.toJson());
      }
    }else{
      Get.snackbar("Las formuladrio no valido", ":c", margin: EdgeInsets.only(top: 10));
    }
  }
}

