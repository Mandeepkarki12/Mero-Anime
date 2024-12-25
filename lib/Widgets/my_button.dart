import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final bool isLoading;
  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isLoading = false,
  });
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
              borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.all(25),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: isLoading
                ?  CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.surface,
                    strokeWidth: 4.0,
                  )
                : Text(
                    text,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
