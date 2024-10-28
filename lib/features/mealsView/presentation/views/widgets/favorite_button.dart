import 'package:flutter/material.dart';

class FavoriteIcon extends StatefulWidget {
  final bool isFavorite;
  final ValueChanged<bool> onFavoriteToggle;

  const FavoriteIcon({
    super.key,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    if (widget.isFavorite) _controller.forward();
  }

  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      widget.onFavoriteToggle(isFavorite);
    });
  }

  @override
  void didUpdateWidget(covariant FavoriteIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isFavorite) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toggleFavorite();
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
          color: widget.isFavorite ? Colors.red : Colors.white,
          size: 30.0,
        ),
      ),
    );
  }
}
