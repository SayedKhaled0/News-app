import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showLoading(BuildContext context,String message){
  showDialog(context: context,
      barrierDismissible: false,
      builder: (context)=>AlertDialog(
    title: Row(
      children: [
        CircularProgressIndicator(),
        SizedBox(width: 5,),
        Text(message)
      ],
    ),
  ));
}

hideLoading(BuildContext context){
  Navigator.pop(context);

}
void showMessage(BuildContext context,String message,String posBtn,VoidCallback  posAction,
{String? negBtn, VoidCallback?  negAction}){
  List<Widget>Action=[
    TextButton(onPressed: posAction, child: Text(posBtn)),

  ];
  if(negBtn!=null){
    Action.add(  TextButton(onPressed: negAction, child: Text(negBtn)),
    );
  }
  showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Text(message),
      actions: Action,
    );
  });
}