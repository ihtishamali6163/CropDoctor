import 'package:flutter/material.dart';

import '../home/home_screen.dart';


class PlantATreeScreen extends StatelessWidget {
  const PlantATreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFBFDFF),
      body: Column(
        children: [
          // Top: Plant image section
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(right: 70),
              child: Image.asset(
                'assets/plantnow.png', // Make sure this asset exists in pubspec.yaml
                fit: BoxFit.contain, // or BoxFit.contain if you prefer
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),


          // Bottom: Green info + button section
          Expanded(
            flex: 4,
            child: ClipPath(
              clipper: CurveClipper(),
              child: Container(
                width: double.infinity,
                color:  Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Plant a Tree, Save the Earth",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Trees help clean the air, conserve water, and support life. Take a step towards a greener planet today.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xffD9FFD9),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                      },
                      child:Container(
                        height: 55,
                        width: 200,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF81C784), // Light Green
                              Color(0xFF4FC3F7), // Light Blue
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                             color: Colors.grey,
                             blurRadius: 5
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            "Plant a Tree",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Curved separator clipper
class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 40);
    path.quadraticBezierTo(size.width / 2, -40, size.width, 40);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
