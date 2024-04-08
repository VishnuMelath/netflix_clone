import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/api/api.dart';
import 'package:netflix_clone/screens/details.dart';
import 'package:netflix_clone/screens/search.dart';
import 'package:netflix_clone/themes/themes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/netflix.png',
          width: 80,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => const Search(),));
              },
              child: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            const Text(
              'Trending',
              style: heading1,
            ),
            const SizedBox(
              height: 10,
            ),
            CarouselSlider(items: [
              ...popularMovies.map((movies) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Details(movies: movies),
                          ));
                    },
                    child: Container(
                      decoration: decoration('https://image.tmdb.org/t/p/w500${movies.posterPath}'),
                      
                    ),
                  ))
            ], options: carouselOptions),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Top Rated Movies',
              style: heading1,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  ...trendingMovies.map((movies) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Details(movies: movies),
                              ));
                        },
                        child: Container(
                          height: 200,
                          width: 120,
                            margin: const EdgeInsets.all(10),
                            decoration: decoration('https://image.tmdb.org/t/p/w500${movies.posterPath}'),
                            ),  
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Upcoming Movies',
              style: heading1,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  ...upcomingMovies.map((movies) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Details(movies: movies),
                              ));
                        },
                        child: Container(margin: const EdgeInsets.all(10),
                          height: 200,
                          width: 120,
                          
                            decoration: decoration('https://image.tmdb.org/t/p/w500${movies.posterPath}'),
                            
                            ),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'TV shows',
              style: heading1,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  ...tvshows.map((movies) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Details(movies: movies),
                              ));
                        },
                        child: Container(
                            height: 200,
                          width: 120,
                            margin: const EdgeInsets.all(10),
                            decoration: decoration('https://image.tmdb.org/t/p/w500${movies.posterPath}'),
                          ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
