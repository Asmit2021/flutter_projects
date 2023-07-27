import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';

class GroceryItemDetail extends StatelessWidget {
  const GroceryItemDetail({super.key, required this.groceryItem});
  final GroceryItem groceryItem;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero,
      ),
      backgroundColor: const Color.fromARGB(255, 50, 58, 60),//Theme.of(context).colorScheme.background,
      onPressed: (){},
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(Icons.square,
            color: groceryItem.category.color,
            ),
            const SizedBox(width: 15,),
            Text(
            groceryItem.name,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 25
            ),
            ),
            const Spacer(),
            Text(
              groceryItem.quantity.toString(),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 25
            ),
            )
          ],
        ),
      ),
    );
  }
}
