import 'package:emailjs/emailjs.dart' as emailjs;
import 'package:flutter/material.dart';

// --- Theme and Constants ---

// Breakpoint for switching from mobile (single column) to desktop (two columns)
const double kMaxMobileWidth = 600.0;

// Custom Color Palette based on the image (Original dark colors for input contrast)
const Color _kBackgroundColor = Color(0xFF141920); // Dark background
const Color _kCardColor = Color(
  0xFF1C252D,
); // Form field background (Kept dark for contrast)
const Color _kAccentColor = Color(0xFF00A0E3); // Bright blue button
const Color _kTextColor = Color(0xFFE0E0E0); // Off-white text color for content

// --- Main Application ---

void main() {
  runApp(const ResponsiveContactFormApp());
}

class ResponsiveContactFormApp extends StatelessWidget {
  const ResponsiveContactFormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Contact Form',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // --- BACKGROUND RESTORED / DARK THEME START ---
        // Set the overall dark theme background for the transparent card to show
        scaffoldBackgroundColor: _kBackgroundColor,
        fontFamily: 'Roboto',
        textTheme: Theme.of(context).textTheme.apply(
          // Default text color is white/light
          bodyColor: _kTextColor,
          displayColor: _kTextColor,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          filled: true,
          fillColor: _kCardColor, // Keep dark card color for contrast
          hintStyle: const TextStyle(
            color: Color(0xFF9AA5B1),
          ), // Lighter hint text
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 16.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            // Subtle border, slightly brighter than the previous opacity for more definition
            borderSide: BorderSide(
              color: _kAccentColor.withOpacity(0.3),
              width: 1.0,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            // Kept the bright blue border for focus
            borderSide: BorderSide(color: _kAccentColor, width: 2.0),
          ),
        ),
        // --- BACKGROUND RESTORED / DARK THEME END ---
      ),
      home: const HomePage(),
    );
  }
}

// --- Placeholder Widgets (Required for HomePage) ---

class ParticleNetworkBackground extends StatelessWidget {
  const ParticleNetworkBackground({super.key});

  @override
  Widget build(BuildContext context) {
    // This widget is intentionally left empty/unused in HomePage now
    return Container(color: _kBackgroundColor);
  }
}

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Simple placeholder for the navigation bar
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Text(
        'Navigation Bar (Placeholder)',
        style: TextStyle(
          color: _kTextColor,
          fontSize: 18,
        ), // Updated text color to white
      ),
    );
  }
}

// --- HomePage (User's requested integration structure) ---

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Background Animation Layer - Still technically a container, now colored by Scaffold
          // 2. Content Layer
          SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1440),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 30.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      NavBar(),
                      SizedBox(height: 100.0),
                      ContactFormScreen(),
                      SizedBox(height: 100.0),
                    ],
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

// --- Contact Form Screen (Adapted to be content/not a full screen) ---

class ContactFormScreen extends StatelessWidget {
  const ContactFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > kMaxMobileWidth;

        final double cardWidth = isDesktop ? 800.0 : constraints.maxWidth * 0.9;

        return ConstrainedBox(
          constraints: BoxConstraints(maxWidth: cardWidth),
          child: ContactFormCard(isDesktop: isDesktop),
        );
      },
    );
  }
}

// --- Form Card Widget ---

class ContactFormCard extends StatelessWidget {
  final bool isDesktop;

  const ContactFormCard({required this.isDesktop, super.key});

  @override
  Widget build(BuildContext context) {
    final double padding = isDesktop ? 48.0 : 24.0;
    final Color contentColor = _kTextColor; // Text color is now white/light

    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController subjectController = TextEditingController();
    TextEditingController messageController = TextEditingController();

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.transparent, // Form background is now transparent
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: const [
          // Removed shadow since the card is transparent
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header section
        
          Icon(Icons.lock_outline, color: contentColor, size: 30),
          const SizedBox(height: 8),
          Center(
            child: Text(
              'Luit In Form',
              style: TextStyle(
                color: contentColor.withOpacity(0.7),
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            'Get in Touch',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: contentColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Let's connect! Send me a message using the form below.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: contentColor.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 32),

          // Responsive Name and Email Fields
          isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildTextFieldWithLabel(
                        'Your Name',
                        'Enter your full name',
                        textediting: nameController,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: _buildTextFieldWithLabel(
                        'Your Email',
                        'Enter your email address',
                        keyboardType: TextInputType.emailAddress,
                        textediting: emailController,
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextFieldWithLabel(
                      'Your Name',
                      'Enter your full name',
                      textediting: nameController,
                    ),
                    const SizedBox(height: 24),
                    _buildTextFieldWithLabel(
                      'Your Email',
                      'Enter your email address',
                      keyboardType: TextInputType.emailAddress,
                      textediting: emailController,
                    ),
                  ],
                ),

          const SizedBox(height: 24),

          // Subject Field
          _buildTextFieldWithLabel(
            'Subject',
            'What is this about?',
            textediting: subjectController,
          ),

          const SizedBox(height: 24),

          // Message Field
          _buildTextFieldWithLabel(
            'Message',
            'Write your message here...',
            maxLines: 6,
            textediting: messageController,
          ),

          const SizedBox(height: 32),

          // Submit Button
          SizedBox(
            height: 56.0,
            child: ElevatedButton(
              onPressed: () {
                // Handle form submission logic here

                _sendEmail(
                  nameController.text,
                  messageController.text,
                  subjectController.text,
                  emailController.text,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Message Sent! (Simulated)')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _kAccentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 5,
                shadowColor: _kAccentColor.withOpacity(0.5),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Send Message',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.send_rounded, color: Colors.white, size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build a text field with its label
  Widget _buildTextFieldWithLabel(
    String label,
    String hint, {
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    TextEditingController? textediting,
  }) {
    // Label color is explicitly set to dark for robustness
    final Color labelColor = _kTextColor; // Label color is now white/light

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: labelColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: textediting,
          decoration: InputDecoration(hintText: hint),
          keyboardType: keyboardType,
          maxLines: maxLines,
          style: TextStyle(color: _kTextColor), // Input text is now white/light
        ),
      ],
    );
  }
}

void _sendEmail(
  String name,
  String message,
  String email,
  String subject,
) async {
  try {
    await emailjs.send(
      'service_6suf8ii',
      'template_pl7a1t9',
      {
        'to_email': 'jaycemico@gmail.com',
        'message': message,
        'name': name,
        'email': email,
        'subject': subject,
      },
      const emailjs.Options(
        publicKey: 'cD27rcS_TNjx-IfjT',
        privateKey: 'vtbwUz2yFXM-2HPiN33pU',
        limitRate: const emailjs.LimitRate(id: 'app', throttle: 10000),
      ),
    );
    print('SUCCESS!');
  } catch (error) {
    if (error is emailjs.EmailJSResponseStatus) {
      print('ERROR... $error');
    }
    print(error.toString());
  }
}
