import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:joke_flutter_app/core/gen/assets.gen.dart';
import 'package:joke_flutter_app/core/theme/app_colors.dart';
import 'package:joke_flutter_app/feature/joke/view/joke_screen.dart';
import 'package:joke_flutter_app/feature/joke/view/widgets/choose_category_sheet.dart';
import 'package:joke_flutter_app/feature/joke/view_model/joke_notifier.dart';
import 'package:just_audio/just_audio.dart';

mixin JokeScreenMixin on ConsumerState<JokeScreen> {
  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<String> category = ValueNotifier('Any');
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      player.setAudioSource(AudioSource.asset(Assets.audio.jokeAudio));
      await getCategories();
      await createJoke();
    });
  }

  Future<void> showChooseCategorySheet() async {
    final categories = ref.read(jokeNotifierProvider).categories;

    final response = await showModalBottomSheet<String?>(
      backgroundColor: AppColors.instance.background,
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => ChooseCategorySheet(
        categories: categories,
        selectedCategory: category.value,
      ),
    );
    if (response != null) {
      if (category.value != response) {
        category.value = response;
        await createJoke();
      }
    }
  }

  Future<void> getCategories() async {
    await ref.read(jokeNotifierProvider.notifier).getCategories();
  }

  Future<void> createJoke() async {
    isLoading.value = true;
    await ref.read(jokeNotifierProvider.notifier).createJoke(category.value);
    await playSong();
    isLoading.value = false;
  }

  Future<void> playSong() async {
    await player.play();
  }

  void copyJoke() {
    Clipboard.setData(ClipboardData(text: ref.read(jokeNotifierProvider).joke?.delivery ?? ''));
    Fluttertoast.showToast(
      msg: 'Joke copied to clipboard',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.instance.primary,
      textColor: AppColors.instance.whiteColor,
      fontSize: 16.0,
    );
  }
}
