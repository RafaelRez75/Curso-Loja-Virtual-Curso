import 'package:flutter/material.dart';
import 'package:lojavirtual/helpers/validators.dart';

class LoginScreen extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              children: <Widget>[
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: 'E-Mail'),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  validator: (email){
                      if(!emailValid(email)) {
                        return "Email Inválido";
                      }
                      return null;
                  },
                ),
            const SizedBox(height: 16,),
                TextFormField(
                  controller: passController,
                  decoration: const InputDecoration(hintText: 'Senha'),
                  autocorrect: false,
                  obscureText: true,
                  validator: (pass){
                    if(pass.isEmpty){
                      return 'Senha Vazia';
                    }else if(pass.length <6){
                      return 'Senha com número de caracteres abaixo de 6';
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: (){},
                    padding: EdgeInsets.zero,
                    child: const Text("Esqueci minha senha"),
                  ),
                ),
                const SizedBox(height: 16,),
                SizedBox(
                  height: 44,
                  child: RaisedButton(
                    onPressed: (){
                      if(formKey.currentState.validate()){
                          print(emailController.text);
                      }
                    },
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: const Text(
                      "Entrar",
                      style: TextStyle(
                      fontSize: 18
                      ),
                    ),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
