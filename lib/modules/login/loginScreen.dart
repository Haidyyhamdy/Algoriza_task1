import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/modules/register/register_screen.dart';
import '../../components/components.dart';
import '../../components/default_button.dart';
import '../../components/default_outLineButton.dart';
import '../../components/default_text_button.dart';
import '../../components/default_text_field.dart';

class LoginScreen extends StatelessWidget {
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/food.png',
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome to Food App ',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Cardo',
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Sign in',
                            style: TextStyle(
                              fontSize: 32,
                              fontFamily: 'Cardo',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          DefaultTextButton(
                            text: 'Help',
                            onClick: () {},
                          ),
                          CircleAvatar(
                            radius: 10,
                            child: Icon(
                              Icons.question_mark,
                              size: 15,
                              color: Colors.white,
                            ),
                            backgroundColor: Colors.deepOrange,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Phone Number',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      DefaultTextField(
                        text: 'Eg.812345678',
                        controller: phoneController,
                        validate: 'Phone Number is required',
                        type: TextInputType.phone,
                        prefix: CountryCodePicker(
                          onChanged: print,
                          initialSelection: 'EG',
                          favorite: ['+39', 'FR'],
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                          showFlag: false,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: DefaultButton(
                            text: 'Sign in',
                            onClick: () {
                              if (formKey.currentState!.validate()) {}
                            }),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              height: 1.0,
                              width: 100,
                              color: Colors.black12,
                            ),
                          ),
                          Text(
                            'Or',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              height: 1.0,
                              width: 100,
                              color: Colors.black12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DefaultOutLineButton(
                          text: 'Sign with  by google',
                          icon: FontAwesomeIcons.google,
                          onClick: () {}),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                ),
                          ),
                          DefaultTextButton(
                              text: 'Sign Up',
                              onClick: () {
                                navigateTo(context, RegisterScreen());
                              })
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
