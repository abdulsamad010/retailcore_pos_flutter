import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String name;

  const CustomAppBar({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(leading:IconButton(
    icon: Icon(Icons.arrow_circle_left,color: Colors.white,),
    onPressed: () => Navigator.pop(context),
    ),
      title: Center(child: Text(name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
      backgroundColor: Colors.blueAccent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25)
          )
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}