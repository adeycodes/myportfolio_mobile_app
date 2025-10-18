import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

// Design System Constants
class AppColors {
  static const primary = Color(0xFF7B4397);
  static const secondaryLight = Color(0xFFFFFFFF);
  static const tertiaryDark = Color(0xFF1A1A1A);
  static const neutralGrey = Color(0xFF666666);
  static const neutralDarkGrey = Color(0xFFA0A0A0);
  static const success = Color(0xFF34C759);
  static const error = Color(0xFFFF3B30);
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Adeyefa Emmanuel',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.secondaryLight,
        fontFamily: 'Montserrat',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Montserrat'),
          bodyMedium: TextStyle(fontFamily: 'Montserrat'),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.tertiaryDark,
        fontFamily: 'Montserrat',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Montserrat'),
          bodyMedium: TextStyle(fontFamily: 'Montserrat'),
        ),
      ),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: PortfolioHome(
        isDarkMode: isDarkMode,
        toggleTheme: toggleTheme,
      ),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const PortfolioHome({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
  });

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isDarkMode ? AppColors.tertiaryDark : AppColors.secondaryLight,
      body: Stack(
        children: [
          // Page View with swipeable cards
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              ProfilePage(isDarkMode: widget.isDarkMode),
              ServicesPage(isDarkMode: widget.isDarkMode),
              SkillsPage(isDarkMode: widget.isDarkMode),
              PortfolioPage(isDarkMode: widget.isDarkMode),
              ContactPage(isDarkMode: widget.isDarkMode),
            ],
          ),

          // Page Indicators
          Positioned(
            right: 20,
            top: 0,
            bottom: 0,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(5, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    width: 6,
                    height: _currentPage == index ? 24 : 6,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? AppColors.primary
                          : (widget.isDarkMode ? AppColors.neutralDarkGrey : AppColors.neutralGrey),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  );
                }),
              ),
            ),
          ),

          // Theme Toggle Button (Bottom Right)
          Positioned(
            bottom: 30,
            left: 30,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withAlpha(76),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: widget.toggleTheme,
                icon: Icon(
                  widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// PAGE 1: PROFILE
class ProfilePage extends StatelessWidget {
  final bool isDarkMode;

  const ProfilePage({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.tertiaryDark : AppColors.secondaryLight,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '© Code by Adeyefa',
                  style: TextStyle(
                    fontSize: 11,
                    color: isDarkMode ? AppColors.neutralDarkGrey : AppColors.neutralGrey,
                    letterSpacing: 0.5,
                    fontFamily: 'Montserrat',
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withAlpha(51),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Text(
                    'Menu',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ],
            ),

            const Spacer(flex: 1),

            // Profile Image
            Center(
              child: Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/profile.png'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(color: AppColors.primary, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withAlpha(76),
                      blurRadius: 30,
                      offset: const Offset(0, 15),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Available Badge
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.success.withAlpha(25),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.success, width: 1.5),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.circle, color: AppColors.success, size: 8),
                    SizedBox(width: 8),
                    Text(
                      'Available for work',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.success,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Name and Title
            Center(
              child: Column(
                children: [
                  Text(
                    'Adeyefa Emmanuel',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: isDarkMode ? AppColors.secondaryLight : AppColors.tertiaryDark,
                      letterSpacing: -0.5,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Freelance Front-End Developer',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: isDarkMode ? AppColors.neutralDarkGrey : AppColors.neutralGrey,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(flex: 1),

            // Globe Icon
            Center(
              child: Icon(
                Icons.language,
                size: 40,
                color: AppColors.primary.withAlpha(128),
              ),
            ),

            const SizedBox(height: 20),

            // Swipe Hint
            Center(
              child: Text(
                'Swipe to explore →',
                style: TextStyle(
                  fontSize: 12,
                  color: isDarkMode ? AppColors.neutralDarkGrey : AppColors.neutralGrey,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// PAGE 2: SERVICES/ABOUT
class ServicesPage extends StatelessWidget {
  final bool isDarkMode;

  const ServicesPage({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.tertiaryDark : AppColors.secondaryLight,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '© Code by Adeyefa',
                  style: TextStyle(
                    fontSize: 11,
                    color: isDarkMode ? AppColors.neutralDarkGrey : AppColors.neutralGrey,
                    fontFamily: 'Montserrat',
                  ),
                ),
                Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 11,
                    color: isDarkMode ? AppColors.neutralDarkGrey : AppColors.neutralGrey,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ],
            ),

            const Spacer(flex: 1),

            // Main Heading
            Text(
              'Creating next\nlevel digital\nproducts',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w700,
                color: isDarkMode ? AppColors.secondaryLight : AppColors.tertiaryDark,
                height: 1.1,
                letterSpacing: -1,
                fontFamily: 'Montserrat',
              ),
            ),

            const SizedBox(height: 40),

            // Description
            Text(
              'I specialize in building modern, responsive web and mobile applications. From concept to deployment, I create digital experiences that users love.',
              style: TextStyle(
                fontSize: 16,
                color: isDarkMode ? AppColors.neutralDarkGrey : AppColors.neutralGrey,
                height: 1.6,
                fontFamily: 'Montserrat',
              ),
            ),

            const SizedBox(height: 40),

            // Service Tags
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: const [
                ServiceChip(label: 'Web Development', isActive: true),
                ServiceChip(label: 'Mobile Apps', isActive: false),
                ServiceChip(label: 'UI/UX Design', isActive: false),
              ],
            ),

            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}

// PAGE 3: SKILLS
class SkillsPage extends StatelessWidget {
  final bool isDarkMode;

  const SkillsPage({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.tertiaryDark : AppColors.secondaryLight,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Skills &\nExpertise',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w700,
                color: isDarkMode ? AppColors.secondaryLight : AppColors.tertiaryDark,
                height: 1.1,
                letterSpacing: -1,
                fontFamily: 'Montserrat',
              ),
            ),

            const SizedBox(height: 60),

            // Skills Grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.3,
                children: const [
                  SkillCard(icon: Icons.javascript, title: 'JavaScript', subtitle: 'ES6+, Modern JS'),
                  SkillCard(icon: Icons.dynamic_feed, title: 'React', subtitle: 'Hooks, Context'),
                  SkillCard(icon: Icons.flutter_dash, title: 'Flutter', subtitle: 'Cross-platform'),
                  SkillCard(icon: Icons.code, title: 'HTML/CSS', subtitle: 'Responsive Design'),
                  SkillCard(icon: Icons.style, title: 'TailwindCSS', subtitle: 'Utility-first CSS'),
                  SkillCard(icon: Icons.storage, title: 'Git', subtitle: 'Version Control'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// PAGE 4: PORTFOLIO
class PortfolioPage extends StatelessWidget {
  final bool isDarkMode;

  const PortfolioPage({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.tertiaryDark : AppColors.secondaryLight,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selected\nWork',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w700,
                color: isDarkMode ? AppColors.secondaryLight : AppColors.tertiaryDark,
                height: 1.1,
                letterSpacing: -1,
                fontFamily: 'Montserrat',
              ),
            ),

            const SizedBox(height: 40),

            Expanded(
              child: ListView(
                children: const [
                  ProjectCard(
                    title: 'E-Commerce Platform',
                    category: 'WEB DEVELOPMENT',
                    tech: 'React • TailwindCSS • Node.js',
                  ),
                  SizedBox(height: 16),
                  ProjectCard(
                    title: 'Task Management App',
                    category: 'MOBILE APP',
                    tech: 'Flutter • Firebase • Dart',
                  ),
                  SizedBox(height: 16),
                  ProjectCard(
                    title: 'Portfolio Website',
                    category: 'WEB DESIGN',
                    tech: 'HTML • CSS • JavaScript',
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

// PAGE 5: CONTACT
class ContactPage extends StatelessWidget {
  final bool isDarkMode;

  const ContactPage({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: const BoxDecoration(
        color: AppColors.tertiaryDark,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  '© Code by Adeyefa',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.neutralDarkGrey,
                    fontFamily: 'Montserrat',
                  ),
                ),
                Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.neutralDarkGrey,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60),

            const Text(
              "Let's start a\nproject together",
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w700,
                color: AppColors.secondaryLight,
                height: 1.1,
                letterSpacing: -1,
                fontFamily: 'Montserrat',
              ),
            ),

            const SizedBox(height: 50),

            ContactInfo(label: 'emmanueladeyefa23@gmail.com'),
            const SizedBox(height: 20),
            ContactInfo(label: '+234 (0) 000 0000'),
            
            const SizedBox(height: 40),
            
            const Divider(color: AppColors.neutralGrey),
            
            const SizedBox(height: 20),

            ContactInfo(label: 'github.com/adeycodes', hasArrow: false),
            const SizedBox(height: 16),
            ContactInfo(label: 'linkedin.com/in-emmanuel-adeyefa', hasArrow: false),
            const SizedBox(height: 16),
            ContactInfo(label: 'Location: Ibadan, Nigeria', hasArrow: false),

            const Spacer(),

            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withAlpha(76),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Text(
                  'Get in Touch',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Center(
              child: Text(
                'Swipe back to start',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.neutralDarkGrey,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// REUSABLE WIDGETS

class ServiceChip extends StatelessWidget {
  final String label;
  final bool isActive;

  const ServiceChip({
    super.key,
    required this.label,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : AppColors.primary.withAlpha(25),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.primary,
          width: 1.5,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: isActive ? Colors.white : AppColors.primary,
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }
}

class SkillCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const SkillCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withAlpha(25),
            AppColors.primary.withAlpha(13),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary.withAlpha(76), width: 1.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: AppColors.primary,
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: isDarkMode ? AppColors.secondaryLight : AppColors.tertiaryDark,
              fontFamily: 'Montserrat',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              color: isDarkMode ? AppColors.neutralDarkGrey : AppColors.neutralGrey,
              fontFamily: 'Montserrat',
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String category;
  final String tech;

  const ProjectCard({
    super.key,
    required this.title,
    required this.category,
    required this.tech,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.tertiaryDark : AppColors.secondaryLight,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary.withAlpha(76), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              category,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: 1,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: isDarkMode ? AppColors.secondaryLight : AppColors.tertiaryDark,
              fontFamily: 'Montserrat',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            tech,
            style: TextStyle(
              fontSize: 13,
              color: isDarkMode ? AppColors.neutralDarkGrey : AppColors.neutralGrey,
              fontFamily: 'Montserrat',
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withAlpha(13),
                  AppColors.primary.withAlpha(25),
                ],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(
                Icons.image_outlined,
                size: 40,
                color: AppColors.primary.withAlpha(128),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  final String label;
  final bool hasArrow;

  const ContactInfo({
    super.key,
    required this.label,
    this.hasArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            color: AppColors.neutralDarkGrey,
            fontWeight: FontWeight.w500,
            fontFamily: 'Montserrat',
          ),
        ),
        if (hasArrow)
          const Icon(
            Icons.arrow_outward,
            size: 18,
            color: AppColors.primary,
          ),
      ],
    );
  }
}