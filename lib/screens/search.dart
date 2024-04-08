import 'package:flutter/material.dart';
import 'package:netflix_clone/api/api.dart';
import 'package:netflix_clone/screens/details.dart';
import 'package:netflix_clone/themes/themes.dart';

import '../data model/movies.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late List<Movies> searchItems;
  @override
  void initState() {
    searchItems = trendingMovies;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
      ),
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: bottomnavcolor,
                      border: Border.all(color: bottomnavcolor)),
                  child: TextField(
                    style: const TextStyle(
                        color: Color.fromARGB(255, 184, 184, 184)),
                    decoration: const InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 199, 199, 199)),
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 199, 199, 199),
                        )),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        Api().searchMovies(value).then((value) {
                          searchItems = value;
                          setState(() {});
                        });
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Wrap(
                  children: [
                    ...searchItems.map((movies) => GestureDetector(
                      onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Details(movies: movies),
                          ));
                    },
                      child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                                height: 200,
                          width: 140,
                       
                            decoration: decoration('https://image.tmdb.org/t/p/w500${movies.posterPath}'),),
                          ),
                    ))
                  ],
                ),
              ))
            ],
          )),
    );
  }
}
