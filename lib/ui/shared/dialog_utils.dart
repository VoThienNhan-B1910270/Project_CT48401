//Định nghĩa thư viện các hàm tiện ích về hộp thoại
import 'package:flutter/material.dart';

Future<bool?> showConfirmDialog(BuildContext context, String message){
  return showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Bạn muốn xóa chứ?'),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          child: const Text('No'),
          onPressed: (){
            Navigator.of(ctx).pop(false);
          },
        ),
        TextButton(
          child: const Text('Yes'),
          onPressed: (){
            Navigator.of(ctx).pop(true);
          }, 
        ),
      ],
    ),
  );
}

Future<void> showErrorDialog(BuildContext context, String message){
  return showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('An Error Occurred'),
      content: Text(message),
      actions: <Widget>[
        TextButton( 
          child: const Text('Okay'),
          onPressed: (){
            Navigator.of(ctx).pop();
          },
        )
      ],
    )
  );
}