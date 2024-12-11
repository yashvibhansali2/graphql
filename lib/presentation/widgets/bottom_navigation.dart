import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabTapped;

  const BottomNavigationBarWidget({
    Key? key,
    required this.currentIndex,
    required this.onTabTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        onTap: onTabTapped,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: false,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        selectedLabelStyle: TextStyle(color: Colors.black),
        items: [
          _buildBarItem(
            context,
            icon: Icons.home,
            label: 'Home',
            index: 0,
          ),
          _buildBarItem(
            context,
            icon: Icons.search,
            label: 'Search',
            index: 1,
          ),
          _buildBarItem(
            context,
            icon: Icons.favorite,
            label: 'Favorites',
            index: 2,
          ),
          _buildBarItem(
            context,
            icon: Icons.location_on,
            label: 'Destinations',
            index: 3,
          ),
          _buildBarItem(
            context,
            icon: Icons.account_circle,
            label: 'Profile',
            index: 4,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBarItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: Stack(
        alignment: Alignment.center,
        children: [
          if (currentIndex == index)
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
            ),
          Icon(icon),
        ],
      ),
      label: label,
    );
  }
}
