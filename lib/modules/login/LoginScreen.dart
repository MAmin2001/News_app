
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:untitled1/shared/components/components.dart';

class LoginScreen extends StatelessWidget
{
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
   LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column
              ( children:
            [
              Text(
                    'Login',
                  style: TextStyle
                    (
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              SizedBox(
                height: 30.0,
              ),
              TextFormField(
                controller:emailController ,
                keyboardType: TextInputType.emailAddress,
                validator: (value)
                {
                  if(value == null || value.isEmpty)
                  {
                    return'email address must not be empty';
                  }
                  return null;
                },
                decoration:InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email)
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                validator: (value)
                {
                  if(value == null || value.isEmpty)
                  {
                    return'password must not be empty';
                  }
                  return null;
                },
                decoration:InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye)
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            Container(
              width: double.infinity,
              color: Colors.blue,
              child: MaterialButton(
                onPressed: ()
                {
                  if(formKey.currentState!.validate())
                  {
                    print(emailController.text);
                    print(passwordController.text);
                  }
                },
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),

              ),
            )

            ],

            ),
          ),
        ),
      ),
    );
  }
}
