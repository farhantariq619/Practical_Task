import 'package:flutter/material.dart';
import 'package:practical_task/view/common_widgets/image_widget.dart';


class SearchResultTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback onTap;
  const SearchResultTile({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ImageWidget(
        imageUrl: imageUrl,
      ),
      title: Text(title),
      onTap: onTap,
    );
    ;
  }
}
