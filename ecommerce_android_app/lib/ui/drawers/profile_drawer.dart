import 'package:ecommerce_android_app/ui/auth/authcontroller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: GetBuilder<AuthController>(builder: (authController) {
            return Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 50,
                      height: 50,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://images.pexels.com/photos/1516680/pexels-photo-1516680.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                        ),
                        radius: 70,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          authController.userData.username,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          authController.userData.email,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 50),
                const Row(
                  children: [
                    Icon(Icons.home),
                    SizedBox(width: 20),
                    Text("Home"),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 20),
                    Text("Profile"),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Icon(Icons.shopping_bag),
                    SizedBox(width: 20),
                    Text("Orders"),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 20),
                    Text("Logout"),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
