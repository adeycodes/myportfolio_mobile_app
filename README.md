# Portfolio Mobile App - Adeyefa Emmanuel

A modern, swipeable portfolio mobile application built with Flutter for the HNG12 Mobile Development Internship - Stage 0.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

## 📱 Features

- **Swipeable Full-Screen Pages** - Navigate through sections with smooth swipe gestures
- **5 Interactive Sections:**
  - 👤 Profile - Introduction and availability status
  - 💼 About/Services - My specializations and offerings
  - 🛠️ Skills - Technical expertise showcase
  - 📂 Portfolio - Selected work and projects
  - 📧 Contact - Get in touch section

- **Light/Dark Theme Toggle** - Seamless theme switching
- **Professional Design System** - Consistent brand colors and typography
- **Responsive Layout** - Optimized for all mobile screen sizes
- **Smooth Animations** - Polished user experience

## 🎨 Design System

### Colors
- **Primary (Brand):** `#7B4397` - Purple accent for CTAs and highlights
- **Background Light:** `#FFFFFF` - Clean white for light mode
- **Background Dark:** `#1A1A1A` - Deep dark for dark mode
- **Text Secondary Light:** `#666666` - Medium grey for subtitles
- **Text Secondary Dark:** `#A0A0A0` - Light grey for dark mode text
- **Success:** `#34C759` - Green for positive indicators
- **Error:** `#FF3B30` - Red for alerts

### Typography
- **Font Family:** Montserrat (Default fallback for non-Google Fonts setup)
- **Weights:** Regular (400), Semi-Bold (600), Bold (700)

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code with Flutter extensions
- An emulator or physical device for testing

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/adeycodes/portfolio-mobile-app.git
   cd portfolio-mobile-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Add your profile image**
   - Place your image in `assets/images/` folder
   - Name it `profile.wecp` (or update the path in `main.dart`)

4. **Update pubspec.yaml**
   ```yaml
   flutter:
     uses-material-design: true
     assets:
       - assets/images/
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

## 📂 Project Structure

```
lib/
├── main.dart                 # App entry point & theme configuration
├── pages/
│   ├── profile_page.dart     # Profile introduction page
│   ├── services_page.dart    # About & services page
│   ├── skills_page.dart      # Skills showcase page
│   ├── portfolio_page.dart   # Projects portfolio page
│   └── contact_page.dart     # Contact information page
└── widgets/
    ├── service_chip.dart     # Reusable service tag widget
    ├── skill_card.dart       # Skill display card
    ├── project_card.dart     # Project showcase card
    └── contact_info.dart     # Contact item widget

assets/
└── images/
    └── profile.wecp          # Profile picture
```

## 🎯 Key Features Breakdown

### Swipeable Navigation
- Uses Flutter's `PageView` widget for smooth horizontal scrolling
- Page indicators on the right show current position
- Intuitive swipe gestures for navigation

### Theme System
- Built-in light/dark mode toggle
- Persistent theme preference (can be extended with SharedPreferences)
- Brand-consistent colors across both themes

### Animations
- Entrance animations on app load
- Smooth page transitions
- Interactive hover effects (on supported platforms)

## 🛠️ Built With

- **Flutter** - UI framework
- **Dart** - Programming language
- **Material Design 3** - Design system

## 📸 Screenshots

| Profile | Skills | Portfolio | Contact |
|---------|--------|-----------|---------|
| ![Profile](screenshots/profile.png) | ![Skills](screenshots/skills.png) | ![Portfolio](screenshots/portfolio.png) | ![Contact](screenshots/contact.png) |

## 📱 APK Build

To build an APK for testing:

```bash
flutter build apk --release
```

The APK will be located at: `build/app/outputs/flutter-apk/app-release.apk`

### Upload to Appetize.io
1. Visit [appetize.io](https://appetize.io)
2. Upload your APK
3. Get the public preview link
4. Share for remote testing

## 🌐 Demo

- **Live Preview:** [Appetize.io Link](your-appetize-link-here)
- **GitHub Repository:** [github.com/adeycodes/portfolio-mobile-app](https://github.com/adeycodes/portfolio-mobile-app)

## 👨‍💻 Author

**Adeyefa Emmanuel**
- GitHub: [@adeycodes](https://github.com/adeycodes)
- LinkedIn: [emmanuel-adeyefa](https://linkedin.com/in-emmanuel-adeyefa)
- Email: emmanueladeyefa23@gmail.com

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- HNG Internship Program for the opportunity
- Flutter community for excellent documentation
- Design inspiration from modern portfolio websites

## 📝 Development Notes

### HNG Stage 0 Requirements Met:
✅ Portfolio app with About, Skills, and Contact sections  
✅ Light/Dark theme toggle implementation  
✅ APK uploaded to Appetize.io  
✅ Professional design and user experience  
✅ Social media documentation (LinkedIn & Twitter posts)  

### Future Enhancements:
- [ ] Add project detail pages with screenshots
- [ ] Implement contact form with email integration
- [ ] Add blog/articles section
- [ ] Integrate with GitHub API for live project updates
- [ ] Add animations and micro-interactions
- [ ] Implement analytics tracking

---

**Built with ❤️ for HNG12 Internship**