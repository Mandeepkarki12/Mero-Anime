import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mero_anime/Widgets/animeHead/head_anime_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HeadanimeImageSlider extends StatefulWidget {
  final List animeList;
  const HeadanimeImageSlider({
    super.key,
    required this.animeList,
  });

  @override
  State<HeadanimeImageSlider> createState() => _HeadanimeImageSliderState();
}

class _HeadanimeImageSliderState extends State<HeadanimeImageSlider> {
  int _currentPageIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CarouselSlider.builder(
              carouselController: _controller,
              itemCount: widget.animeList.length,
              itemBuilder: (context, index, realIndex) {
                return HeadAnimeImage(animeList: widget.animeList[index],);
              },
              options: CarouselOptions(
                enlargeFactor: 0.22,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
                aspectRatio: 16 / 9,
                viewportFraction: 0.88,
                autoPlay: true,
                enlargeCenterPage: true,
                initialPage: _currentPageIndex,
              )),
          const SizedBox(
            height: 20,
          ),
          AnimatedSmoothIndicator(
            activeIndex: _currentPageIndex,
            count: widget.animeList.length,
            effect: CustomizableEffect(
                dotDecoration: DotDecoration(
                  borderRadius: BorderRadius.circular(8),
                  width: 28,
                  height: 8,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                activeDotDecoration: DotDecoration(
                  borderRadius: BorderRadius.circular(8),
                  rotationAngle: 180,
                  color: Theme.of(context).colorScheme.secondary,
                  width: 28,
                  height: 8,
                )),
          )
        ],
      ),
    );
  }
}
