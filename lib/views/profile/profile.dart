import 'package:flutter/material.dart';
import 'package:vegdaily/utils/colors.dart';
import 'package:vegdaily/views/profile/profile_model.dart';
import 'package:stacked/stacked.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ProfileModel(),
      builder: (context, model, _) => Container(
        child: Center(
            child: (model.isBusy)
                ? CircularProgressIndicator()
                : FlatButton(
        color: buttonHoverColor,
                    child: Text('signOut',style: TextStyle(color: Colors.white),),
                    onPressed: () => model.signOut(),
                  )),
      ),
    );
  }
}
