import 'package:flutter/material.dart';
import 'package:netflix_clone/data%20model/movies.dart';

import '../api/api.dart';
import '../api/genre.dart';
import '../themes/themes.dart';

class Details extends StatelessWidget {
  final Movies movies;
  const Details({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.transparent,
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                  'https://image.tmdb.org/t/p/w500${movies.backdroppath}'),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        movies.title,
                        style: heading1,
                      ),
                    ),
                    Wrap(
                      children: [
                        ...movies.genre.map((e) => Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.circle,
                                  color: Color.fromARGB(255, 201, 201, 201),
                                  size: 4,
                                ),
                                Text(
                                  ' ${genre[int.parse(e.toString())]}  ',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 201, 201, 201),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                    const SizedBox(width: 0.0, height: 10.0),
                    Text(
                      movies.overview,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 214, 214, 214)),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              Text(
                                'My List',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.download,
                                color: Colors.white,
                              ),
                              Text(
                                'Download',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.telegram,
                                color: Colors.white,
                              ),
                              Text(
                                'Share',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                color: Color.fromARGB(120, 107, 107, 107),
              ),
               const SizedBox(
              height: 20,
            ),
          const  Padding(
              padding:  EdgeInsets.all(8.0),
              child:  Text(
                'More like this',
                style: heading1,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                     children: [
                      ...trendingMovies.map((movies) => GestureDetector(
                         onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Details(movies: movies),));
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
