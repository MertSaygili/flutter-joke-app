import 'package:flutter/material.dart';
import 'package:joke_flutter_app/core/extension/context_extension.dart';
import 'package:joke_flutter_app/core/gen/assets.gen.dart';

class BackgroundScaffold extends StatelessWidget {
  const BackgroundScaffold({
    super.key,
    required this.body,
    this.floatingActionButton,
  });

  final Widget body;
  final FloatingActionButton? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton,
      body: Container(
        height: context.height,
        width: context.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.backgroundImage.path),
            fit: BoxFit.fill,
          ),
        ),
        child: body,
      ),
    );
  }
}
