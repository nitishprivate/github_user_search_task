import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final void Function() onTap;
  final void Function()? onRecentSearchTap;
  final bool fromSearch;
  const UserCard(this.imageUrl, this.name, this.onTap, {super.key, this.fromSearch = false, this.onRecentSearchTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.network(
          imageUrl,
          height: 45,
          loadingBuilder: (context, child, loadingProgress) {
            return loadingProgress != null ? const Icon(Icons.person) : child;
          },
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.person);
          },
        ),
      ),
      title: Text(name),
      trailing: fromSearch ? IconButton(onPressed: onRecentSearchTap, icon: const Icon(Icons.transit_enterexit_outlined)) : null,
    );
  }
}
