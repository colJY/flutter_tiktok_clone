import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/sizes.dart';

class PostVideoButton extends StatelessWidget {
  const PostVideoButton({
    super.key,
    required this.longTap,
    required this.inverted,
  });

  final bool longTap;
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: 20,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 35,
            width: 25,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            decoration: BoxDecoration(
                color: longTap ? Colors.red : Colors.blue,
                borderRadius: BorderRadius.circular(
                  Sizes.size8,
                )),
          ),
        ),
        Positioned(
          left: 20,
          child: Container(
            height: 35,
            width: 25,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            decoration: BoxDecoration(
                color: longTap ? Colors.blue : Colors.red,
                borderRadius: BorderRadius.circular(
                  Sizes.size8,
                )),
          ),
        ),
        Container(
          height: 35,
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size12,
          ),
          decoration: BoxDecoration(
            color: !inverted ? Colors.white : Colors.black,
            borderRadius: BorderRadius.circular(
              Sizes.size11,
            ),
          ),
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.plus,
              color: !inverted ? Colors.black : Colors.white,
              size: Sizes.size16 + Sizes.size2,
            ),
          ),
        )
      ],
    );
  }
}
