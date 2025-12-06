import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:portfolio/home.dart';
import 'package:portfolio/projects.dart';
import 'package:printing/printing.dart';

final List<
  Project
>
projects = [
  // Project(
  //   'Flutter Covid App',
  //   'Apps like "TracerX" (a conceptual app built with Flutter) used the Google Nearby API and Firebase to detect other users and notify them of potential exposure.',
  //   'https://res.cloudinary.com/nearform-website/image/upload/covid-19-contact-tracing-app.png',
  // ),
  Project(
    'Flutter FUMC App Healthplus',
    'is the name of a specific healthcare management app built with the Flutter framework for a premium polyclinic. The app serves as a personal mobile health assistant, giving clients secure and convenient online access to their medical information.',
    'https://scontent-mnl3-3.xx.fbcdn.net/v/t39.30808-6/472225991_9086765664772071_3755612128034828213_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=127cfc&_nc_ohc=lDKN5RudfR4Q7kNvwF6tRm2&_nc_oc=AdkDR11IHg--JKGzS4Q8NpspUenJ9kSHEbtWuvcVYL-1LTNy07RLCq1daJ-UFvm7PfI&_nc_zt=23&_nc_ht=scontent-mnl3-3.xx&_nc_gid=0dYzZsdZaZgGe0mpT-lUJA&oh=00_AflPSYKS8z5J4McB3hn-F13Dw80JATIxX_lSwSbwwQ93zw&oe=6934F94E',
  ),
  Project(
    'Flutter One-Pop Rewards app',
    'Turn your daily routine into a rewarding experience. The One-Pop Rewards app uses geofencing to send you relevant rewards and offers the moment you are near your favorite participating One-Pop locations. Say goodbye to forgotten loyalty cards and hello to effortless rewards. ',
    'https://res.cloudinary.com/dkyqjva2e/image/upload/v1764690617/new_cyvyry.png',
  ),
  // Project(
  //   'Flutter WhereTo Delivery App',
  //   'WhereTo delivers food from your favorite local restaurants right to your door. Browse thousands of menus, place your order in minutes, and track your delivery in real time.',
  //   'https://www.businessofapps.com/wp-content/uploads/2022/01/emizen_tech_food_deliver_img1.png',
  // ),
  Project(
    'Flutter Up Up Technology Delivery App',
    'Up Up Technology delivers food from your favorite local restaurants right to your door. Browse thousands of menus, place your order in minutes, and track your delivery in real time.',
    'https://cdn.dribbble.com/userupload/19422955/file/original-1515692bcaf6f39a4610254a0914ccf5.png?resize=1600x1200',
  ),
  Project(
    'Flutter Sebizio Provider App',
    'Take control of your business and maximize your earning potential with the official Sebizio provider app. Designed to be your all-in-one business tool, this app connects you with a network of customers and gives you the power to manage your schedule, services, and payments seamlessly. ',
    'https://cdn.dribbble.com/userupload/12782091/file/original-3b90338ee08fc815992af0db79059140.png?resize=400x0',
  ),

  Project(
    'Flutter Amanahfy Ltd',
    'I Work and make their screens for this app like communication app',
    'https://play-lh.googleusercontent.com/B3trzxtdXEyB7YEcfON7JeVItpvpqkf1x3U3LvJ8HpGjseMxWZIco1iZQbhETca4pw=w526-h296-rw',
  ),
  Project(
    'Flutter CRM mobile app',
    'Effective CRM (Customer Relationship Management) descriptions focus on consolidating customer data, streamlining business processes, and improving profitability by enhancing customer relationships. A good description explains the CRM s specific features, benefits, and how it empowers teams, from sales and marketing to customer service. ',
    'https://cdn.dribbble.com/userupload/13935422/file/original-c15df291c1770d508ea4541c1ddc0dad.png?crop=0x0-4000x3000&format=webp&resize=400x300&vertical=center',
  ),
  Project(
    'Flutter JustLearn',
    'Justlearn is a language-learning platform that connects students with live, online tutors for personalized, one-on-one lessons. It is a Danish EdTech company that also integrates AI tutors and other technologies to enhance the learning process. ',
    'https://res.cloudinary.com/dkyqjva2e/image/upload/v1764692828/preview-xl_ux83ir.jpg',
  ),
  Project(
    'Flutter WineApp MongoDB Realm GraphQl',
    'Instantly discover everything about any wine with WineApp. Scan a label to get ratings, reviews, and tasting notes from a global community. Save your favorites, track your cellar, and get personalized recommendations. Your ultimate wine companion is here to help you choose, remember, and enjoy better wine.',
    'https://cdn.dribbble.com/userupload/3588814/file/still-937daea81c504eb9068a150311606387.png?format=webp&resize=400x300&vertical=center',
  ),
  Project(
    'Flutter Sports App',
    'A Flutter sports app is a mobile application built with the Flutter framework that can be designed for a wide range of sports-related purposes. Thanks to Flutter s cross-platform capabilities and rich set of customizable widgets, developers can create high-performance, visually appealing apps for both iOS and Android from a single codebase. ',
    'https://sixcolors.com/wp-content/uploads/2024/02/applesports4-6c.png',
  ),
  Project(
    'Flutter Resort Reservation App',
    'Developing a resort reservation app with Flutter involves building a cross-platform user interface (UI) and connecting it to a backend for real-time data handling. You will need to cover both the user-facing app for bookings and an admin dashboard for managing resorts. ',
    'https://cdn.dribbble.com/userupload/2948811/file/original-d1cd7e5c16f6d1bf3878ea7bb0a15255.png?format=webp&resize=400x300&vertical=center',
  ),
  Project(
    'Flutter Event Proposal',
    'This proposal outlines the development of a Event Proposal mobile application using the Flutter framework. The app will streamline event planning, enhance attendee engagement, and provide organizers with powerful management and analytics tools. ',
    'https://raw.githubusercontent.com/ConquerThroughConnectivity/event_proposal/refs/heads/master/lib/photo/Choose.jpg',
  ),
  Project(
    'Flutter Scout Trail Users',
    'flutter scout app designed to monitor users, parents, and institutions, each user group has a distinct set of features and a tailored user experience. The app s single, cross-platform codebase uses role-based access to present different interfaces and functionalities to each user type upon login. ',
    'https://avatars.githubusercontent.com/u/128563565?s=96&v=4',
  ),
  Project(
    'Flutter Scout Trail Parents',
    'This parent-facing description for a Flutter scout app emphasizes safety, communication, and real-time monitoring. It highlights features that give parents peace of mind, such as location tracking during events, custom geofencing alerts, and a direct channel for emergency notifications. The description is written to build trust and position the app as an essential safety tool. ',
    'https://avatars.githubusercontent.com/u/128563565?s=96&v=4',
  ),
  Project(
    'Flutter Scout Trail Parents',
    'Flutter scout app for institutions focuses on operational efficiency, safety oversight, and streamlined communication. It highlights the benefits for administrators and staff, such as real-time attendance tracking, centralized event management, and a robust system for handling emergencies. The description positions the app as a comprehensive tool for managing group activities, ensuring accountability, and enhancing safety protocols.  ',
    'https://avatars.githubusercontent.com/u/128563565?s=96&v=4',
  ),
  Project(
    'Flutter Attendance App',
    'For a Flutter attendance app, the description should highlight how it simplifies the process of tracking attendance for specific use cases like employees in a business, students in a school, or participants at an event. A good description will emphasize features that ensure accuracy, save time, and provide valuable insights.  ',
    'https://res.cloudinary.com/dkyqjva2e/image/upload/v1764694206/new1_cf3uzm.png',
  ),
  Project(
    'Python Django Attendance Backend',
    'This description outlines the architecture and functionality of a Python Django backend for an attendance application. It is designed to work seamlessly with a mobile client (like a Flutter app) and a web-based dashboard, using Django s powerful features to handle data modeling, user authentication, and secure communication.  ',
    'https://miro.medium.com/1*XYh4LDCxu_D_kL7NIQFWjA.png',
  ),
];

Future<
  Uint8List
>
generateHomePagePdf() async {
  final pdf = pw.Document();

  // Load Unicode-safe fonts
  final pw.Font regularFont = await PdfGoogleFonts.openSansRegular();
  final pw.Font boldFont = await PdfGoogleFonts.openSansBold();

  final response = await http.get(
    Uri.parse(
      "https://scontent-mnl3-2.xx.fbcdn.net/v/t39.30808-6/494035726_9900298010014291_1652607738040516680_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=GyA0tm0QtN4Q7kNvwHb6osX&_nc_oc=AdlU6IuIpy19PAk0WX8hXz6SaqEvreRIj8u_awF1Z9-pg_7GcjqDll_UVpNIvisP_aw&_nc_zt=23&_nc_ht=scontent-mnl3-2.xx&_nc_gid=9y29B4xT-8dxcc0v4ukO6g&oh=00_AfkF0mQ_fn1UY8-zj3P_OEh_EUys4XP0APSX-5XLvawRXg&oe=69348F6B",
    ),
  );
  final profileImage = pw.MemoryImage(
    response.bodyBytes,
  );

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a3,
      build:
          (
            pw.Context context,
          ) {
            // final isDesktop =
            //     MediaQuery.of(context as BuildContext).size.width > 900;
            // final isTablet =
            //     MediaQuery.of(context as BuildContext).size.width > 600;

            // // Total number of columns for the grid
            // final int crossAxisCount = isDesktop ? 3 : (isTablet ? 2 : 1);

            return pw.Center(
              child: pw.Padding(
                padding: const pw.EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    // NAME
                    // pw.Text(
                    //   LandingData.name,
                    //   style: pw.TextStyle(fontSize: 48, font: fontBold),
                    //   textAlign: pw.TextAlign.center,
                    // ),

                    // pw.SizedBox(height: 15),

                    // // TITLE + MOTTO
                    // pw.Text(
                    //   "${LandingData.title} ${LandingData.motto}",
                    //   style: pw.TextStyle(
                    //     fontSize: 20,
                    //     font: fontRegular,
                    //     color: PdfColors.grey700,
                    //     height: 1.5,
                    //   ),
                    //   textAlign: pw.TextAlign.center,
                    // ),

                    // pw.SizedBox(height: 10),

                    // Example PDF button
                    // pw.Container(
                    //   padding: const pw.EdgeInsets.all(12),
                    //   decoration: pw.BoxDecoration(
                    //     color: PdfColors.blue,
                    //     borderRadius: pw.BorderRadius.circular(10),
                    //   ),
                    //   child: pw.Text(
                    //     "View My Work",
                    //     style: pw.TextStyle(
                    //       font: fontBold,
                    //       fontSize: 18,
                    //       color: PdfColors.white,
                    //     ),
                    //   ),
                    // ),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(
                        20,
                      ),
                      decoration: pw.BoxDecoration(
                        color: PdfColors.blue,
                        borderRadius: pw.BorderRadius.circular(
                          12,
                        ),
                      ),
                      child: pw.Column(
                        children: [
                          pw.Text(
                            "Looking to build a high-performance app?",
                            style: pw.TextStyle(
                              font: boldFont,
                              fontSize: 16,
                              color: PdfColors.white,
                            ),
                            textAlign: pw.TextAlign.center,
                          ),
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.Text(
                            "I'm available for freelance projects and collaboration.",
                            style: pw.TextStyle(
                              font: regularFont,
                              color: PdfColors.white,
                              fontSize: 12,
                            ),
                            textAlign: pw.TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.only(
                        bottom: 1,
                      ),
                      child: pw.Column(
                        children: [
                          pw.Text(
                            'My Projects & Work',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                              color: PdfColors.white,
                              fontSize: 24,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.SizedBox(
                            height: 5,
                          ),
                          pw.Text(
                            'A selection of projects that showcase my passion for building beautiful and functional applications.',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                              color: PdfColors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),

                    pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        // LEFT COLUMN
                        pw.Expanded(
                          flex: 5,
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              // Profile Header
                              pw.Row(
                                children: [
                                  pw.Container(
                                    width: 150,
                                    height: 150,
                                    child: pw.ClipOval(
                                      child: pw.Image(
                                        profileImage,
                                        fit: pw.BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  pw.SizedBox(
                                    width: 20,
                                  ),
                                  pw.Column(
                                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(
                                        "Hello, Jayce Mico Dignadice",
                                        style: pw.TextStyle(
                                          font: boldFont,
                                          fontSize: 22,
                                        ),
                                      ),
                                      pw.SizedBox(
                                        height: 4,
                                      ),
                                      pw.Text(
                                        "Senior Flutter Developer",
                                        style: pw.TextStyle(
                                          font: regularFont,
                                          fontSize: 16,
                                          color: PdfColors.blue,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              pw.SizedBox(
                                height: 30,
                              ),

                              // My Story
                              pw.Text(
                                "My Story",
                                style: pw.TextStyle(
                                  font: boldFont,
                                  fontSize: 20,
                                ),
                              ),
                              pw.SizedBox(
                                height: 10,
                              ),

                              pw.Text(
                                "For over 5 years, I've been immersed in mobile development, "
                                "with a deep passion for building high-performance applications using Flutter.",
                                style: pw.TextStyle(
                                  font: regularFont,
                                  fontSize: 13,
                                  color: PdfColors.grey700,
                                  lineSpacing: 4,
                                ),
                              ),

                              pw.SizedBox(
                                height: 10,
                              ),

                              pw.Text(
                                "I thrive on creating intuitive and beautiful apps with scalable architecture.",
                                style: pw.TextStyle(
                                  font: regularFont,
                                  fontSize: 13,
                                  color: PdfColors.grey700,
                                  lineSpacing: 4,
                                ),
                              ),

                              pw.SizedBox(
                                height: 20,
                              ),

                              // Social icons replaced with URLs
                              pw.Text(
                                "GitHub: https://github.com/ConquerThroughConnectivity",
                                style: pw.TextStyle(
                                  font: regularFont,
                                  fontSize: 12,
                                ),
                              ),
                              pw.Text(
                                "Upwork: https://www.upwork.com/freelancers/~0128102012664543dd",
                                style: pw.TextStyle(
                                  font: regularFont,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),

                        pw.SizedBox(
                          width: 10,
                        ),

                        pw.Expanded(
                          flex: 4,
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.SizedBox(
                                height: 80,
                              ),
                              pw.Text(
                                "My Toolkit",
                                style: pw.TextStyle(
                                  font: boldFont,
                                  fontSize: 20,
                                ),
                              ),
                              pw.SizedBox(
                                height: 70,
                              ),
                              skillGroup(
                                "MOBILE & CROSS-PLATFORM",
                                [
                                  "Flutter",
                                  "Dart",
                                  "Android",
                                  "iOS",
                                ],
                                regularFont,
                              ),
                              skillGroup(
                                "STATE MANAGEMENT",
                                [
                                  "Provider",
                                  "BLoC",
                                  "Riverpod",
                                ],
                                regularFont,
                              ),
                              skillGroup(
                                "BACKEND & CLOUD",
                                [
                                  "Firebase",
                                  "REST APIs",
                                  "Node.js",
                                  "Django",
                                  "Python",
                                ],
                                regularFont,
                              ),
                              skillGroup(
                                "TOOLS & PLATFORMS",
                                [
                                  "GitHub",
                                  "CI/CD",
                                  "VS Code",
                                ],
                                regularFont,
                              ),

                              pw.SizedBox(
                                height: 25,
                              ),

                              // CTA section
                              // pw.Container(
                              //   padding: const pw.EdgeInsets.all(20),
                              //   decoration: pw.BoxDecoration(
                              //     color: PdfColors.blue,
                              //     borderRadius: pw.BorderRadius.circular(12),
                              //   ),
                              //   child: pw.Column(
                              //     children: [
                              //       pw.Text(
                              //         "Looking to build a high-performance app?",
                              //         style: pw.TextStyle(
                              //           font: fontBold,
                              //           fontSize: 16,
                              //           color: PdfColors.white,
                              //         ),
                              //         textAlign: pw.TextAlign.center,
                              //       ),
                              //       pw.SizedBox(height: 10),
                              //       pw.Text(
                              //         "I'm available for freelance projects and collaboration.",
                              //         style: pw.TextStyle(
                              //           font: fontRegular,
                              //           color: PdfColors.white,
                              //           fontSize: 12,
                              //         ),
                              //         textAlign: pw.TextAlign.center,
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(
                      height: 10,
                    ),
                    pw.Expanded(
                      child: pw.Column(
                        children: [
                          pw.Text(
                            'My Projects & Work',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                              color: PdfColors.black,
                              fontSize: 24,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.SizedBox(
                            height: 5,
                          ),
                          pw.Text(
                            'A selection of projects that showcase my passion for building beautiful and functional applications.',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                              color: PdfColors.black,
                              fontSize: 12,
                            ),
                          ),

                          // Assume 'screenshotImage' (pw.MemoryImage) is defined and loaded outside this function
                          // Assuming you have loaded your image asset outside this page builder:
                          // final pw.MemoryImage screenshotImage = await _getPlaceholderImage();
                          pw.Expanded(
                            child: pw.ListView.builder(
                              itemBuilder:
                                  (
                                    context,
                                    snapshot,
                                  ) {
                                    return _buildProjecCard(
                                      projects[snapshot],
                                    );
                                  },
                              itemCount: projects.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
    ),
  );

  return pdf.save();
}

// The PDF card builder function needs to use absolute units.
pw.Widget
_buildProjecCard(
  Project project,
) {
  // Define absolute values that look good in a PDF grid
  const double padding = 12.0;
  const double titleFontSize = 14.0;
  const double spacing = 4.0;
  const double descriptionFontSize = 10.0;

  // NOTE: You need to wrap this in a container or use an Expanded/Flexible
  // when used in a GridView child to define its area properly.
  // For simplicity, we'll keep the inner structure.

  return pw.Align(
    alignment: pw.Alignment.topLeft,
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        // ... [Image/Screenshot Area goes here, which should also use fixed sizes]

        // Text Content Area
        pw.Padding(
          // FIX: Replaced 24.w with a fixed padding value (12.0)
          padding: pw.EdgeInsets.all(
            padding,
          ),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              //  pw.Container(
              //           width: 120,
              //           height: 120,
              //           decoration: pw.BoxDecoration(
              //             shape: pw.BoxShape.circle,
              //             image: pw.DecorationImage(
              //               image: profileimage
              //               fit: pw.BoxFit.cover,
              //             ),
              //           ),
              //         ),
              pw.Text(
                project.title,
                style: pw.TextStyle(
                  color: PdfColors.black,
                  // FIX: Replaced 18.sp with a fixed font size (titleFontSize)
                  fontSize: titleFontSize,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              // FIX: Replaced 8.h with a fixed size (spacing)
              pw.SizedBox(
                height: spacing,
              ),
              pw.Text(
                project.description,
                style: pw.TextStyle(
                  color: PdfColors.black,
                  // FIX: Replaced 14.sp with a fixed font size (descriptionFontSize)
                  fontSize: descriptionFontSize,
                ),
                maxLines: 3,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// You must define a function that returns a PDF widget (pw.Widget)
pw.Widget
_buildPdfProjectCard(
  Project project,
  pw.MemoryImage screenshotImage,
) {
  // Define PDF Colors (use PdfColor)

  final PdfColor cardDark = const PdfColor.fromInt(
    0xFF112240,
  );
  final PdfColor accentColor = const PdfColor.fromInt(
    0xFF64FFDA,
  );
  final PdfColor secondaryText = const PdfColor.fromInt(
    0xFF8892B0,
  );

  return pw.Container(
    // Ensure the card has a fixed aspect ratio or size for the grid to work well
    decoration: pw.BoxDecoration(
      color: cardDark,
      borderRadius: pw.BorderRadius.circular(
        8,
      ),
    ),
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        // Image Placeholder/Header (must be a pw.Widget)
        // pw.Container(
        //   height: 100,
        //   color: PdfColors.black,
        //   child: pw.Center(
        //     child: pw.Image(screenshotImage, fit: pw.BoxFit.cover),
        //   ),
        // ),

        // Content
        pw.Padding(
          padding: const pw.EdgeInsets.all(
            12,
          ),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                project.title,
                style: pw.TextStyle(
                  color: accentColor,
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                ),
                maxLines: 1,
              ),
              pw.SizedBox(
                height: 4,
              ),
              pw.Text(
                project.description,
                style: pw.TextStyle(
                  color: secondaryText,
                  fontSize: 10,
                ),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// Function to load placeholder image (as previously defined)
Future<
  pw.MemoryImage
>
_getPlaceholderImage() async {
  final ByteData bytes = await rootBundle.load(
    'assets/placeholder.png',
  );
  return pw.MemoryImage(
    bytes.buffer.asUint8List(),
  );
}

// Import your Project model

// Mock function to load a network image for the PDF
// In a real app, you'd use http package to fetch the image bytes
// before calling this function. For simplicity, we'll use a placeholder.
Future<
  Uint8List
>
_getPlaceholderImageBytes() async {
  // Use a simple square image asset bundled with the app
  final ByteData bytes = await rootBundle.load(
    'assets/placeholder.png',
  );
  return bytes.buffer.asUint8List();
}

Future<
  Uint8List
>
generateProjectPdf(
  Project project,
) async {
  final pdf = pw.Document();

  // --- Define PDF Colors (Mirroring your Flutter colors) ---
  final PdfColor cardDark = const PdfColor.fromInt(
    0xFF112240,
  );
  final PdfColor primaryText = const PdfColor.fromInt(
    0xFFCCD6F6,
  );
  final PdfColor secondaryText = const PdfColor.fromInt(
    0xFF8892B0,
  );
  final PdfColor accentColor = const PdfColor.fromInt(
    0xFF64FFDA,
  );
  final PdfColor backgroundDark = const PdfColor.fromInt(
    0xFF0A192F,
  );

  // --- Image Handling ---
  // To include a network image in a PDF, you must fetch its bytes first.
  // For this example, we'll use a local placeholder image, or you'd use
  // a function to fetch the image bytes from project.screenshotText.
  final Uint8List imageBytes = await _getPlaceholderImageBytes();
  final pw.MemoryImage screenshotImage = pw.MemoryImage(
    imageBytes,
  );

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build:
          (
            pw.Context context,
          ) {
            // --- Mimic the ProjectCard Layout ---
            return pw.Center(
              child: pw.Container(
                width: 350, // Fixed width for PDF Card
                decoration: pw.BoxDecoration(
                  color: cardDark,
                  borderRadius: pw.BorderRadius.circular(
                    12,
                  ),
                ),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  mainAxisSize: pw.MainAxisSize.min,
                  children: [
                    // Screenshot Area
                    pw.Container(
                      height: 180, // Fixed height for PDF
                      decoration: pw.BoxDecoration(
                        color: backgroundDark,
                        borderRadius: const pw.BorderRadius.vertical(
                          top: pw.Radius.circular(
                            12,
                          ),
                        ),
                      ),
                      child: pw.Center(
                        // Use a placeholder image for demonstration
                        child: pw.Image(
                          screenshotImage,
                          fit: pw.BoxFit.cover,
                        ),
                      ),
                    ),

                    // Text Content Area
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(
                        24,
                      ),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          // Title
                          pw.Text(
                            project.title,
                            style: pw.TextStyle(
                              color: accentColor, // Use accentColor for hover-like state
                              fontSize: 18,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.SizedBox(
                            height: 8,
                          ),
                          // Description
                          pw.Text(
                            project.description,
                            style: pw.TextStyle(
                              color: secondaryText,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
    ),
  );

  return pdf.save();
}

Future<
  Uint8List
>
generatePortfolioPdf() async {
  final pdf = pw.Document();

  // Load fonts
  final fontRegular = await PdfGoogleFonts.openSansRegular();
  final fontBold = await PdfGoogleFonts.openSansBold();

  // Load profile image
  final profileImage = pw.MemoryImage(
    (await rootBundle.load(
      "assets/profile.jpg",
    )).buffer.asUint8List(),
  );

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(
        32,
      ),
      build:
          (
            context,
          ) {
            return pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // LEFT COLUMN
                pw.Expanded(
                  flex: 5,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      // Profile Header
                      pw.Row(
                        children: [
                          pw.Container(
                            width: 120,
                            height: 120,
                            decoration: pw.BoxDecoration(
                              shape: pw.BoxShape.circle,
                              image: pw.DecorationImage(
                                image: profileImage,
                                fit: pw.BoxFit.cover,
                              ),
                            ),
                          ),
                          pw.SizedBox(
                            width: 20,
                          ),
                          pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                "Hello, Jayce Mico Dignadice",
                                style: pw.TextStyle(
                                  font: fontBold,
                                  fontSize: 22,
                                ),
                              ),
                              pw.SizedBox(
                                height: 4,
                              ),
                              pw.Text(
                                "Senior Flutter Developer",
                                style: pw.TextStyle(
                                  // font: fontRegular,
                                  fontSize: 16,
                                  color: PdfColors.blue,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      pw.SizedBox(
                        height: 30,
                      ),

                      // My Story
                      pw.Text(
                        "My Story",
                        style: pw.TextStyle(
                          font: fontBold,
                          fontSize: 20,
                        ),
                      ),
                      pw.SizedBox(
                        height: 10,
                      ),

                      pw.Text(
                        "For over 5 years, I've been immersed in mobile development, "
                        "with a deep passion for building high-performance applications using Flutter.",
                        style: pw.TextStyle(
                          // font: fontRegular,
                          fontSize: 13,
                          color: PdfColors.grey700,
                          lineSpacing: 4,
                        ),
                      ),

                      pw.SizedBox(
                        height: 10,
                      ),

                      pw.Text(
                        "I thrive on creating intuitive and beautiful apps with scalable architecture.",
                        style: pw.TextStyle(
                          // font: fontRegular,
                          fontSize: 13,
                          color: PdfColors.grey700,
                          lineSpacing: 4,
                        ),
                      ),

                      pw.SizedBox(
                        height: 20,
                      ),

                      // Social icons replaced with URLs
                      pw.Text(
                        "GitHub: https://github.com/ConquerThroughConnectivity",
                        style: pw.TextStyle(
                          font: fontRegular,
                          fontSize: 12,
                        ),
                      ),
                      pw.Text(
                        "Upwork: https://www.upwork.com/freelancers/~0128102012664543dd",
                        style: pw.TextStyle(
                          font: fontRegular,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),

                pw.SizedBox(
                  width: 30,
                ),

                // RIGHT COLUMN
                pw.Expanded(
                  flex: 4,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        "My Toolkit",
                        style: pw.TextStyle(
                          font: fontBold,
                          fontSize: 20,
                        ),
                      ),
                      pw.SizedBox(
                        height: 20,
                      ),

                      skillGroup(
                        "MOBILE & CROSS-PLATFORM",
                        [
                          "Flutter",
                          "Dart",
                          "Android",
                          "iOS",
                        ],
                        fontRegular,
                      ),
                      skillGroup(
                        "STATE MANAGEMENT",
                        [
                          "Provider",
                          "BLoC",
                          "Riverpod",
                        ],
                        fontRegular,
                      ),
                      skillGroup(
                        "BACKEND & CLOUD",
                        [
                          "Firebase",
                          "REST APIs",
                          "Node.js",
                          "Django",
                          "Python",
                        ],
                        fontRegular,
                      ),
                      skillGroup(
                        "TOOLS & PLATFORMS",
                        [
                          "GitHub",
                          "CI/CD",
                          "VS Code",
                        ],
                        fontRegular,
                      ),

                      pw.SizedBox(
                        height: 25,
                      ),

                      // CTA section
                      pw.Container(
                        padding: const pw.EdgeInsets.all(
                          20,
                        ),
                        decoration: pw.BoxDecoration(
                          color: PdfColors.blue,
                          borderRadius: pw.BorderRadius.circular(
                            12,
                          ),
                        ),
                        child: pw.Column(
                          children: [
                            pw.Text(
                              "Looking to build a high-performance app?",
                              style: pw.TextStyle(
                                font: fontBold,
                                fontSize: 16,
                                color: PdfColors.white,
                              ),
                              textAlign: pw.TextAlign.center,
                            ),
                            pw.SizedBox(
                              height: 10,
                            ),
                            pw.Text(
                              "I'm available for freelance projects and collaboration.",
                              style: pw.TextStyle(
                                font: fontRegular,
                                color: PdfColors.white,
                                fontSize: 12,
                              ),
                              textAlign: pw.TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
    ),
  );

  return pdf.save();
}

// Helper for skill groups
pw.Widget
skillGroup(
  String title,
  List<
    String
  >
  skills,
  pw.Font fontregular,
) {
  return pw.Padding(
    padding: const pw.EdgeInsets.only(
      bottom: 12,
    ),
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          title,
          style: pw.TextStyle(
            font: fontregular,
            fontSize: 11,
            color: PdfColors.grey600,
            letterSpacing: 1,
          ),
        ),
        pw.SizedBox(
          height: 6,
        ),
        pw.Wrap(
          spacing: 6,
          runSpacing: 6,
          children: skills
              .map(
                (
                  e,
                ) => pw.Container(
                  padding: const pw.EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  decoration: pw.BoxDecoration(
                    color: PdfColors.grey200,
                    borderRadius: pw.BorderRadius.circular(
                      6,
                    ),
                  ),
                  child: pw.Text(
                    e,
                    style: pw.TextStyle(
                      font: fontregular,
                      fontSize: 12,
                      color: PdfColors.black,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    ),
  );
}
