import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';

class MAnimationLoaderWidget extends StatelessWidget {
  const MAnimationLoaderWidget({
    super.key,
    required this.text,
    this.animation,
    this.showAction=false,
    this.actionText,
    this.onActionPressed
  });

  final String text;
  final String? animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 24,),
          Text(text,
          style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
            showAction?
                SizedBox(
            width: 250,
            child: OutlinedButton(
                onPressed: onActionPressed,
                style: OutlinedButton.styleFrom(backgroundColor: MColors.dark),
                child: Text(
              actionText!,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(color: MColors.light),
            )
            ),
          )
                :const SizedBox(),
        ],
      ),
    );
  }
}
