import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

class BuildHomeLogo extends StatelessWidget {
  const BuildHomeLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * .1,
        child: Assets.images.chat.image(package: 'gen'));
  }
}
