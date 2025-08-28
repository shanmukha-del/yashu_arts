import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _artistTapCount = 0;

  // Sample arts list
  List<Map<String, String>> arts = [
    {
      "image": "assets/images/art1.png",
      "title": "Sunset",
      "price": "\$50",
      "description": "Beautiful sunset painting"
    },
    {
      "image": "assets/images/art2.png",
      "title": "Mountains",
      "price": "\$70",
      "description": "Majestic mountains view"
    },
    // Add more arts here
  ];

  void _openWhatsapp(String message) async {
    final url = Uri.parse("https://wa.me/?text=$message");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      debugPrint("Could not open WhatsApp");
    }
  }

  void _showArtPopup(Map<String, String> art) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(art['title']!),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(art['image']!),
            Text("Price: ${art['price']}"),
            Text(art['description']!),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              _openWhatsapp("Hi, I want to order this art: ${art['title']}");
            },
            child: const Text("Order Now"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  void _checkArtistHiddenFeature() {
    _artistTapCount++;
    if (_artistTapCount >= 5) {
      _artistTapCount = 0;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ArtistUploadScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: _checkArtistHiddenFeature,
          child: Image.asset(
            "assets/icons/app_icon.png",
            height: 40,
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset("assets/icons/whatsapp.png"),
            onPressed: () => _openWhatsapp("Hi!"),
          ),
          IconButton(
            icon: Image.asset("assets/icons/instagram.png"),
            onPressed: () {
              launchUrl(Uri.parse("https://instagram.com/"));
            },
          ),
          IconButton(
            icon: Image.asset("assets/icons/call.png"),
            onPressed: () {
              launchUrl(Uri.parse("tel:+1234567890"));
            },
          ),
          IconButton(
            icon: Image.asset("assets/icons/email.png"),
            onPressed: () {
              launchUrl(Uri.parse("mailto:example@email.com"));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 30,
            color: Colors.grey[300],
            child: const Center(
              child: Text(
                "If you are interested, contact us on WhatsApp",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.8),
              itemCount: arts.length,
              itemBuilder: (context, index) {
                final art = arts[index];
                return GestureDetector(
                  onTap: () => _showArtPopup(art),
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(
                          art['image']!,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          art['title']!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(art['price']!),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Artist Upload Screen
class ArtistUploadScreen extends StatelessWidget {
  const ArtistUploadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Artist Upload")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Title"),
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Price"),
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Description"),
            ),
            ElevatedButton(
              onPressed: () {
                // Image picker logic here
              },
              child: const Text("Add Image"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Upload logic
                  },
                  child: const Text("Upload"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Delete logic
                  },
                  child: const Text("Delete"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
