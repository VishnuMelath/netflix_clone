import 'package:flutter/material.dart';
import 'package:netflix_clone/api/api.dart';
import 'package:netflix_clone/api/genre.dart';
import 'package:netflix_clone/data%20model/movies.dart';
import 'package:netflix_clone/screens/details.dart';
import 'package:netflix_clone/themes/themes.dart';

class NewAndHotPage extends StatefulWidget {
  const NewAndHotPage({super.key});

  @override
  State<NewAndHotPage> createState() => _NewAndHotPageState();
}

class _NewAndHotPageState extends State<NewAndHotPage> {
  List<List<Movies>> list=[upcomingMovies,tvshows,trendingMovies,popularMovies,tvshows];
  List<String> options = [
    'Coming soon',
    'Top 10',
    'New & Hot',
    'Everyone watching',
    'Trending'
  ];
  int selectedindex = 2;
  bool selected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New & Hot'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
            child: ListView.builder(
                itemCount: options.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  index == selectedindex ? selected = true : selected = false;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedindex = index;
                      });
                    },
                    child: Container(
                      decoration: containerdec[selected],
                      padding: const EdgeInsets.all(10),
                      // margin: const EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          options[index],
                          style: selandunseltextstyle[selected],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: list[selectedindex].length,
            itemBuilder: (context, index) {
              Movies hot = list[selectedindex][index];

              return GestureDetector(
                 onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Details(movies: hot),));
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    color: const Color.fromARGB(255, 39, 39, 39),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500${hot.backdroppath}'),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  hot.title,
                                  style: heading1,
                                ),
                              ),
                              Wrap(
                                children: [
                                  ...hot.genre.map((e) => Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.circle,color: Color.fromARGB(255, 201, 201, 201),size: 4,),
                                      Text(
                                            ' ${genre[int.parse(e.toString())]}  ',
                                            style: const TextStyle(color: Color.fromARGB(255, 201, 201, 201),),
                                          ),
                                    ],
                                  ))
                                ],
                              ),
                              const SizedBox(width: 0.0, height: 10.0),
                               Row(
                                children: [ 
                                  Expanded(child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: Colors.white
                                  ),
                                  child: const Center(child: Text('Watch Now',style: TextStyle(fontWeight: FontWeight.w800),)),
                                  )),
                                        const SizedBox(width: 10,),
                                  Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: Color.fromARGB(255, 65, 65, 65)
                                  ),
                                    padding: const EdgeInsets.all(9),
                                    child: const Center(child: Icon(Icons.add,color: Colors.white,))),
                                
                                ],
                              )
                            ],
                          ),
                        ),
                      
                      ],
                    ),
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
