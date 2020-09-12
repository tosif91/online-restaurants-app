import 'package:vegdaily/utils/colors.dart';
import 'package:vegdaily/views/login/login_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LogIn extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
//  TextEditingController _passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    //HandleOrientation.potrait();
    return ViewModelBuilder<LoginModel>.reactive(
        viewModelBuilder: () => LoginModel(),
        builder: (context, model, _) => Scaffold(
              body: SafeArea(
                child: Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: ListView( scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                          children:<Widget> [Column(
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
                              Text('SignIN',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500)),
                              Form(
                                  key: _formKey,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                     
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            enabled:
                                                (model.isBusy) ? false : true,
                                            onFieldSubmitted: (_) =>
                                                model.fieldFocusChange(
                                                    context,
                                                    _emailFocusNode,
                                                    _passwordFocusNode),
                                            focusNode: _emailFocusNode,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            decoration: new InputDecoration(
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: loginTextColor,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10.0),
                                                ),
                                                labelText: 'Email Address',
                                                hintText: 'xyz@weare.com'),
                                            validator: (value) =>
                                                model.validateEmail(value),
                                            textInputAction: TextInputAction.next,
                                            onSaved: (email) => _email = email,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            enabled:
                                                (model.isBusy) ? false : true,
                                            // controller: _passwordController,
                                            focusNode: _passwordFocusNode,
                                            obscureText:
                                                true, // Use secure text for passwords.
                                            decoration: new InputDecoration(
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: loginTextColor,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10.0),
                                                ),
                                                hintText: 'Password',
                                                labelText: 'Enter your password'),
                                            textInputAction: TextInputAction.done,
                                            onFieldSubmitted: (_) async {
                                              if (_formKey.currentState
                                                  .validate()) {
                                                _formKey.currentState.save();
                                                await model.handleLogIn(
                                                    _email, _password, context);
                                              }
                                            },
                                            onSaved: (password) =>
                                                _password = password,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              "Don't have an account?",
                                              style: TextStyle(fontSize: 10.0),
                                            ),
                                            InkWell(
                                              onTap: () => model.signUpView(),
                                              child: Padding(
                                                padding: const EdgeInsets.only(left:3.0),
                                                child: Text('Register Here',
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
                                  'LogIn',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                    await model.handleLogIn(
                                        _email, _password, context);
                                  }
                                },
                                color: loginTextColor,
                              ),
                            ],
                          )
                        ],
                      )],
                    )),
              ),
            ));
  }
}
