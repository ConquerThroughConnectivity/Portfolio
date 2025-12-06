import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import screenutil

// --- Data Model ---
class Project {
  final String title;
  final String description;
  final String screenshotText;

  Project(this.title, this.description, this.screenshotText);
}

// --- Project Data ---
final List<Project> projects = [
  Project(
    'Flutter Covid App',
    'Apps like "TracerX" (a conceptual app built with Flutter) used the Google Nearby API and Firebase to detect other users and notify them of potential exposure.',
    'https://res.cloudinary.com/nearform-website/image/upload/covid-19-contact-tracing-app.png',
  ),
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
  Project(
    'Flutter WhereTo Delivery App',
    'WhereTo delivers food from your favorite local restaurants right to your door. Browse thousands of menus, place your order in minutes, and track your delivery in real time.',
    'https://www.businessofapps.com/wp-content/uploads/2022/01/emizen_tech_food_deliver_img1.png',
    ),
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

// --- Project Card Widget (with Hover Effect) ---
class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovering = false;

  // Define Colors
  final Color backgroundDark = const Color(0xFF0A192F);
  final Color cardDark = const Color(0xFF112240);
  final Color primaryText = const Color(0xFFCCD6F6);
  final Color secondaryText = const Color(0xFF8892B0);
  final Color accentColor = const Color(0xFF64FFDA);

  @override
  Widget build(BuildContext context) {
    // Determine the transformation based on hover state
    final double translateY = _isHovering ? -8.0 : 0.0;

    return MouseRegion(
      onEnter: (event) => setState(() => _isHovering = true),
      onExit: (event) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: Matrix4.translationValues(0, translateY, 0),
        decoration: BoxDecoration(
          color: cardDark,
          borderRadius: BorderRadius.circular(12.r), // Responsive border radius
          boxShadow: [
            if (_isHovering)
              BoxShadow(
                color: accentColor.withOpacity(0.08),
                blurRadius: 20,
                offset: const Offset(0, 5),
              ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Screenshot Placeholder Area
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 180.h, // Responsive height using screenutil
              decoration: BoxDecoration(
                color: backgroundDark,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
              ),
              child: Center(
                child:   SizedBox(
                  width: double.infinity,
                  child: Image.network( widget.project.screenshotText, fit: BoxFit.cover,))
              ),
            ),

            // Text Content Area
            Padding(
              padding: EdgeInsets.all(24.w), // Responsive padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.project.title,
                    style: TextStyle(
                      color: _isHovering ? accentColor : primaryText,
                      fontSize: 18.sp, // Responsive font size
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    widget.project.description,
                    style: TextStyle(
                      color: secondaryText,
                      fontSize: 14.sp, // Responsive font size
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Content Widget (This is what you should now embed in your Column) ---
// This widget contains ONLY the project grid and header.
class ProjectsContent extends StatelessWidget {
  const ProjectsContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine if the layout should be a single column or a grid based on screen width
    final isDesktop = MediaQuery.of(context).size.width > 900;
    final isTablet = MediaQuery.of(context).size.width > 600;
    
    // Total number of columns for the grid
    final int crossAxisCount = isDesktop ? 3 : (isTablet ? 2 : 1);
    
    // The content itself no longer manages scrolling or a Scaffold.
    return Padding(
      // Padding is added here to define the content boundary
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1100.w), // Max width for content
          child: Column(
            // Use CrossAxisAlignment.stretch for the content within the ConstrainedBox
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Section
              Padding(
                padding: EdgeInsets.only(bottom: 40.h),
                child: Column(
                  children: [
                    Text(
                      'My Projects & Work',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFFCCD6F6),
                        fontSize: 32.sp, // Responsive font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'A selection of projects that showcase my passion for building beautiful and functional applications.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF8892B0),
                        fontSize: 14.sp, // Responsive font size
                      ),
                    ),
                  ],
                ),
              ),
    
              // Projects Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), // Prevents nested scrolling conflicts
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 45.w,
                  mainAxisSpacing: 55.h,
                  childAspectRatio: 1.1, // Adjust this ratio as needed for card content
                ),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return ProjectCard(project: projects[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Main Application Wrapper (for standalone preview) ---
// This wrapper applies the Scaffold and SingleChildScrollView for preview purposes.
// NOTE: In your production code, use ProjectsContent() directly inside your HomePage's Column.
class ProjectsPreviewWrapper extends StatelessWidget {
  const ProjectsPreviewWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF0A192F),
      body: SingleChildScrollView(
        child: ProjectsContent(),
      ),
    );
  }
}

// --- Root Application Setup ---
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    // ScreenUtilInit is properly placed here to initialize responsiveness
    return ScreenUtilInit(
      designSize: const Size(360, 690), // Standard mobile size for scaling
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          // Launching the preview wrapper here for standalone demonstration
          home: ProjectsPreviewWrapper(),
        );
      },
    );
  }
}