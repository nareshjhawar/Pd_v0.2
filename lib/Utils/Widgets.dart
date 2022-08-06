import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final b_deco =ButtonStyle(
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      EdgeInsets.all(10)
  ),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
  ),
  backgroundColor:
  MaterialStateProperty.all(Colors.transparent),
  shadowColor:
  MaterialStateProperty.all(Colors.transparent),
);

Container firebaseUIButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: MediaQuery
        .of(context)
        .size
        .width,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style:b_deco,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500, fontSize: 20),
          ),
          SizedBox(width: 5,),
          Icon(Icons.arrow_forward_ios_rounded,size: 20,)
        ],
      ),
    ),
  );
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.black,
    style: TextStyle(color: Colors.black.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.black45,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.black54),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

snackBar_error(String title) => SnackBar(
  content: Text(title),
  backgroundColor: Colors.redAccent.withOpacity(0.9),
  dismissDirection: DismissDirection.down,
  duration: const Duration(seconds: 3),
  onVisible: () {
  },
  shape: RoundedRectangleBorder(borderRadius:
  BorderRadius.all(Radius.circular(30))),
  behavior: SnackBarBehavior.floating,
  margin: EdgeInsets.all(30.0),
  padding: EdgeInsets.all(20.0),
);

showSheet(
  BuildContext context,{
    required Widget child,
    required VoidCallback onClicked,
  })=> showCupertinoModalPopup(context: context,
    builder: (context) =>CupertinoActionSheet(
      actions: [
        child,
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text('Select'),
        onPressed: onClicked,
      ),
    ) );