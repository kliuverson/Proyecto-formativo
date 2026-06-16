import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ferremateriales/translations/app_localizations.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  late final PageController _controller;

  int currentPage = 0;

  Timer? timer;

  @override
  void initState() {
    super.initState();

    _controller = PageController(
      viewportFraction: .93,
    );

    timer = Timer.periodic(
      const Duration(seconds: 4),
      (_) {

        currentPage++;

        final length = 3;

        if (currentPage >= length) {
          currentPage = 0;
        }

        if (_controller.hasClients) {
          _controller.animateToPage(
            currentPage,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        }
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;

    final banners = [

      {
        "image":
            "https://images.unsplash.com/photo-1504307651254-35680f356dfd",
        "title": tr.banner1Title,
        "subtitle": tr.banner1Subtitle
      },

      {
        "image":
            "https://images.unsplash.com/photo-1581578731548-c64695cc6952",
        "title": tr.banner2Title,
        "subtitle": tr.banner2Subtitle
      },

      {
        "image":
            "https://images.unsplash.com/photo-1519985176271-adb1088fa94c",
        "title": tr.banner3Title,
        "subtitle": tr.banner3Subtitle
      },
    ];

    return Column(
      children: [

        SizedBox(
          height: 165,

          child: PageView.builder(

            controller: _controller,

            itemCount: banners.length,

            onPageChanged: (index) {

              setState(() {
                currentPage = index;
              });

            },

            itemBuilder: (context, index) {

              final banner = banners[index];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),

                  child: Stack(

                    fit: StackFit.expand,

                    children: [

                      Image.network(
                        banner["image"]!,
                        fit: BoxFit.cover,
                      ),

                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(.80),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),

                      Positioned(
                        left: 18,
                        bottom: 18,

                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,

                          children: [

                            Container(
                              padding:
                                  const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF6A14),
                                borderRadius:
                                    BorderRadius.circular(6),
                              ),
                              child: Text(
                                tr.bannerOffer,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              banner["title"]!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Text(
                              banner["subtitle"]!,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 15,
                              ),
                            ),

                          ],
                        ),
                      )

                    ],
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 12),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: List.generate(

            banners.length,

            (index) => AnimatedContainer(

              duration:
                  const Duration(milliseconds: 300),

              margin:
                  const EdgeInsets.symmetric(horizontal: 3),

              width: currentPage == index ? 18 : 6,

              height: 6,

              decoration: BoxDecoration(

                color: currentPage == index
                    ? const Color(0xFFFF6A14)
                    : Colors.grey.shade300,

                borderRadius:
                    BorderRadius.circular(20),

              ),
            ),
          ),
        ),

      ],
    );
  }
}

