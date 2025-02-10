import 'package:flutter/material.dart';
import 'package:joke_flutter_app/core/extension/context_extension.dart';
import 'package:joke_flutter_app/core/theme/app_colors.dart';

class JokeAppbar extends StatelessWidget {
  const JokeAppbar({
    super.key,
    required this.category,
    required this.onTap,
  });

  final ValueNotifier<String> category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: 'Spagetti', style: context.titleMedium),
                TextSpan(
                  text: 'Code',
                  style: context.titleMedium?.copyWith(
                    color: AppColors.instance.primary,
                  ),
                ),
              ],
            ),
          ),
          ValueListenableBuilder(
            valueListenable: category,
            builder: (context, value, _) {
              return InkWell(
                onTap: onTap,
                child: Row(
                  children: [
                    Text(value, style: context.bodyLarge?.copyWith(color: AppColors.instance.primary)),
                    Icon(
                      Icons.arrow_drop_down,
                      color: AppColors.instance.primary,
                      size: 24,
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
