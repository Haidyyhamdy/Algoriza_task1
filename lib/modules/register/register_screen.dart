
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/modules/login/loginScreen.dart';
import '../../components/components.dart';
import '../../components/default_button.dart';
import '../../components/default_outLineButton.dart';
import '../../components/default_text_button.dart';
import '../../components/default_text_field.dart';

class RegisterScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(alignment: AlignmentDirectional.bottomStart, children: [
                Image.asset(
                  'assets/images/food.png',
                  fit: BoxFit.fitWidth,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 5),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                    ),
                  ),
                )
              ]),
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
                            'Sign Up',
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
                        'Email',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      DefaultTextField(
                          text: 'Eg. example@gmail.com',
                          controller: emailController,
                          validate: 'Email is required',
                          type: TextInputType.emailAddress),
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
                        height: 20,
                      ),
                      Text(
                        'password',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      DefaultTextField(
                        text: 'password',
                        controller: passwordController,
                        validate: 'password is required',
                        type: TextInputType.visiblePassword,
                        suffix: Icons.visibility,
                        isPassword: true,
                      ),
                      SizedBox(
                        height: 20,
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
                            'Has any account?',
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                ),
                          ),
                          DefaultTextButton(
                              text: 'Sign in',
                              onClick: () {
                                navigateTo(context, LoginScreen());
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
