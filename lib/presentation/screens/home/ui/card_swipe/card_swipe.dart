import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:yashvi_graphql/domain/models/destination_model.dart';
import 'package:yashvi_graphql/domain/repository/home/home_repo.dart';
import 'package:yashvi_graphql/presentation/widgets/bottom_navigation.dart';

class DestinationScreen extends StatefulWidget {
  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  DestinationModel? destinationModel;
  int currentIndex = 0;

  Future<void> _loadDestinations() async {
    destinationModel = await DestinationsRepo.getDestinationsApi();
    setState(() {});
  }

  void _onTabTapped(int index) {
    setState(() {
      currentIndex = index;
      // Handle navigation logic based on the selected tab index
    });
  }

  @override
  void initState() {
    _loadDestinations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: currentIndex,
        onTabTapped: _onTabTapped,
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Destinations'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.amber.shade100, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Swiper(
            itemCount: destinationModel?.destinationList.length ?? 0,
            layout: SwiperLayout.TINDER,
            itemWidth: 300,
            itemHeight: MediaQuery.of(context).size.height * .42,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Colors.white,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        destinationModel
                                ?.destinationList[index].portraitImage ??
                            "",
                        fit: BoxFit.cover,
                        height: 250,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      left: 16,
                      right: 16,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.amber),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.amber,
                            ),
                            SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                destinationModel
                                        ?.destinationList[index].destination ??
                                    "",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
