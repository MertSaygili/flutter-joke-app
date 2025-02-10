import 'dart:ui';

import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joke_flutter_app/core/extension/context_extension.dart';
import 'package:joke_flutter_app/core/theme/app_colors.dart';
import 'package:joke_flutter_app/feature/joke/view/joke_screen_mixin.dart';
import 'package:joke_flutter_app/feature/joke/view/widgets/background_scaffold.dart';
import 'package:joke_flutter_app/feature/joke/view/widgets/joke_appbar.dart';
import 'package:joke_flutter_app/feature/joke/view_model/joke_notifier.dart';

class JokeScreen extends ConsumerStatefulWidget {
  const JokeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _JokeScreenState();
}

class _JokeScreenState extends ConsumerState<JokeScreen> with JokeScreenMixin {
  @override
  Widget build(BuildContext context) {
    final joke = ref.watch(jokeNotifierProvider).joke;
    final bool isTwoPartJoke = joke?.type == 'twopart';

    return BackgroundScaffold(
      body: SafeArea(
        child: Column(
          children: [
            JokeAppbar(category: category, onTap: showChooseCategorySheet),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.instance.whiteColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (isTwoPartJoke) ...[
                            Text(
                              joke?.setup ?? '',
                              style: context.titleMedium?.copyWith(fontWeight: FontWeight.w200),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 32),
                            DelayedWidget(
                              animationDuration: Duration(milliseconds: 500),
                              delayDuration: Duration(milliseconds: 500),
                              child: Text(
                                joke?.delivery ?? '',
                                style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ] else ...[
                            Text(
                              joke?.joke ?? '',
                              style: context.titleMedium?.copyWith(fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            ),
                          ],
                          SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () => createJoke(),
                                child: Icon(Icons.refresh, color: AppColors.instance.primary, size: 24),
                              ),
                              InkWell(
                                onTap: () => copyJoke(),
                                child: Icon(Icons.copy_outlined, color: AppColors.instance.primary, size: 24),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
