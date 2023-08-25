import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/widg/toprated.dart';
import 'package:movie_app/widg/trending.dart';
import 'package:movie_app/widg/upcommings.dart';
import 'package:tmdb_api/tmdb_api.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   int currentindex = 1;
  List trendingMovies = [];
  List topratedmovies = [];
  List upcommingmovies = [];
  final String apiKey = '014c77ad3f62db50802e34a2786040ea';
  final  readAcessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwMTRjNzdhZDNmNjJkYjUwODAyZTM0YTI3ODYwNDBlYSIsInN1YiI6IjY0ZTYwMjNkMGI1ZmQ2MDBlNWFlYTM1ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.x0rLZzApKLpoMCAGdxVivY3t7rdRkgb0ey8XXyW0MZI';

loadMovies()async{
  TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAcessToken),
  logConfig: ConfigLogger(
    showLogs: true,
    showErrorLogs: true
  )
  );


Map treandingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
Map toprated = await tmdbWithCustomLogs.v3.movies.getTopRated();
Map upcomming = await tmdbWithCustomLogs.v3.movies.getUpcoming();

setState(() {
  trendingMovies = treandingResult['results'];
   topratedmovies = toprated['results'];
    upcommingmovies = upcomming['results'];
});



}
  

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            gradient: LinearGradient(
              begin: Alignment(-0.749, -0.979),
              end: Alignment(0.785, 0.983),
              colors: <Color>[Color(0xff2e1371), Color(0xff130b2b)],
              stops: <double>[0, 1],
            ),
          ),

          child: ListView(
            children: [
              
              TopRated(toprated: topratedmovies),
              TrendingMovies(trending:trendingMovies),
              UpcomingMovies(up: upcommingmovies)
            ],
           
          ),
        );
  }
}