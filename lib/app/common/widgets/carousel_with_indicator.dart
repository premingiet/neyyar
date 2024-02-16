import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neyyar/app/appAssets/app_colors.dart';
import 'package:neyyar/app/common/widgets/button_custom_shrink.dart';
import 'package:shimmer/shimmer.dart';

class CarouselWithIndicator extends StatefulWidget {
  final List<String> imageUrls; // List of image URLs
  final Function(String) onImageTap; // Callback function for image tap
  final bool isAutoScroll; // Determines if auto-scrolling is enabled
  final Duration duration; // Duration between auto-scrolls

  const CarouselWithIndicator({
    super.key,
    required this.imageUrls,
    required this.onImageTap,
    this.isAutoScroll = false,
    this.duration = const Duration(seconds: 3),
  });

  @override
  CarouselWithIndicatorState createState() => CarouselWithIndicatorState();
}

class CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  final PageController _controller = PageController(); // Adjust viewport fraction for spacing
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (widget.isAutoScroll) {
      _timer = Timer.periodic(widget.duration, (Timer timer) {
        if (_currentPage < widget.imageUrls.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }

        if (mounted) {
          _controller.animateToPage(
            _currentPage,
            duration: Duration(seconds: 1),
            curve: Curves.easeIn,
          );
        }
      });
    }

    _controller.addListener(() {
      int next = _controller.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: _controller,
          itemCount: widget.imageUrls.length,
          itemBuilder: (context, index) {
            return ButtonCustomShrink(
              shrinkScale: 0.98,
              onPressed: (){
                HapticFeedback.heavyImpact();
                widget.onImageTap(widget.imageUrls[index]);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5), // Adjust padding for spacing between items
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: widget.imageUrls[index],
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Center(
                      child: Shimmer.fromColors(
                        baseColor: AppColors.colorNeutral100,
                        highlightColor: AppColors.colorNeutral80,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: Shimmer.fromColors(
                        baseColor: AppColors.colorNeutral100,
                        highlightColor: AppColors.colorNeutral80,
                        child: Text(
                          'Neyyar !',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
          pageSnapping: true, // Enable page snapping effect
        ),
        Positioned(
          left: 20,
          bottom: 20,
          child: Row(
            children: List.generate(widget.imageUrls.length, (index) {
              return Container(
                width: _currentPage == index ? 16 : 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.white : Colors.grey,
                  border: Border.all(color: (_currentPage == index) ? AppColors.colorNeutralf : AppColors.colorNeutralf, width: 1),
                  borderRadius: _currentPage == index
                      ? BorderRadius.circular(8)
                      : BorderRadius.circular(4),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
