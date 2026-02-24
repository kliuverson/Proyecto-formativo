import 'package:flutter/material.dart';

class TCircularImage extends StatelessWidget {
  final String imageUrl;
  final double size;
  final String? assetPlaceholder;
  final Color borderColor;
  final double borderWidth;

  const TCircularImage({
    super.key,
    required this.imageUrl,
    this.size = 40,
    this.assetPlaceholder,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
  });

  bool get _isNetworkImage =>
      imageUrl.startsWith('http') || imageUrl.startsWith('https');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(borderWidth),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: ClipOval(
        child: _isNetworkImage
            ? Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _placeholder(),
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return _loading();
                },
              )
            : Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
      ),
    );
  }

  Widget _placeholder() {
    if (assetPlaceholder != null) {
      return Image.asset(assetPlaceholder!, fit: BoxFit.cover);
    }
    return Container(
      color: Colors.grey.shade200,
      child: Icon(Icons.person, size: size * 0.5, color: Colors.grey),
    );
  }

  Widget _loading() {
    return Container(
      color: Colors.grey.shade100,
      child: Center(
        child: SizedBox(
          width: size * 0.4,
          height: size * 0.4,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }
}