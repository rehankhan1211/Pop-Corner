import 'package:flutter/material.dart';
import 'package:popcorner/searchscreen.dart';
import 'package:popcorner/detailscreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => SearchScreen()),
      );
    }
  }

  final List<Map<String, dynamic>> movies = [
    {
      'title': 'Animal',
      'summary': 'Action Movie',
      'thumbnail': 'assets/animal.jpg',
    },
    {
      'title': 'Indiana Jones',
      'summary': 'Documentry Movie',
      'thumbnail': 'assets/indiana jones.png',
    },
    {
      'title': 'Jurasic Park',
      'summary': 'WildLife Movie',
      'thumbnail': 'assets/jurasic park.jpg',
    },
    {
      'title': 'Star Wars',
      'summary': 'Sci Fi Movie',
      'thumbnail': 'assets/star wars.png',
    },
    {
      'title': 'Toy Story',
      'summary': 'Animated Movie',
      'thumbnail': 'assets/toy story.png',
    },
    {
      'title': 'Blade Runner',
      'summary': 'Thriller Movie',
      'thumbnail': 'assets/blade runner.png',
    },
    {
      'title': 'James Bond 007',
      'summary': 'Detective Movie',
      'thumbnail': 'assets/007.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 30,
          mainAxisSpacing: 40,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(movie: movie),
                ),
              );
            },
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(movie['thumbnail'],
                      fit: BoxFit.cover),
                ),
                SizedBox(height: 10),
                Text(movie['title'],
                    style: TextStyle(fontSize: 16)),
                Text(movie['summary'], maxLines: 2,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}
