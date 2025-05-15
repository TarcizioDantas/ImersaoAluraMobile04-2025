import 'package:app_delivery_mobile/ui/_core/app_colors.dart';
import 'package:app_delivery_mobile/ui/home/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          Image.asset('assets/banners/banner_splash.png'),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24,150,24,0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 32
                ,
                children: [
                  Image.asset('assets/logo.png', width: 200),
                  Column(
                    children: [
                      Text("Um parceiro inovador para sua", 
                      style: TextStyle(color: Colors.white,
                        fontSize: 20
                      ),),
                      Text("Melhor experiência culinária!",
                      style: TextStyle(color: AppColors.mainColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ));
                      }, 
                      child: Text("Bora!"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}