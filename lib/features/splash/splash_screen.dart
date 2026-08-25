import 'package:flutter/material.dart';

import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void wait()async{
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
  }

  @override
  void initState() {
    wait();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent],begin: AlignmentGeometry.bottomCenter,end: Alignment.center)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Image.asset("assets/logo/app_logo.png",fit: BoxFit.contain,width: width*0.4,),
                SizedBox(height: 12,),
                Text("RetailCore POS",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                SizedBox(height: 8,),
                Text("Offline Inventory & Point-of-Sale System",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),

                SizedBox(height: 8,),
                CircularProgressIndicator(color: Colors.white,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
