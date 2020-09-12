
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:vegdaily/utils/colors.dart';
import 'package:vegdaily/views/signup/signup_model.dart';

class SignUp extends StatelessWidget {
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _confirmPasswordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  String _email, _password, _confirmedPassword;
  @override
  Widget build(BuildContext context) {
    //HandleOrientation.potrait();
    return ViewModelBuilder<SignupModel>.reactive(
      viewModelBuilder: () => SignupModel(),
      builder: (context, model, _) => Scaffold(
        body: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Fleksa.',
                    style: TextStyle(
                        fontSize: 22.0,
                        fontFamily: 'vibes',
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('SignUP',
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w500)),
                      Form(
                          key: _formKey,
                          child: Column(children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                onFieldSubmitted: (_) => model.fieldFocusChange(
                                    context,
                                    _emailFocusNode,
                                    _passwordFocusNode),
                                focusNode: _emailFocusNode,

                                keyboardType: TextInputType
                                    .emailAddress, // Use email input type for emails.
                                decoration: new InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: loginTextColor,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    hintText: 'you@example.com',
                                    labelText: 'E-mail Address'),
                                textInputAction: TextInputAction.next,
                                validator: (value) =>
                                    model.validateEmail(value),
                                onSaved: (email) => _email = email,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                onFieldSubmitted: (_) => model.fieldFocusChange(
                                    context,
                                    _passwordFocusNode,
                                    _confirmPasswordFocusNode),
                                focusNode: _passwordFocusNode,

                                obscureText:
                                    true, // Use secure text for passwords.
                                decoration: new InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: loginTextColor,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    hintText: 'Password',
                                    labelText: 'Enter your password'),
                                validator: (value) =>
                                    model.validatePassword(value),
                                textInputAction: TextInputAction.next,
                                onSaved: (password) => _password = password,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                focusNode: _confirmPasswordFocusNode,
                                onFieldSubmitted: (_) async {
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                    await model.handleRegistration(
                                      _email,
                                      _password,
                                      context,
                                    );
                                  }
                                },
                                obscureText:
                                    true, // Use secure text for passwords.
                                decoration: new InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: loginTextColor,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelText: 'Confirm Password'),
                                validator: (value) =>
                                    model.validateConfirmPassword(
                                        value, _confirmedPassword),
                                textInputAction: TextInputAction.done,
                                onSaved: (cnfrmPassword) =>
                                    _confirmedPassword = cnfrmPassword,
                                onChanged: (value) =>
                                    _confirmedPassword = value,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Already have an account?",
                                  style: TextStyle(fontSize: 10.0),
                                ),
                                InkWell(
                                  onTap: () => model.handleBack(),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 3.0),
                                    child: Text('SignIn here',
                                        style: TextStyle(
                                            color: Colors.deepPurple,
                                            fontSize: 12.0)),
                                  ),
                                ),
                              ],
                            )
                          ])),
                      (model.isBusy)
                      ?CircularProgressIndicator()
                      :FlatButton(
                        child: const Text(
                          'signUp',
                          style: const TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            await model.handleRegistration(
                                _email, _password, context);
                          }
                        },
                        color: loginTextColor,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Flexible(
//               child: Container(
//                 width: double.infinity,
//                 child: model.isBusy
//                     ? Center(
//                         widthFactor: 25.0,
//                         heightFactor: 25.0,
//                         child: CircularProgressIndicator())
//                     : RaisedButton(
//                         child: const Text(
//                           'Register',
//                           style: const TextStyle(color: Colors.white),
//                         ),
//                         onPressed: () async {
//                           if (_formKey.currentState.validate()) {
//                             _formKey.currentState.save();
//                             await model.handleRegistration(
//                               _name.toLowerCase(),
//                               _email,
//                               _password,
//                               context,
//                             );
//                           }
//                         },
//                         color: Colors.blue,
//                       ),
//                 margin: new EdgeInsets.only(top: 20.0),
//               ),
//             ),
