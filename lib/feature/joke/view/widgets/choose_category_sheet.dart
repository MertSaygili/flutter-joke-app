import 'package:flutter/material.dart';
import 'package:joke_flutter_app/core/extension/context_extension.dart';
import 'package:joke_flutter_app/core/model/joke_categories.dart';
import 'package:joke_flutter_app/core/theme/app_colors.dart';

class ChooseCategorySheet extends StatefulWidget {
  const ChooseCategorySheet({super.key, required this.categories, this.selectedCategory});

  final JokeCategories? categories;
  final String? selectedCategory;

  @override
  State<ChooseCategorySheet> createState() => _ChooseCategorySheetState();
}

class _ChooseCategorySheetState extends State<ChooseCategorySheet> with SingleTickerProviderStateMixin {
  int? tappedIndex;
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap(int index) async {
    setState(() => tappedIndex = index);

    await _controller.reverse();

    if (mounted) {
      Navigator.pop<String>(context, widget.categories?.categories?[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.instance.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      width: context.width,
      child: SlideTransition(
        position: _slideAnimation,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: widget.categories?.categories?.length ?? 0,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => Divider(
                color: AppColors.instance.primary.withValues(alpha: 0.4),
                height: 1,
              ),
              itemBuilder: (context, index) {
                final bool isSelected = widget.categories?.categories?[index] == widget.selectedCategory;
                final bool isTapped = tappedIndex == index;

                return InkWell(
                  onTap: () => _handleTap(index),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    transform: Matrix4.identity()..scale(isTapped ? 0.95 : 1.0),
                    color: isSelected ? AppColors.instance.primary.withValues(alpha: 0.4) : AppColors.instance.background,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        widget.categories?.categories?[index] ?? '',
                        style: context.bodyMedium?.copyWith(color: AppColors.instance.whiteColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
