import 'package:flutter/material.dart';
import 'package:worldcup/LoginController.dart';
import 'package:worldcup/components/PikuAppbar.dart';
import 'package:worldcup/my_color.dart';

class ProfilePage extends StatefulWidget {
  final LoginController controller;
  const ProfilePage({super.key, required this.controller});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.backgroundColor,
      body: Column(children: [PikuAppBar(controller: widget.controller)]),
    );
  }
}
