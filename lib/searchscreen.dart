import 'package:flutter/material.dart';
import 'package:popcorner/detailscreen.dart';

class SearchScreen extends StatelessWidget {
  final List<Map<String, dynamic>> searchResults = [

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
      'thumbnail': "assets/star wars.png",
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
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search for a movie...',
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white),
          onSubmitted: (query) {
          },
        ),
      ),
      body: ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          final movie = searchResults[index];
          return ListTile(
            leading: Image.asset(movie['thumbnail']),
            title: Text(movie['title']),
            subtitle: Text(movie['summary']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(movie: movie),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
