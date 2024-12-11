import 'package:flutter/material.dart';
import 'package:yashvi_graphql/domain/models/destination_model.dart';
import 'package:yashvi_graphql/presentation/screens/home/ui/button.dart';
import 'package:yashvi_graphql/presentation/screens/home/ui/hero_destination/recipe_image.dart';
import 'package:yashvi_graphql/presentation/screens/home/ui/hero_destination/recipe_list_item_gesture_detector.dart';
import 'package:yashvi_graphql/presentation/screens/home/ui/hero_destination/recipe_list_item_image_wrapper.dart';

class RecipeListItem extends StatefulWidget {
  const RecipeListItem(
    this.destinationModel, {
    Key? key,
  }) : super(key: key);

  final SingleDestinationModel destinationModel;

  @override
  State<RecipeListItem> createState() => _RecipeListItemState();
}

class _RecipeListItemState extends State<RecipeListItem> {
  double recipeImageRotationAngle = 0;

  @override
  Widget build(BuildContext context) {
    // You no longer need a fixed size for the image. The container will handle it.
    double imageSize = 50; // Size of the image (fixed to 50)

    return RecipeListItemGestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder:
                (BuildContext context, Animation<double> animation, _) {
              return const MyHomePage(
                  // widget.destinationModel,
                  // initialImageRotationAngle: recipeImageRotationAngle,
                  );
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation, _, Widget child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        )
            .then((response) {
          if (response != null && response is double && mounted) {
            setState(() {
              recipeImageRotationAngle = response;
            });
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Stack(
          children: [
            Positioned.fill(
              child: Hero(
                tag: '__recipe_${widget.destinationModel.url}_image_bg__',
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.pink, // background color
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: [
                      // BoxShadow(
                      //   color: AppColors.orangeDark.withOpacity(
                      //     AppColors.getBrightness(widget.recipe.bgColor) ==
                      //             Brightness.dark
                      //         ? 0.5
                      //         : 0.2,
                      //   ),
                      //   blurRadius: 10,
                      //   offset: const Offset(0, 10),
                      // ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.network(
                      "https://images.unsplash.com/photo-1564507592333-c60657eea523?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHRhaiUyMG1haGFsfGVufDB8fDB8fHww",
                      fit: BoxFit.cover, // Ensure image is properly scaled
                      width: double.infinity, // Take full width of parent
                      height: double.infinity, // Take full height of parent
                    ),
                  ),
                ),
              ),
            ),

            // Recipe Image (adjusted position inside wrapper)
            Positioned(
              bottom: 50, // Adjust the position of the image
              right: 20, // Adjust the position of the image
              child: RecipeListItemImageWrapper(
                child: RecipeImage(widget.destinationModel),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
