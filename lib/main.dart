import 'dart:math';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/contact.dart';
import 'package:portfolio/home.dart';
import 'package:portfolio/pdf.dart';
import 'package:pdf/pdf.dart';
import 'package:portfolio/pdf_download_helper.dart';
import 'package:portfolio/projects.dart';
import 'package:portfolio/work_history.dart';
import 'package:printing/printing.dart';
import 'package:url_launcher/url_launcher.dart';

// ---------------------------------------------------------------------------
// NAVIGATION UTILITIES
// ---------------------------------------------------------------------------

/// Handles navigation to different sections
void
navigateTo(
  BuildContext context,
  String section,
) {
  switch (section.toLowerCase()) {
    case 'home':
      // Scroll to top
      Scrollable.of(
        context,
      ).position.animateTo(
        0,
        duration: const Duration(
          milliseconds: 500,
        ),
        curve: Curves.easeInOut,
      );
      break;
    case 'about':
      // Scroll to about section
      Scrollable.of(
        context,
      ).position.animateTo(
        850,
        duration: const Duration(
          milliseconds: 500,
        ),
        curve: Curves.easeInOut,
      );
      break;
    case 'projects':
      // Scroll to projects section
      Scrollable.of(
        context,
      ).position.animateTo(
        1750,
        duration: const Duration(
          milliseconds: 500,
        ),
        curve: Curves.easeInOut,
      );
      break;
    case 'contact':
      // Scroll to contact section
      Scrollable.of(
        context,
      ).position.animateTo(
        5900,
        duration: const Duration(
          milliseconds: 500,
        ),
        curve: Curves.easeInOut,
      );
      break;
  }
}

/// Launches external URLs
Future<
  void
>
launchURL(
  String urlString,
) async {
  final Uri url = Uri.parse(
    urlString,
  );
  if (await canLaunchUrl(
    url,
  )) {
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  } else {
    throw 'Could not launch $urlString';
  }
}

void
main() {
  runApp(
    const PortfolioApp(),
  );
}

class PortfolioApp
    extends
        StatelessWidget {
  const PortfolioApp({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    // initialize ScreenUtil with a desktop-first design size
    // but it will adapt to mobile as well.
    return ScreenUtilInit(
      designSize: const Size(
        1440,
        1024,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (
            context,
            child,
          ) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Jayce Mico Dignadice Portfolio',
              theme: ThemeData.dark().copyWith(
                scaffoldBackgroundColor: const Color(
                  0xFF0D1117,
                ),
                textTheme:
                    GoogleFonts.interTextTheme(
                      Theme.of(
                        context,
                      ).textTheme,
                    ).apply(
                      bodyColor: Colors.white,
                      displayColor: Colors.white,
                    ),
                primaryColor: const Color(
                  0xFF00A3FF,
                ),
              ),
              home: const HomePage(),
            );
          },
    );
  }
}

class LandingData {
  static const String name = "Jayce Mico Dignadice";
  static const String title = "Senior Flutter & Mobile App Developer.";
  static const String motto = "Crafting beautiful and performant cross-platform experiences.";
  static const Color primaryColor = Color(
    0xFF007BFF,
  ); // Blue accent for buttons
  static const Color darkBackgroundColor = Color(
    0xFF1D3241,
  ); // Dark Teal/Blue base background
}

class HomePage
    extends
        StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Background Animation Layer
          const Positioned.fill(
            child: ParticleNetworkBackground(),
          ),
          // 2. Content Layer
          SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 1440,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.w,
                    vertical: 30.h,
                  ),
                  child: Builder(
                    builder:
                        (
                          innercontext,
                        ) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const NavBar(),
                              SizedBox(
                                height: 300.h,
                              ),
                              HomePageApp(),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 100,
                                ),
                                child: SizedBox(
                                  width: 70,
                                  child: IconButton(
                                    onPressed: () {
                                      Scrollable.of(
                                        innercontext,
                                      ).position.animateTo(
                                        4000,
                                        duration: const Duration(
                                          milliseconds: 500,
                                        ),
                                        curve: Curves.easeInOut,
                                      );
                                    },
                                    icon: Icon(
                                      Icons.arrow_downward,
                                      size: 50,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 400.h,
                              ),
                              const MainContentArea(),
                              SizedBox(
                                height: 60.h,
                              ),
                              SizedBox(
                                height: 100.h,
                              ),
                              ProjectsContent(),
                              SizedBox(
                                height: 200.h,
                              ),
                              WorkHistoryScreen(),
                              SizedBox(
                                height: 200.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 100,
                                ),
                                child: SizedBox(
                                  width: 70,
                                  child: IconButton(
                                    onPressed: () {
                                      Scrollable.of(
                                        innercontext,
                                      ).position.animateTo(
                                        0,
                                        duration: const Duration(
                                          milliseconds: 500,
                                        ),
                                        curve: Curves.easeInOut,
                                      );
                                    },
                                    icon: Icon(
                                      Icons.arrow_upward,
                                      size: 50,
                                    ),
                                  ),
                                ),
                              ),
                              ContactFormScreen(),
                              SizedBox(
                                height: 100.h,
                              ),
                            ],
                          );
                        },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final Uri
_url = Uri.parse(
  'https://github.com/ConquerThroughConnectivity',
);

Future<
  void
>
_launchUrl() async {
  if (!await launchUrl(
    _url,
  )) {
    throw Exception(
      'Could not launch $_url',
    );
  }
}

final Uri
_urlupwork = Uri.parse(
  'https://www.upwork.com/freelancers/~0128102012664543dd',
);

Future<
  void
>
_launch() async {
  if (!await launchUrl(
    _urlupwork,
  )) {
    throw Exception(
      'Could not launch $_urlupwork',
    );
  }
}

Widget
_buildPrimaryButton(
  BuildContext context,
  String text,
) {
  return SizedBox(
    height: 50.h,
    child: ElevatedButton(
      onPressed: _launch,
      style: ElevatedButton.styleFrom(
        backgroundColor: LandingData.primaryColor,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8.r,
          ),
        ),
        elevation: 8, // Increased elevation for a floating effect
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget
_buildIconButton(
  BuildContext context,
  IconData icon,
) {
  return Container(
    width: 50.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(
        0.08,
      ), // Increased opacity slightly
      borderRadius: BorderRadius.circular(
        8.r,
      ),
      border: Border.all(
        color: Colors.white.withOpacity(
          0.2,
        ),
      ), // More visible border
    ),
    child: IconButton(
      icon: Icon(
        icon,
        size: 22.sp,
        color: Colors.white70,
      ),
      onPressed: _launchUrl,
      padding: EdgeInsets.zero,
    ),
  );
}

// ---------------------------------------------------------------------------
// UI COMPONENTS
// ---------------------------------------------------------------------------

class NavBar
    extends
        StatefulWidget {
  const NavBar({
    super.key,
  });

  @override
  State<
    NavBar
  >
  createState() => _NavBarState();
}

class _NavBarState
    extends
        State<
          NavBar
        > {
  String _activeItem = 'Home';

  @override
  Widget build(
    BuildContext context,
  ) {
    bool isMobile =
        MediaQuery.of(
          context,
        ).size.width <
        800;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left Side: Logo and Name
        Row(
          children: [
            Icon(
              Icons.verified,
              color: const Color(
                0xFF00A3FF,
              ),
              size: 30.sp,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              'Jayce Mico Dignadice',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        // Right Side: Navigation Items and Buttons
        if (!isMobile)
          Row(
            children: [
              _navItem(
                'Home',
                onTap: () {
                  setState(
                    () => _activeItem = 'Home',
                  );
                  navigateTo(
                    context,
                    'Home',
                  );
                },
              ),
              _navItem(
                'About',
                onTap: () {
                  setState(
                    () => _activeItem = 'About',
                  );
                  navigateTo(
                    context,
                    'About',
                  );
                },
              ),
              _navItem(
                'Projects',
                onTap: () {
                  setState(
                    () => _activeItem = 'Projects',
                  );
                  navigateTo(
                    context,
                    'Projects',
                  );
                },
              ),
              _navItem(
                'Contact',
                onTap: () {
                  setState(
                    () => _activeItem = 'Contact',
                  );
                  navigateTo(
                    context,
                    'Contact',
                  );
                },
              ),
              SizedBox(
                width: 20.w,
              ),

              // Hire Me Button
              ElevatedButton(
                onPressed: () => launchURL(
                  'https://www.upwork.com',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                    0xFF00A3FF,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 16.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8.r,
                    ),
                  ),
                ),
                child: Text(
                  'Hire Me',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(
                width: 20.w,
              ), // Spacing between buttons
              // View PDF Button
              // ElevatedButton(
              //   onPressed: () async {
              //     try {
              //       final pdfData = await generateHomePagePdf();
              //       await Printing.layoutPdf(
              //         onLayout:
              //             (
              //               PdfPageFormat format,
              //             ) async => pdfData,
              //       );
              //     } catch (
              //       e
              //     ) {
              //       // Show error to user if view fails
              //       if (context.mounted) {
              //         ScaffoldMessenger.of(
              //           context,
              //         ).showSnackBar(
              //           SnackBar(
              //             content: Text(
              //               'Failed to view PDF: $e',
              //             ),
              //             backgroundColor: Colors.red,
              //           ),
              //         );
              //       }
              //     }
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: const Color(
              //       0xFF00A3FF,
              //     ),
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 24.w,
              //       vertical: 16.h,
              //     ),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(
              //         8.r,
              //       ),
              //     ),
              //   ),
              //   child: Text(
              //     'View PDF',
              //     style: TextStyle(
              //       fontSize: 16.sp,
              //       color: Colors.white,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   width: 20.w,
              // ), // Spacing between buttons
              // Download PDF Button (Aligned Right)
              ElevatedButton(
                onPressed: () async {
                  try {
                    final pdfData = await generateHomePagePdf();
                    await downloadPdf(
                      pdfData,
                      'portfolio.pdf',
                    );
                  } catch (
                    e
                  ) {
                    // Show error to user if download fails
                    if (context.mounted) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Failed to download PDF: $e',
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                    0xFF00A3FF,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 16.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8.r,
                    ),
                  ),
                ),
                child: Text(
                  'Download PDF',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget _navItem(
    String title, {
    VoidCallback? onTap,
  }) {
    bool isActive =
        _activeItem ==
        title;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
      ),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            color: isActive
                ? const Color(
                    0xFF00A3FF,
                  )
                : Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class MainContentArea
    extends
        StatelessWidget {
  const MainContentArea({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    // Responsive switching logic
    return LayoutBuilder(
      builder:
          (
            context,
            constraints,
          ) {
            if (constraints.maxWidth >
                900) {
              // Desktop: Two Columns
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: const LeftProfileSection(),
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                  Expanded(
                    flex: 4,
                    child: const RightToolkitSection(),
                  ),
                ],
              );
            } else {
              // Mobile/Tablet: Single Column
              return Column(
                children: [
                  const LeftProfileSection(),
                  SizedBox(
                    height: 50.h,
                  ),
                  const RightToolkitSection(),
                ],
              );
            }
          },
    );
  }
}

class LeftProfileSection
    extends
        StatelessWidget {
  const LeftProfileSection({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 60.r,
              backgroundImage: const NetworkImage(
                'https://scontent-mnl3-2.xx.fbcdn.net/v/t39.30808-6/494035726_9900298010014291_1652607738040516680_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=GyA0tm0QtN4Q7kNvwHb6osX&_nc_oc=AdlU6IuIpy19PAk0WX8hXz6SaqEvreRIj8u_awF1Z9-pg_7GcjqDll_UVpNIvisP_aw&_nc_zt=23&_nc_ht=scontent-mnl3-2.xx&_nc_gid=9y29B4xT-8dxcc0v4ukO6g&oh=00_AfkF0mQ_fn1UY8-zj3P_OEh_EUys4XP0APSX-5XLvawRXg&oe=69348F6B',
              ), // Placeholder
              backgroundColor: Colors.grey,
            ).fadeInUpBig(from:130),
            SizedBox(
              width: 24.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, Jayce Mico Dignadice",
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ).fadeInUpBig(from: 160),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Senior Flutter Developer",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: const Color(
                      0xFF00A3FF,
                    ),
                    fontWeight: FontWeight.w600,
                  ),
                ).fadeInUpBig(from: 190),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 40.h,
        ),
        Text(
          "My Story",
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ).fadeInUpBig(from: 230),
        SizedBox(
          height: 16.h,
        ),
        Text(
          "For over 5 years, I've been immersed in the world of mobile development, with a deep-seated passion for creating high-performance, beautiful applications using Flutter. My journey began with a fascination for turning complex problems into elegant, user-friendly solutions.",
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.grey[400],
            height: 1.6,
          ),
        ).fadeInUpBig(from: 260),
        SizedBox(
          height: 16.h,
        ),
        Text(
          "I thrive on building products that not only function flawlessly but also provide a delightful and intuitive user experience. From architecting scalable app structures to polishing pixel-perfect UIs.",
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.grey[400],
            height: 1.6,
          ),
        ).fadeInUpBig(from: 290),
        SizedBox(
          height: 30.h,
        ),
        // Row(
        //   children: [
        //     Icon(FontAwesomeIcons.github, size: 40, color: Colors.white),
        //     SizedBox(width: 20.w),
        //     FaIcon(FontAwesomeIcons.linkedin, size: 28.sp, color: Colors.grey[500]),
        //   ],
        // )
        Row(
          children: [
            InkWell(
              onTap: () => launchURL(
                'https://github.com/ConquerThroughConnectivity',
              ),
              child: Icon(
                FontAwesomeIcons.github,
                size: 40,
                color: Colors.white,
              ),
            ).fadeInUpBig(from: 320),
            SizedBox(
              width: 20.w,
            ),
            InkWell(
              onTap: () => launchURL(
                'https://www.upwork.com/freelancers/~0128102012664543dd',
              ),
              child: Icon(
                FontAwesomeIcons.upwork,
                size: 40,
                color: Colors.white,
              ),
            ).fadeInUpBig(from: 340),
          ],
        ),
      ],
    );
  }
}

class RightToolkitSection
    extends
        StatelessWidget {
  const RightToolkitSection({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      children: [
        // Dark Card
        Container(
          padding: EdgeInsets.all(
            30.w,
          ),
          decoration: BoxDecoration(
            color: const Color(
              0xFF161B22,
            ),
            borderRadius: BorderRadius.circular(
              16.r,
            ),
            border: Border.all(
              color: Colors.white.withOpacity(
                0.05,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Toolkit",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ).fadeInUpBig(from: 130),
              SizedBox(
                height: 24.h,
              ),
              _skillGroup(
                "MOBILE & CROSS-PLATFORM",
                [
                  "Flutter",
                  "Dart",
                  "Android (Kotlin/Java)",
                  "iOS (Swift)",
                ],
              ).fadeInUpBig(from: 160),
              _skillGroup(
                "STATE MANAGEMENT",
                [
                  "Provider",
                  "BLoC",
                  "Riverpod",
                ],
              ),
              _skillGroup(
                "BACKEND & CLOUD",
                [
                  "Firebase",
                  "REST APIs",
                  "Node.js",
                  "Django",
                  "Python",
                  "Firestore",
                ],
              ).fadeInUpBig(from: 190),
              _skillGroup(
                "TOOLS & PLATFORMS",
                [
                  "Git & GitHub",
                  "CI/CD",
                  "VS Code",
                ],
              ).fadeInUpBig(from: 230)
            ],
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        // Blue Call to Action Card
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(
            30.w,
          ),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(
                  0xFF134E5E,
                ),
                Color(
                  0xFF71B280,
                ),
              ], // Subtle gradient
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            color: const Color(
              0xFF0D2F45,
            ), // Fallback
            borderRadius: BorderRadius.circular(
              16.r,
            ),
          ),
          child: Column(
            children: [
              Text(
                "Looking to build a high-performance app?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ).fadeInUpBig(from: 130),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Let's connect and bring your vision to life. I'm available for new freelance projects.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.grey[300],
                ),
              ).fadeInUpBig(from: 160),
              SizedBox(
                height: 20.h,
              ),
              ElevatedButton(
                onPressed: () async {
                  final Uri uri = Uri.parse(
                    "https://www.upwork.com/freelancers/~0128102012664543dd",
                  );

                  // Use launchUrl. It returns true if the URL was successfully launched.
                  // We use await to pause execution until the function completes.
                  if (!await launchUrl(
                    uri,
                    mode: LaunchMode.externalApplication,
                  )) {
                    // Handle the error if the link cannot be launched
                    throw Exception(
                      'Could not launch $_url',
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                    0xFF00A3FF,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.w,
                    vertical: 18.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8.r,
                    ),
                  ),
                ),
                child: Text(
                  "View My Upwork Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ).fadeInUpBig(from: 190),
            ],
          ),
        ),
      ],
    );
  }

  Widget _skillGroup(
    String title,
    List<
      String
    >
    skills,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 20.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey[500],
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: skills
                .map(
                  (
                    e,
                  ) => Chip(
                    label: Text(
                      e,
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 13.sp,
                      ),
                    ),
                    backgroundColor: const Color(
                      0xFF21262D,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 8.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        8.r,
                      ),
                      side: BorderSide.none,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// BACKGROUND ANIMATION LOGIC (Particle Network)
// ---------------------------------------------------------------------------

class ParticleNetworkBackground
    extends
        StatefulWidget {
  const ParticleNetworkBackground({
    super.key,
  });

  @override
  State<
    ParticleNetworkBackground
  >
  createState() => _ParticleNetworkBackgroundState();
}

class _ParticleNetworkBackgroundState
    extends
        State<
          ParticleNetworkBackground
        >
    with
        SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<
    Particle
  >
  _particles = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 10,
      ),
    )..repeat();
    // Initialize particles
    for (
      int i = 0;
      i <
          40;
      i++
    ) {
      _particles.add(
        Particle(
          random: _random,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return AnimatedBuilder(
      animation: _controller,
      builder:
          (
            context,
            child,
          ) {
            return CustomPaint(
              painter: NetworkPainter(
                particles: _particles,
                animationValue: _controller.value,
              ),
              size: Size.infinite,
            );
          },
    );
  }
}

class Particle {
  double x = 0;
  double y = 0;
  double speedX = 0;
  double speedY = 0;
  double size = 0;

  Particle({
    required Random random,
  }) {
    x = random.nextDouble();
    y = random.nextDouble();
    speedX =
        (random.nextDouble() -
            0.5) *
        0.002;
    speedY =
        (random.nextDouble() -
            0.5) *
        0.002;
    size =
        random.nextDouble() *
            3 +
        1;
  }

  void update() {
    x += speedX;
    y += speedY;

    // Bounce off edges
    if (x <
            0 ||
        x >
            1)
      speedX *= -1;
    if (y <
            0 ||
        y >
            1)
      speedY *= -1;
  }
}

class NetworkPainter
    extends
        CustomPainter {
  final List<
    Particle
  >
  particles;
  final double animationValue;

  NetworkPainter({
    required this.particles,
    required this.animationValue,
  });

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    final paint = Paint()
      ..color =
          const Color(
            0xFF00A3FF,
          ).withOpacity(
            0.3,
          );
    final linePaint = Paint()..strokeWidth = 1.0;

    for (
      var i = 0;
      i <
          particles.length;
      i++
    ) {
      var p = particles[i];
      p.update(); // Update position logic inside paint for simplicity (or separate tick)

      final dx =
          p.x *
          size.width;
      final dy =
          p.y *
          size.height;

      // Draw particle
      canvas.drawCircle(
        Offset(
          dx,
          dy,
        ),
        p.size,
        paint,
      );

      // Draw connections
      for (
        var j =
            i +
            1;
        j <
            particles.length;
        j++
      ) {
        var p2 = particles[j];
        final dx2 =
            p2.x *
            size.width;
        final dy2 =
            p2.y *
            size.height;

        double distance = sqrt(
          pow(
                dx -
                    dx2,
                2,
              ) +
              pow(
                dy -
                    dy2,
                2,
              ),
        );

        // Connect if close enough
        if (distance <
            150) {
          linePaint.color =
              const Color(
                0xFF00A3FF,
              ).withOpacity(
                0.15 *
                    (1 -
                        distance /
                            150),
              );
          canvas.drawLine(
            Offset(
              dx,
              dy,
            ),
            Offset(
              dx2,
              dy2,
            ),
            linePaint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(
    covariant CustomPainter oldDelegate,
  ) => true;
}
