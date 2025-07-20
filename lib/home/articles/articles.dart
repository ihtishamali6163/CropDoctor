import 'dart:math';
import 'package:flutter/material.dart';

class PlantTipsScreen extends StatefulWidget {
  const PlantTipsScreen({Key? key}) : super(key: key);

  @override
  State<PlantTipsScreen> createState() => _PlantTipsScreenState();
}

class _PlantTipsScreenState extends State<PlantTipsScreen> {
  final List<String> tips = [
    "Water your plants early in the morning when temperatures are cooler to reduce evaporation and help plants absorb moisture effectively.",
    "Use compost and organic matter regularly to keep your garden soil healthy and rich in nutrients, promoting strong plant growth.",
    "Inspect leaves and stems weekly for pests or diseases so you can take action before they spread and harm your entire garden.",
    "Mulching around plants not only retains moisture but also keeps weeds at bay and regulates soil temperature.",
    "Prune dead, diseased, or overcrowded branches to promote better airflow and reduce the risk of fungal infections in your garden.",
    "Rotate vegetable crops each season to prevent the buildup of soil-borne diseases and maintain soil fertility.",
    "Collect rainwater in barrels to water your garden naturally, saving water and providing plants with chemical-free hydration.",
    "Plant marigolds around vegetable beds to naturally deter pests like nematodes and aphids without the use of harsh chemicals.",
    "Banana peels can be buried near plant roots to release potassium and phosphorus slowly, aiding flowering and fruiting plants.",
    "Always clean and disinfect your gardening tools after use to prevent the spread of diseases between plants.",
    "Avoid overhead watering in the evening as wet leaves overnight can encourage fungal growth and leaf spots.",
    "Feed flowering plants with a balanced fertilizer during their blooming season to ensure vibrant and long-lasting flowers.",
    "Group plants with similar water and sunlight needs together to make care easier and more efficient.",
    "Deadhead spent blooms on flowering plants to encourage new blossoms and keep your garden looking fresh.",
    "Aerate compacted soil annually to improve root penetration and water absorption, especially in heavily trafficked areas.",
    "Use organic mulch like straw or bark chips to gradually enrich the soil as it decomposes over time.",
    "Lavender and rosemary planted near pathways not only smell great but also deter certain insects naturally.",
    "When planting in containers, ensure they have proper drainage holes to prevent root rot and soggy soil.",
    "Mist indoor tropical plants occasionally to mimic their natural humid environment and promote healthier growth.",
    "Stake or provide support for tall plants early in the season before they become top-heavy and prone to damage.",
    "Check soil pH before planting acid-loving plants like azaleas and blueberries to ensure they thrive.",
    "Harvest herbs in the early morning for the most potent oils and freshest flavors in your kitchen.",
    "Avoid excessive fertilizer on flowering plants as too much nitrogen can result in lush foliage but few flowers.",
    "Encourage beneficial insects like ladybugs and bees by planting native flowering plants that attract pollinators.",
    "Planting mint in containers prevents it from spreading uncontrollably and taking over your garden beds.",
    "Use crushed eggshells around young plants to deter slugs and snails without using chemical pellets.",
    "Repot houseplants every couple of years to refresh soil, provide more space, and prevent root binding.",
    "Apply neem oil spray as a natural pesticide that’s safe for beneficial insects but effective against common pests.",
    "Fallen leaves can be shredded and used as mulch or added to compost for a free source of organic matter.",
    "Don’t plant vegetables or flowers too closely together; overcrowding reduces airflow and invites disease.",
    "Grow basil near tomatoes to improve tomato flavor and repel pests like whiteflies and aphids.",
    "Use vinegar or boiling water to kill weeds between paving stones rather than chemical herbicides.",
    "Tomatoes need consistent watering to prevent problems like blossom end rot, so try to water evenly.",
    "Overwatering is one of the most common causes of houseplant death; always check soil moisture before watering.",
    "Snip off yellowing leaves promptly to redirect plant energy into healthy growth and prevent disease spread.",
    "Fungus gnats in houseplants can often be controlled by letting the soil surface dry out between waterings.",
    "Start seeds indoors early to give plants a head start and extend your growing season.",
    "Create a bee-friendly garden by avoiding pesticides during blooming and planting a mix of native flowers.",
    "Mulch with cocoa hulls or bark chips in flower beds to create a neat appearance while helping soil retain moisture.",
    "Place taller plants at the back of beds and shorter ones at the front for layered visual interest and better sun exposure.",
    "When dividing perennials, do so in cool weather and water them well to help them re-establish faster.",
    "Place indoor plants on pebble trays filled with water to increase humidity without waterlogging roots.",
    "Garlic spray made from crushed cloves and water can act as a natural insect repellent on garden plants.",
    "Sunflowers can provide shade for smaller crops while attracting pollinators to the garden.",
    "Thin seedlings promptly after germination to give remaining plants enough space and nutrients to develop.",
    "Plant native grasses and wildflowers to create a low-maintenance, drought-tolerant garden.",
    "Clean bird feeders regularly to prevent spreading diseases that could affect visiting wildlife.",
    "Plant cover crops during off-season months to enrich soil and prevent erosion naturally.",
    "Use a moisture meter or simply stick your finger into the soil to gauge if watering is really needed.",
  ];

  late String randomTip;

  @override
  void initState() {
    super.initState();
    _generateRandomTip();
  }

  void _generateRandomTip() {
    setState(() {
      randomTip = tips[Random().nextInt(tips.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const Icon(
              //   Icons.lightbulb_rounded,
              //   size: 80,
              //   color: Color(0xFF4FC3F7),
              // ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF81C784), // Light Green
                      Color(0xFF4FC3F7), // Light Blue
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.lightbulb_rounded,
                      size: 80,
                      color: Colors.yellowAccent,
                    ),
                    SizedBox(height: 15,),
                    Text(
                      randomTip,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: _generateRandomTip,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF81C784),
                  foregroundColor: Colors.white,
                  elevation: 4,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                icon: const Icon(Icons.refresh),
                label: const Text(
                  "Show Another Tip",
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
