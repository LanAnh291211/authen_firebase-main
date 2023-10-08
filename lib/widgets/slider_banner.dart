import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

class SliderBanner extends StatefulWidget {
  const SliderBanner({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SliderBannerState createState() => _SliderBannerState();
}

class _SliderBannerState extends State<SliderBanner> {
  List image = [
    Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/partner_bg.jfif"),
          fit: BoxFit.fitWidth,
        ),
      ),
    ),
    Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/partner.jfif"),
          fit: BoxFit.fitWidth,
        ),
      ),
    ),
    Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/partner.jpg"),
          fit: BoxFit.fitWidth,
        ),
      ),
    )
  ];

  final SlideTransform _slideTransform = const CubeTransform();
  final SlideIndicator _slideIndicator = CircularSlideIndicator(
    padding: const EdgeInsets.only(bottom: 8),
    indicatorBackgroundColor: Colors.white,
    indicatorBorderWidth: 0.3,
  );
  late CarouselSliderController _sliderController;

  @override
  void initState() {
    super.initState();
    _sliderController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 170,
          child: CarouselSlider.builder(
            initialPage: 0,
            enableAutoSlider: true,
            unlimitedMode: true,
            controller: _sliderController,
            autoSliderTransitionTime: const Duration(seconds: 1),
            itemCount: image.length,
            slideBuilder: (index) {
              return Container(
                  height: 160,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/banner_bg.jfif"),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  child: image[index]);
            },
            slideTransform: _slideTransform,
            slideIndicator: _slideIndicator,
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
