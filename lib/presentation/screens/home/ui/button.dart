import 'package:yashvi_graphql/domain/models/destination_model.dart';
import 'package:yashvi_graphql/domain/repository/home/home_repo.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DestinationModel? destinationModel;

  Future<void> _loadDestinations() async {
    destinationModel = await DestinationsRepo.getDestinationsApi();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: destinationModel?.destinationList.length ?? 0,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                  destinationModel?.destinationList[index].destination ?? ""),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _loadDestinations();
        },
        child: const SizedBox(),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:yashvi_graphql/domain/models/destination_model.dart';
// import 'package:yashvi_graphql/domain/repository/home/home_repo.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   DestinationModel? destinationModel;

//   Future<void> _loadDestinations() async {
//     destinationModel = await DestinationsRepo.getDestinationsApi();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Destinations'),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         foregroundColor: Colors.black,
//       ),
//       body: destinationModel == null
//           ? const Center(child: Text('No destinations loaded'))
//           : ListView.builder(
//               itemCount: destinationModel?.destinationList.length ?? 0,
//               itemBuilder: (context, index) {
//                 final destination = destinationModel!.destinationList[index];
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 16.0, vertical: 8.0),
//                   child: Hero(
//                     tag: destinationModel
//                             ?.destinationList[index].portraitImage ??
//                         'default-tag-$index',
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(16.0),
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(16.0),
//                         child: Stack(
//                           children: [
//                             Image.network(
//                               destinationModel
//                                       ?.destinationList[index].portraitImage ??
//                                   "",
//                               height: 200,
//                               width: double.infinity,
//                               fit: BoxFit.cover,
//                             ),
//                             Positioned(
//                               bottom: 16.0,
//                               left: 16.0,
//                               child: Container(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 12.0,
//                                   vertical: 8.0,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(8.0),
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     const Icon(
//                                       Icons.location_pin,
//                                       color: Colors.orange,
//                                       size: 16.0,
//                                     ),
//                                     const SizedBox(width: 4.0),
//                                     Text(
//                                       destinationModel?.destinationList[index]
//                                               .destination ??
//                                           "",
//                                       style: const TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _loadDestinations,
//         child: const Icon(Icons.refresh),
//       ),
//     );
//   }
// }
