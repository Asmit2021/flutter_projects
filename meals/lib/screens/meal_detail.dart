import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favorites_provider.dart';

class MealDetail extends ConsumerWidget {
  const MealDetail({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleMealFavoriteStatus(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(wasAdded
                        ? 'Meal added as a favorite'
                        : 'Meal removed from favorite'),
                  ),
                );
              },
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    turns: Tween<double>(begin: 0.8, end: 1).animate(animation),
                    child: child,
                    );
                },
                child: Icon(isFavorite ? Icons.star : Icons.star_border,  key: ValueKey(isFavorite),),
              ))
        ],
      ),
      backgroundColor: Colors.black,
      body: SizedBox(
        height: double.infinity,
        child: Card(
          color: Colors.white,
          margin: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Hero(
                    tag: meal.id,
                    child: FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                      image: NetworkImage(meal.imageUrl),
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Ingridients:- ',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 6,
                ),
                for (final ingridient in meal.ingredients)
                  Text(
                    '- $ingridient',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Procedure:- ',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 6,
                ),
                for (final step in meal.steps)
                  Text(
                    '- $step',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                const SizedBox(
                  height: 6,
                ),
                Text('Info:-',
                    style: Theme.of(context).textTheme.headlineMedium!),
                Text(
                  '-> Gluten is ${meal.isGlutenFree ? 'absent.' : 'present.'}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 1,
                ),
                Text(
                  meal.isVegan ? '-> Vegan.' : '-> Non-Vegan.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 1,
                ),
                Text(
                  meal.isVegetarian ? '-> Vegetarian.' : '-> Non-Vegetarian.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 1,
                ),
                Text(
                  '-> Lactose is ${meal.isLactoseFree ? 'absent.' : 'present.'}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
