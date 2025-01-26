import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timi_fix/screens/home_page.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  // const FeedScreen(),
  // const SearchScreen(),
  // const AddPostScreen(),
  const HomePage(),
  const Text('notifications'),
  // ProfileScreen(
  //   uid: FirebaseAuth.instance.currentUser!.uid,
  // ),
];
