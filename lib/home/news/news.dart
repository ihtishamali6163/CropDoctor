import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final List<Map<String, String>> allArticles = [
    {
      'title': 'Your Hydrangeas Will Come Back Next Year as Long as You Live in One of These Areas',
      'thumbnail': 'assets/article1.jpg',
      'url': 'https://www.thespruce.com/are-hydrangeas-perennials-11712890',
    },
    {
      'title': 'Can You Use Garden Soil for Indoor Plants? We Asked Gardeners and They All Agreed',
      'thumbnail': 'assets/article2.jpg',
      'url': 'https://www.thespruce.com/can-you-use-garden-soil-for-indoor-plants-11711078',
    },
    {
      'title': 'What Is A Pollinator Garden? Grow Gorgeous Blooms While Benefiting Your Local Ecosystem',
      'thumbnail': 'assets/article3.jpg',
      'url': 'https://www.gardeningknowhow.com/garden-how-to/beneficial/what-is-a-pollinator-garden',
    },
    {
      'title': 'How to Make Your Garden Thrive (Not Just Survive) This Season, According to Experts',
      'thumbnail': 'assets/article4.jpg',
      'url': 'https://www.realsimple.com/how-to-make-your-garden-thrive-11721743',
    },
    {
      'title': 'Fine Gardening - Expert garden plant advice, tips, and ideas',
      'thumbnail': 'assets/article5.jpg',
      'url': 'https://www.finegardening.com/',
    },
    {
      'title': 'Gardening Articles - Growing A Greener World®',
      'thumbnail': 'assets/article6.jpg',
      'url': 'https://www.growingagreenerworld.com/gardening-tips/',
    },
    {
      'title': 'Articles tagged as Gardening | Smithsonian Magazine',
      'thumbnail': 'assets/article7.jpg',
      'url': 'https://www.smithsonianmag.com/tag/gardening/',
    },
    {
      'title': 'Garden Photo of the Day - Garden Inspiration From Across the World',
      'thumbnail': 'assets/article8.jpg',
      'url': 'https://www.finegardening.com/series/garden-photo-of-the-day',
    },
    {
      'title': 'How to Grow and Care for Marigolds',
      'thumbnail': 'assets/article9.jpg',
      'url': 'https://www.thespruce.com/grow-and-care-for-marigolds-1403470',
    },
  ];


  List<Map<String, String>> filteredArticles = [];

  @override
  void initState() {
    super.initState();
    filteredArticles = allArticles;
  }

  void _filterArticles(String query) {
    final results = allArticles
        .where((article) =>
        article['title']!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      filteredArticles = results;
    });
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint('Could not launch $url: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFBFDFF),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF81C784), // Light Green
                      Color(0xFF4FC3F7), // Light Blue
                    ],
                  ),
                ),
                child: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                    child: Text(
                      'News',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50), // Space for search bar
              Expanded(
                child: ListView.builder(
                  itemCount: filteredArticles.length,
                  itemBuilder: (context, index) {
                    final article = filteredArticles[index];
                    return InkWell(
                      onTap: () => _launchURL(article['url']!),
                      child: Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  article['thumbnail']!,
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  article['title']!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const Icon(Icons.arrow_forward_ios,
                                  size: 18, color: Colors.black45),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            top: 125,
            left: 16,
            right: 16,
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(30),
              child: TextField(
                onChanged: _filterArticles,
                decoration: InputDecoration(
                  hintText: "Search news...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
