import 'package:flutter/material.dart';
import 'package:kiki/consts/const_widgets.dart';
import 'package:kiki/widgets/user_appbar.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: kikuGradient(),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyAppBar(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'About Kiki',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildSection('Welcome to Kiki',
                          'Your premier app dedicated to celebrating and promoting Ghanaian traditional symbols. At Kiki, we believe in preserving and sharing the rich cultural heritage of Ghana through the power of technology.'),
                      _buildSection('Our Mission',
                          'Our mission is to bring Ghanaian traditional symbols to the forefront, making them accessible to people all over the world. We aim to educate, inspire, and connect users with the deep cultural meanings behind these symbols, ensuring they remain a vibrant part of our global heritage.'),
                      _buildSection('Our Story',
                          "Kiki was founded by a passionate team of developers, cultural enthusiasts, and designers who recognized the importance of preserving Ghana's unique cultural symbols. Our journey began in 2023 with the vision to create a platform that not only showcases these symbols but also educates users about their history, meanings, and significance."),
                      _buildSection('Our Values',
                          '• Cultural Preservation\n• Education\n• Innovation\n• Community'),
                      _buildSection('Contact Us',
                          'Have questions or feedback? We would love to hear from you!'),
                      const SizedBox(height: 8),
                      _buildContactButton(
                          'Call Us', Icons.phone, 'tel:+233279881644'),
                      const SizedBox(height: 8),
                      _buildContactButton('Email Us', Icons.email,
                          'mailto:salomey99.pd@gmail.com'),
                      const SizedBox(height: 16),
                      const Text(
                        "Thank you for being a part of the Kiki community. Together, let's celebrate and preserve the rich cultural heritage of Ghana.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.amber,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildContactButton(String text, IconData icon, String url) {
    return ElevatedButton.icon(
      onPressed: () {
        _launchURL(url);
      },
      icon: Icon(icon),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.amber,
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(url as Uri)) {
      await launchUrl(url as Uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
