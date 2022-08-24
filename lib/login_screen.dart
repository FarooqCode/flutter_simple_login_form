import 'package:flutter/material.dart';
import 'package:flutter_simple_login_form/home_screen.dart';
import 'package:flutter_simple_login_form/signup_screen.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'forget_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Login Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(children: [
              Text('Welcome 👍',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                  )),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter email',
                  prefixIcon: Align(
                    widthFactor: 1.0,
                    child: Icon(
                      Icons.alternate_email,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(16),
                ),
                validator: MultiValidator([
                  RequiredValidator(errorText: "*Required"),
                  EmailValidator(errorText: "Enter Your Email")
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter Password',
                  prefixIcon: Align(
                    widthFactor: 1.0,
                    child: Icon(
                      Icons.password,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  filled: false,
                  contentPadding: EdgeInsets.all(16),
                  fillColor: Colors.blue,
                ),
                validator: MultiValidator([
                  RequiredValidator(errorText: "*Required"),
                  MinLengthValidator(6, errorText: "Enter Min 6 Length")
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 60,
                width: 250,
                child: ElevatedButton.icon(
                  icon: Icon(
                    Icons.login_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                  label: Text('Login', style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                      elevation: 20, shape: StadiumBorder()),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("validated");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    } else {
                      print('Sorry Not Validated');
                    }
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  
                  Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => SignUpScreen()),
                   );
                },
                child: Text.rich(TextSpan(
                    text: "Don't Have Account ",
                    style: TextStyle(fontSize: 20),
                    children: const [
                      TextSpan(
                          text: 'SignUp',
                          style: TextStyle(fontSize: 22, color: Colors.blue))
                    ])),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => ForgetPassword()),
                     );
                  },
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
