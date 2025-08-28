// lib/main.dart
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const YashuArtsApp());
}

/// Global uploaded images stored as XFile (web + mobile friendly)
List<XFile> uploadedImages = [];

class YashuArtsApp extends StatelessWidget {
  const YashuArtsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yashu Arts',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.transparent,
      ),
      home: const HomePage(),
    );
  }
}

// ------------------ PremiumButton ------------------
class PremiumButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  final String heroTag;
  final EdgeInsetsGeometry padding;

  const PremiumButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    required this.heroTag,
    this.padding = const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
  });

  @override
  State<PremiumButton> createState() => _PremiumButtonState();
}

class _PremiumButtonState extends State<PremiumButton>
    with SingleTickerProviderStateMixin {
  bool _hover = false;
  bool _pressed = false;

  Duration get _dur => const Duration(milliseconds: 180);

  void _onTapDown(_) => setState(() => _pressed = true);
  void _onTapUp(_) {
    setState(() => _pressed = false);
    widget.onTap();
  }

  void _onTapCancel() => setState(() => _pressed = false);

  @override
  Widget build(BuildContext context) {
    final scale = _pressed ? 0.96 : (_hover ? 1.05 : 1.0);

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedScale(
        scale: scale,
        duration: _dur,
        curve: Curves.easeOut,
        child: GestureDetector(
          onTapDown: _onTapDown,
          onTapUp: _onTapUp,
          onTapCancel: _onTapCancel,
          child: Hero(
            tag: widget.heroTag,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 160,
                  height: 60,
                  child: Lottie.asset(
                    'assets/animations/Sparkles.json',
                    fit: BoxFit.cover,
                    repeat: true,
                    animate: true,
                  ),
                ),
                Container(
                  padding: widget.padding,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF7B61FF), Color(0xFF5BC0FF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.18),
                          blurRadius: 12,
                          offset: const Offset(0, 8)),
                      BoxShadow(
                          color: Colors.white.withOpacity(0.03),
                          blurRadius: 0,
                          offset: const Offset(0, -1)),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(widget.icon, color: Colors.white, size: 20),
                      const SizedBox(width: 10),
                      Text(widget.text,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ------------------ Home Page ------------------
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _openInstagram() async {
    final url = Uri.parse("https://instagram.com/yashu_arts_1067");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _openWhatsApp(String msg) async {
    final url = Uri.parse(
        "https://wa.me/919398029785?text=${Uri.encodeComponent(msg)}");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  void _showComingSoonDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.deepPurpleAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          "🎨 Coming Soon!",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        content: const Text(
          '"Maha Avatars of Sri Maha Vishnu"',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          Center(
            child: ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent),
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () => _showComingSoonDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(color: Colors.deepPurple),
                child: Center(
                    child: Text("Yashu Arts",
                        style: TextStyle(fontSize: 22, color: Colors.white)))),
            ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                onTap: () => Navigator.pop(context)),
            ListTile(
                leading: const Icon(Icons.photo),
                title: const Text("Gallery"),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const GalleryPage()))),
            ListTile(
                leading: const Icon(Icons.info),
                title: const Text("About"),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const AboutPage()))),
            ListTile(
                leading: const Icon(Icons.upload),
                title: const Text("Artist Upload"),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const LoginPage(forUpload: true)))),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2E1051), Color(0xFF7B61FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
                Container(
                  height: 50,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.18),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "✨ Welcome to Yashu Arts ✨",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(height: 30),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    PremiumButton(
                        text: "About Us",
                        icon: Icons.info,
                        heroTag: "aboutBtn",
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(
                                builder: (_) => const AboutPage()))),
                    PremiumButton(
                        text: "Register",
                        icon: Icons.school,
                        heroTag: "registerBtn",
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(
                                builder: (_) => const RegisterPage()))),
                    PremiumButton(
                        text: "Custom Order",
                        icon: Icons.shopping_bag,
                        heroTag: "customOrderBtn",
                        onTap: () =>
                            _openWhatsApp("I want to place a custom art order.")),
                    PremiumButton(
                        text: "Gallery",
                        icon: Icons.photo,
                        heroTag: "galleryBtn",
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(
                                builder: (_) => const GalleryPage()))),
                    PremiumButton(
                        text: "Upload",
                        icon: Icons.cloud_upload,
                        heroTag: "uploadBtn",
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    const LoginPage(forUpload: true)))),
                  ],
                ),
                const SizedBox(height: 30),
                Card(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  elevation: 8,
                  color: Colors.white.withOpacity(0.85),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "🎨 Yashu Arts is a place for creative art, paintings, and craftwork.\nYou can explore our gallery, place orders, and register for art classes!",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
              heroTag: "wa",
              onPressed: () => _openWhatsApp("Hello Yashu Arts!"),
              icon: Image.asset("assets/icons/whatsapp.png",
                  width: 22, height: 22),
              label: const Text("WhatsApp")),
          const SizedBox(height: 10),
          FloatingActionButton.extended(
              heroTag: "insta",
              onPressed: _openInstagram,
              icon: Image.asset("assets/icons/instagram.png",
                  width: 22, height: 22),
              label: const Text("Instagram")),
        ],
      ),
    );
  }
}

// ------------------ Login Page ------------------
class LoginPage extends StatefulWidget {
  final bool forUpload;
  const LoginPage({super.key, this.forUpload = false});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userController = TextEditingController();
  final passController = TextEditingController();

  @override
  void dispose() {
    userController.dispose();
    passController.dispose();
    super.dispose();
  }

  void _performLogin() {
    // ✅ Complete login logic placeholder
    final user = userController.text.trim();
    final pass = passController.text.trim();
    if (user == "artist" && pass == "1234") {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Login Success!")));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Invalid Credentials")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Artist Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          TextField(
              controller: userController,
              decoration: const InputDecoration(labelText: "Username")),
          TextField(
              controller: passController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true),
          const SizedBox(height: 20),
          PremiumButton(
            text: "Login",
            icon: Icons.login,
            heroTag: "loginBtn",
            onTap: _performLogin,
          ),
        ]),
      ),
    );
  }
}

// ------------------ About Page ------------------
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About Us")),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2E1051), Color(0xFF7B61FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "🎨 Welcome to Yashu Arts\n\nAt Yashu Arts, our mission is simple: to ignite the artist within you. We provide art education, gallery access and custom works.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

// ------------------ Register Page ------------------
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final phoneController = TextEditingController();
  String mode = "Online";

  Future<void> _registerOnWhatsApp(
      String name, String location, String mode, String phone) async {
    final msg =
        "New Registration:\nName: $name\nLocation: $location\nMode: $mode\nPhone: $phone";
    final url =
        Uri.parse("https://wa.me/919398029785?text=${Uri.encodeComponent(msg)}");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    locationController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register for Classes")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  labelText: "Name", filled: true, fillColor: Colors.white70)),
          const SizedBox(height: 12),
          TextField(
              controller: locationController,
              decoration: const InputDecoration(
                  labelText: "Location",
                  filled: true,
                  fillColor: Colors.white70)),
          const SizedBox(height: 12),
          DropdownButtonFormField(
            value: mode,
            items: ["Online", "Offline"]
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (val) => setState(() => mode = val!),
            decoration: const InputDecoration(
                labelText: "Mode", filled: true, fillColor: Colors.white70),
          ),
          const SizedBox(height: 12),
          TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                  labelText: "Phone", filled: true, fillColor: Colors.white70)),
          const SizedBox(height: 16),
          PremiumButton(
              text: "Submit",
              icon: Icons.send,
              heroTag: "registerSubmit",
              onTap: () => _registerOnWhatsApp(nameController.text,
                  locationController.text, mode, phoneController.text)),
        ]),
      ),
    );
  }
}

// ------------------ Gallery Page ------------------
class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});
  @override
  Widget build(BuildContext context) {
    final baseImages = [
      "assets/images/art_01.png",
      "assets/images/art_02.png",
      "assets/images/art_03.png",
      "assets/images/art_04.png",
      "assets/images/art_05.png",
      "assets/images/art_06.png",
      "assets/images/art_07.png",
      "assets/images/art_08.png",
      "assets/images/art_09.png",
      "assets/images/art_10.png",
    ];
    final total = baseImages.length + uploadedImages.length;

    return Scaffold(
      appBar: AppBar(title: const Text("Gallery")),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemCount: total,
        itemBuilder: (context, index) {
          if (index < baseImages.length) {
            return _card(Image.asset(baseImages[index], fit: BoxFit.cover));
          } else {
            final x = uploadedImages[index - baseImages.length];
            return _card(FutureBuilder<Uint8List>(
              future: x.readAsBytes(),
              builder: (context, snap) {
                if (!snap.hasData) return Container(color: Colors.grey[200]);
                return Image.memory(snap.data!, fit: BoxFit.cover);
              },
            ));
          }
        },
      ),
    );
  }

  Widget _card(Widget child) => Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ClipRRect(borderRadius: BorderRadius.circular(12), child: child),
      );
}

