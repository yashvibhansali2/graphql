import 'package:flutter/material.dart';
import 'package:yashvi_graphql/domain/models/destination_model.dart';

import 'package:yashvi_graphql/presentation/screens/home/ui/hero_destination/recipe_model.dart';

class RecipeImage extends StatelessWidget {
  const RecipeImage(
    this.destinationModel, {
    Key? key,
    // this.imageRotationAngle = 0,
    // this.imageSize,
    // this.alignment = Alignment.center,
    // this.hasShadow = true,
    // this.shadowOffset,
  }) : super(key: key);

  final SingleDestinationModel destinationModel;
  // final Recipe recipe;
  // final double imageRotationAngle;
  // final double? imageSize;
  // final AlignmentGeometry alignment;
  // final bool hasShadow;
  // final Offset? shadowOffset;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Hero(
        tag: '__recipe_${destinationModel.destination}_image__',
        child: SizedBox(
          // color: Colors.amber,
          // width: MediaQuery.of(context).size.width *
          //     .2, // Default to 150 if imageSize is null
          height: 30, // Ensure consistent size for the container
          child: Transform.rotate(
            angle: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.amber,
                  ),
                  // Wrap the text in an Expanded to prevent overflow
                  Text(
                    destinationModel.destination ?? "",
                    overflow: TextOverflow.ellipsis, // Avoid overflow
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShadow() {
    Widget child = Container(
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.5),
            blurRadius: 10,
          ),
        ],
      ),
    );

    // if (Offset != null) {
    //   child = TweenAnimationBuilder(
    //     tween: Tween<Offset>(begin: Offset.zero, end: Offset.infinite),
    //     duration: const Duration(milliseconds: 300),
    //     curve: Curves.easeOutBack,
    //     builder: (context, Offset offset, child) => Transform.translate(
    //       offset: offset,
    //       child: child,
    //     ),
    //     child: child,
    //   );
    // }

    return child;
  }
}
