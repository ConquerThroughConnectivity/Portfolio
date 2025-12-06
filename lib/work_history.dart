import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// --- Mock Data ---

class JobEntry {
  final int id;
  final String review;
  final String title;
  final String date;
  final double rating;
  final int numReviews;
  final double earned;
  final double hourlyRate;
  final int hours;

  JobEntry({
    required this.id,
    required this.review,
    required this.title,
    required this.date,
    required this.rating,
    required this.numReviews,
    required this.earned,
    required this.hourlyRate,
    required this.hours,
  });
}

final List<JobEntry> workHistoryData = [
  JobEntry(
    id: 1,
    review:
        "Our company has been employing a lot of upwork devs in the past and we noticed that Jayce has some areas to improve on... See more",
    title: "Flutter Dev to Develop CRM mobile app",
    date: "Oct 10, 2023 - Feb 6, 2024",
    rating: 2.2,
    numReviews: 2,
    earned: 602.59,
    hourlyRate: 3.50,
    hours: 172,
  ),
   JobEntry(
    id: 3,
    review: "(the Philippines only ) Flutter app, Build apps...",
    title: "Flutter Developer",
    date: "Aug 30, 2022 - August 31, 2022",
    rating: 5.0,
    numReviews: 0,
    earned: 46.00,
    hourlyRate: 6.00,
    hours: 8,
  ),
  JobEntry(
    id: 2,
    review: "No review provided.",
    title: "Flutter Developer",
    date: "Sep 29, 2023 - Oct 5, 2023",
    rating: 5.0,
    numReviews: 0,
    earned: 28.33,
    hourlyRate: 5.00,
    hours: 6,
  ),
  JobEntry(
    id: 3,
    review: "(the Philippines only ) Flutter app, Build apps...",
    title: "Flutter Developer",
    date: "Sep 1, 2022 - Nov 8, 2022",
    rating: 5.0,
    numReviews: 0,
    earned: 87.00,
    hourlyRate: 6.00,
    hours: 14,
  ),
  JobEntry(
    id: 4,
    review:
        "Great working with Jayce. He does his tasks well and outputs are on spot on what I need.",
    title: "Flutter Development - Sebizio",
    date: "Oct 27, 2021 - Jan 30, 2022",
    rating: 5.0,
    numReviews: 0,
    earned: 739.00,
    hourlyRate: 6.00,
    hours: 148,
  ),
  JobEntry(
    id: 5,
    review: "Flutter - Philippines - Full Time - \$5/hr...",
    title: "Flutter - Philippines - Full Time - \$5/hr...",
    date: "Feb 24, 2021 - Apr 5, 2021",
    rating: 5.0,
    numReviews: 0,
    earned: 625.84,
    hourlyRate: 5.00,
    hours: 125,
  ),
   JobEntry(
    id: 6,
    review: "No review provided.",
    title: "Flutter Developer + MongoDB Realm GraphQL",
    date: "Dec 10, 2020 - Feb 23, 2021",
    rating: 5.0,
    numReviews: 0,
    earned: 912.67,
    hourlyRate: 4.00,
    hours: 228,
  ),
  JobEntry(
    id: 7,
    review: "Jayce was helpful in delivering the functionality as agreed",
    title: "Flutter Developer",
    date: "Nov 30, 2020 - Dec 3, 2020",
    rating: 4.0,
    numReviews: 0,
    earned: 79.33,
    hourlyRate: 4.00,
    hours: 20,
  ),
];

// --- Main Application Setup ---

void main() {
  // Ensure the widget is fully initialized before run (best practice)
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil based on a typical desktop resolution for scaling
    // This allows the fonts and sizing to scale gracefully from this base.
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      minTextAdapt: true, // Scales text based on screen size ratio
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Work History',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,
              brightness: Brightness.dark,
            ),
            scaffoldBackgroundColor: const Color(
              0xFF111827,
            ), // Dark Gray/Blue background
            textTheme: Typography.whiteMountainView.apply(
              fontFamily: 'Inter', // Default font family
            ),
            useMaterial3: true,
          ),
          // Placeholder home screen (assuming HomePage is where this is used)
          home: const WorkHistoryScreen(),
        );
      },
    );
  }
}

// --- Star Rating Component ---

class StarRating extends StatelessWidget {
  final double rating;
  final int numReviews;

  const StarRating({super.key, required this.rating, required this.numReviews});

  @override
  Widget build(BuildContext context) {
    final int fullStars = rating.floor();
    final bool hasHalfStar = rating % 1 >= 0.25 && rating % 1 <= 0.75;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) {
            IconData icon;
            Color color = Colors.amber.shade400;

            if (index < fullStars) {
              icon = Icons.star_rounded;
            } else if (hasHalfStar && index == fullStars) {
              icon = Icons.star_half_rounded;
            } else {
              icon = Icons.star_border_rounded;
              color = Colors.grey.shade600;
            }

            return Padding(
              padding: EdgeInsets.only(right: 1.w),
              child: Icon(icon, size: 14.sp, color: color),
            );
          }),
        ),
        SizedBox(width: 8.w),
        Text(
          rating.toStringAsFixed(1),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
        ),
        if (numReviews > 0)
          Padding(
            padding: EdgeInsets.only(left: 4.w),
            child: Text(
              '($numReviews reviews)',
              style: TextStyle(color: Colors.grey.shade400, fontSize: 12.sp),
            ),
          ),
      ],
    );
  }
}

// --- Work Card Component (with Neon Hover Effect) ---

class WorkCard extends StatefulWidget {
  final JobEntry job;
  const WorkCard({super.key, required this.job});

  @override
  State<WorkCard> createState() => _WorkCardState();
}

class _WorkCardState extends State<WorkCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final accentColor = Colors.teal.shade400;

    return MouseRegion(
      onEnter: (event) => setState(() => _isHovering = true),
      onExit: (event) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: const Color(0xFF1F2937), // gray-800
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            // Neon Glow Effect on Hover
            if (_isHovering)
              BoxShadow(
                color: accentColor.withOpacity(0.6),
                blurRadius: 30.r,
                spreadRadius: 3.r,
              ),
            // Standard shadow
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10.r,
              offset: Offset(0, 5.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Review/Quote Section
            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.grey.shade300,
                  fontSize: 14.sp,
                  fontStyle: FontStyle.italic,
                  height: 1.4,
                ),
                children: [
                  TextSpan(text: widget.job.review.split('...')[0]),
                  WidgetSpan(
                    child: Padding(
                      padding: EdgeInsets.only(left: 4.w),
                      child: GestureDetector(
                        onTap: () {
                          // Handle "See more" tap
                        },
                        child: Text(
                          'See more',
                          style: TextStyle(
                            color: accentColor,
                            fontSize: 14.sp,
                            decoration: TextDecoration.underline,
                            decorationColor: accentColor,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // Separator and Title/Date
            Divider(color: Colors.grey.shade700, height: 1.h),
            SizedBox(height: 16.h),

            // 2. Title and Date
            Text(
              widget.job.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              widget.job.date,
              style: TextStyle(color: Colors.grey.shade400, fontSize: 12.sp),
            ),
            SizedBox(height: 12.h),

            // 3. Rating
            StarRating(
              rating: widget.job.rating,
              numReviews: widget.job.numReviews,
            ),
            SizedBox(height: 16.h),

            // 4. Metrics
            Row(
              children: [
                // Total Earned
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '\$${widget.job.earned.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: accentColor,
                          fontSize: 14.sp,
                        ),
                      ),
                      const TextSpan(text: ' • '),
                    ],
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),

                // Hourly Rate
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            '\$${widget.job.hourlyRate.toStringAsFixed(2)}/hr',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: accentColor,
                          fontSize: 14.sp,
                        ),
                      ),
                      const TextSpan(text: ' • '),
                    ],
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),

                // Hours
                Text(
                  '${widget.job.hours} hrs',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: accentColor,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// --- Main Screen Layout (Fixed for Nested Use) ---

// --- Main Screen Layout (Fixed for Nested Use) ---

class WorkHistoryScreen extends StatelessWidget {
  const WorkHistoryScreen({super.key});

  // 📐 Pre-calculate the card height based on your widget's layout (in h units)
  // 48h (vertical padding) + 64h (vertical spaces) + ~150h (estimated content height)
  // This estimate should be generous to avoid overflows.
  final double _cardHeight = 310.0; // Use a comfortable, slightly generous height

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ... (Header Section remains the same)

          Center(
            child: Text(
              'Work History / Upwork',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFFCCD6F6),
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Center(
            child: Text(
              'My Works on upwork up to 700+ hours.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF8892B0),
                fontSize: 14.sp,
              ),
            ),
          ),
          SizedBox(height: 32.h),

          // Work Cards Grid (Responsive GridView)
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount;
              double availableWidth = constraints.maxWidth;

              // Responsive logic remains the same
              if (availableWidth >= 1200.w) {
                crossAxisCount = 3;
              } else if (availableWidth >= 700.w) {
                crossAxisCount = 2;
              } else {
                crossAxisCount = 1;
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: workHistoryData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 70.w,
                  mainAxisSpacing: 70.h,
                  // 🎯 THE FIX: Use mainAxisExtent with a scaled height.
                  // ScreenUtil.instance.setHeight is preferred for a fixed height in h units.
                  // We convert the _cardHeight from raw double to scaled h value.
                  mainAxisExtent: ScreenUtil().setHeight(_cardHeight), 
                ),
                itemBuilder: (context, index) {
                  return WorkCard(job: workHistoryData[index]);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
