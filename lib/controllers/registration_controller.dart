import 'dart:convert';

import 'package:cashrich/screens/home.dart';
import 'package:cashrich/utils/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RegisterationController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerWithEmail() async {
    try {
      http.Response response = await post(
        Uri.parse('https://reqres.in/api/register'),
        body: {
          'email' : emailController,
          'password' : passwordController
        }
      );

      if(response.statusCode == 200){
        
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Login successfully');
        Get.off(HomeScreen());
        
      } else {
        print("Error");
      }
    } catch (e) {
      print("error catch");
      Get.off(HomeScreen());
    }
  }
}