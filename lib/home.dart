import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';
import 'dart:ui';

import 'package:url_launcher/url_launcher.dart'; // Required for BackdropFilter

// --- Configuration Data ---

class LandingData {
  static const String name = "Jayce Mico Dignadice";
  static const String title = "Senior Flutter & Mobile App Developer.";
  static const String motto =
      "Crafting beautiful and performant cross-platform experiences.";
  static const Color primaryColor = Color(
    0xFF007BFF,
  ); // Blue accent for buttons
  static const Color darkBackgroundColor = Color(
    0xFF1D3241,
  ); // Dark Teal/Blue base background
}

// --- Main Application Setup ---

void main() {
  runApp(const HomePageApp());
}

class HomePageApp extends StatelessWidget {
  const HomePageApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil based on a common desktop/tablet aspect ratio
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Main Name
            Text(
              LandingData.name,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 70.sp,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(2, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ).fadeInUpBig(from: 180),
            SizedBox(height: 10.h),

            // Title/Motto
            Text(
              '${LandingData.title} ${LandingData.motto}',
              style: Theme.of(
                context,
              ).textTheme.titleMedium!.copyWith(fontSize: 22.sp, height: 1.5),
              textAlign: TextAlign.center,
            ).backInUp(animate: true, from: 100),
            SizedBox(height: 40.h),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildPrimaryButton(context, 'View My Work').fadeInUpBig(from: 50),
                SizedBox(width: 20.w),
                _buildIconButton(context, Icons.code_rounded), // GitHub icon
                SizedBox(width: 10.w),
                _buildIconButton(
                  context,
                  Icons.work_outline_rounded,
                ), // Portfolio/Dribbble/LinkedIn
                SizedBox(width: 10.w),
                _buildIconButton(context, Icons.email_rounded), // Contact
              ],
            ).fadeInDownBig(from: 170),
          ],
        ),
      ),      
    );
  }
}
 
Widget _buildNavLink(String text) {                                 
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 15.w),
    child: TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.white70,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

Widget _buildPrimaryButton(BuildContext context, String text) {
  return SizedBox(
    height: 50.h,
    child: ElevatedButton(
      onPressed: () {
        Scrollable.of(context).position.animateTo(
          4300,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: LandingData.primaryColor,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        elevation: 8, // Increased elevation for a floating effect
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget _buildIconButton(BuildContext context, IconData icon) {
  return Container(
    width: 50.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.08), // Increased opacity slightly
      borderRadius: BorderRadius.circular(8.r),
      border: Border.all(
        color: Colors.white.withOpacity(0.2),
      ), // More visible border
    ),
    child: IconButton(
      icon: Icon(icon, size: 22.sp, color: Colors.white70),
      onPressed: () async {
        final Uri _url = Uri.parse(
          'https://github.com/ConquerThroughConnectivity',
        );

        if (!await launchUrl(_url)) {
          throw Exception('Could not launch $_url');
        }
      },
      padding: EdgeInsets.zero,
    ),
  );
}
