import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //POSICIONAR elementos uno ensima del otro
        children: [
          _backgroundCover(context),
          _boxForm(context),
          _imageUser(),
          _buttonBack()
        ],
      )
    );
  }

  Widget _imageUser(){
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top:30),
        alignment: Alignment.topCenter,
        child: GestureDetector(
          onTap: (){},
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/img/user_profile.png'),
            radius: 60,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }


  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.42,
      color: Colors.amber,
      alignment: Alignment.topCenter,
    );
  }


  Widget _buttonBack(){
    return SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 30,
            ),
          ),
        )
    );
  }


  Widget _boxForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.60,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.30,
        left: 40,
        right: 40,
      ),
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black54, blurRadius: 15, offset: Offset(0, 0.75))
      ]),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _textRegister(),
            _textFieldEmail(),
            _textFieldName(),
            _textFieldLastName(),
            _textFielPhone(),
            _textFieldPassword(),
            _textFieldConfirmPassword(),
            _buttonRegister()
          ],
        ),
      ),
    );
  }

  Widget _textRegister() {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 10),
      child: Text(
        'Registrarse',
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration:
        InputDecoration(hintText: 'Email', prefixIcon: Icon(Icons.email)),
      ),
    );
  }

  Widget _textFieldName() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration:
        InputDecoration(hintText: 'Nombre', prefixIcon: Icon(Icons.account_circle)),
      ),
    );
  }

  Widget _textFieldLastName() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration:
        InputDecoration(hintText: 'Apellido', prefixIcon: Icon(Icons.account_circle_outlined)),
      ),
    );
  }

  Widget _textFielPhone() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0),
      child: TextField(
        keyboardType: TextInputType.phone,
        decoration:
        InputDecoration(hintText: 'Telefono', prefixIcon: Icon(Icons.phone)),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0),
      child: TextField(
        obscureText: true,
        keyboardType: TextInputType.text,
        decoration:
        InputDecoration(hintText: 'Contraseña', prefixIcon: Icon(Icons.lock)),
      ),
    );
  }

  Widget _textFieldConfirmPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0),
      child: TextField(
        obscureText: true,
        keyboardType: TextInputType.text,
        decoration:
        InputDecoration(hintText: 'Confirmar contraseña', prefixIcon: Icon(Icons.lock)),
      ),
    );
  }

  Widget _buttonRegister() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: ElevatedButton(
          onPressed: () => {},
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12)),
          child: Text('REGISTRARSE', style: TextStyle(color: Colors.black))),
    );
  }



}

