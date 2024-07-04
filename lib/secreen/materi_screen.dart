import 'package:flutter/material.dart';
import 'package:media_pembelajaran/secreen/home_screen.dart';
import 'package:media_pembelajaran/secreen/profile_screen.dart';

class MateriScreen extends StatefulWidget {
  @override
  _MateriScreenState createState() => _MateriScreenState();
}

class _MateriScreenState extends State<MateriScreen> {
  int _selectedIndex = 1;

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
    } else if (_selectedIndex == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Materi'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://mrwallpaper.com/images/high/cute-avatar-profile-picture-23yuqpb8wz1dqqqv.webp'), // Replace with your image
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            SizedBox(height: 9),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubjectCard(subject: 'assets/indonesia.png'),
                  SubjectCard(subject: 'assets/inggris.png'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Pilih Materi Belajar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TabBarExample(),
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

class LanguageCard extends StatelessWidget {
  final String language;

  const LanguageCard({required this.language});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(
              'https://example.com/language_icon.png', // Replace with your image
              width: 60,
              height: 60,
            ),
            SizedBox(height: 8),
            Text(language),
          ],
        ),
      ),
    );
  }
}

class TabBarExample extends StatefulWidget {
  @override
  _TabBarExampleState createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<TabBarExample>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'All'),
            Tab(text: 'Tugas'),
            Tab(text: 'Quiz'),
          ],
        ),
        SizedBox(
          height: 300, // Adjust height as needed
          child: TabBarView(
            controller: _tabController,
            children: [
              CourseList(),
              Center(child: Text('Tugas')),
              Center(child: Text('Quiz')),
            ],
          ),
        ),
      ],
    );
  }
}

class CourseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CourseCard(
            title: 'Bentuk Aljabar',
            hours: 16,
            imagePath: 'assets/6655824.jpg'),
        CourseCard(
            title: 'Perbandingan', hours: 16, imagePath: 'assets/6655824.jpg'),
        CourseCard(
            title: 'Linier Satu Variable',
            hours: 14,
            imagePath: 'assets/6655824.jpg'),
      ],
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final int hours;
  final String imagePath;

  const CourseCard(
      {required this.title, required this.hours, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading:
            Image.asset(imagePath, width: 100, height: 190, fit: BoxFit.cover),
        title: Text(title),
        subtitle: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Wajib • ',
                style: TextStyle(color: Colors.blue),
              ),
              TextSpan(
                text: '$hours hours',
                style: TextStyle(color: Colors.orange),
              ),
            ],
          ),
        ),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}

class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;

  FilterChipWidget({required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (bool value) {
        // Handle chip selection
      },
    );
  }
}

class SubjectCard extends StatelessWidget {
  final String subject;

  SubjectCard({required this.subject});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          subject,
        ),
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
