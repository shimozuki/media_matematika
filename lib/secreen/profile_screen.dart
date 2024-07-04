import 'package:flutter/material.dart';
import 'package:media_pembelajaran/secreen/home_screen.dart';
import 'package:media_pembelajaran/secreen/materi_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 4;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Halamanutama(),
        ),
      );
    } else if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MateriScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        'https://mrwallpaper.com/images/high/cute-avatar-profile-picture-23yuqpb8wz1dqqqv.webp'), // Replace with your image
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Tyreenia',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('Favourite'),
              trailing: Icon(Icons.visibility_off),
            ),
            Divider(),
            ListTile(
              title: Text('Edit Account'),
              trailing: Icon(Icons.visibility_off),
            ),
            Divider(),
            ListTile(
              title: Text('Settings and Privacy'),
              trailing: Icon(Icons.visibility_off),
            ),
            Divider(),
            ListTile(
              title: Text('Log Out'),
              trailing: Icon(Icons.visibility_off),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomClipperNavigationBar(),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Course',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(
                  bottom: 10.0), // Adjust this value as needed
              child: CircleAvatar(
                backgroundColor: Colors.blue.withOpacity(0.1),
                child: Icon(Icons.search, color: Colors.blue),
              ),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

class CustomClipperNavigationBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double height = size.height;
    final double width = size.width;

    final Path path = Path();
    path.moveTo(0, 20);
    path.lineTo(width / 2 - 28, 20);
    path.quadraticBezierTo(width / 2 - 28, 0, width / 2, 0);
    path.quadraticBezierTo(width / 2 + 28, 0, width / 2 + 28, 20);
    path.lineTo(width, 20);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
