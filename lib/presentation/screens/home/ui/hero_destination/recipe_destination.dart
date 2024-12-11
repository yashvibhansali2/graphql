import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yashvi_graphql/domain/models/destination_model.dart';
import 'package:yashvi_graphql/domain/repository/home/home_repo.dart';
import 'package:yashvi_graphql/presentation/screens/home/ui/hero_destination/receipe_list_item.dart';
import 'package:yashvi_graphql/presentation/screens/home/ui/hero_destination/recipe_list_wrapper.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({Key? key}) : super(key: key);

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  DestinationModel? destinationModel;

  final ValueNotifier<ScrollDirection> scrollDirectionNotifier =
      ValueNotifier<ScrollDirection>(ScrollDirection.forward);

  Future<void> _loadDestinations() async {
    destinationModel = await DestinationsRepo.getDestinationsApi();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadDestinations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destinations'),
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (UserScrollNotification notification) {
          if (notification.direction == ScrollDirection.forward ||
              notification.direction == ScrollDirection.reverse) {
            scrollDirectionNotifier.value = notification.direction;
          }
          return true;
        },
        child: GridView.builder(
          padding: EdgeInsets.only(
            left: 5,
            right: 5,
            top: 10,
            bottom: MediaQuery.of(context).padding.bottom + 20,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 1,
          ),
          itemCount: destinationModel?.destinationList.length,
          cacheExtent: 0,
          itemBuilder: (context, i) {
            final singleDestination = destinationModel
                ?.destinationList[i]; // Get a single destination
            if (singleDestination == null) return const SizedBox.shrink();
            return ValueListenableBuilder(
              valueListenable: scrollDirectionNotifier,
              child: RecipeListItem(singleDestination),
              builder: (context, ScrollDirection scrollDirection, child) {
                return RecipeListItemWrapper(
                  scrollDirection: scrollDirection,
                  child: child!,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
