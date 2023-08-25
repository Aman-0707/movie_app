import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/widg/toprated.dart';
import 'package:movie_app/widg/trending.dart';
import 'package:movie_app/widg/upcommings.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../desc.dart';



class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage2> {

  
 List _founduser = [];
  List topratedmovies = [];

  final String apiKey = '014c77ad3f62db50802e34a2786040ea';
  final  readAcessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwMTRjNzdhZDNmNjJkYjUwODAyZTM0YTI3ODYwNDBlYSIsInN1YiI6IjY0ZTYwMjNkMGI1ZmQ2MDBlNWFlYTM1ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.x0rLZzApKLpoMCAGdxVivY3t7rdRkgb0ey8XXyW0MZI';

loadMovies()async{
  TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAcessToken),
  logConfig: ConfigLogger(
    showLogs: true,
    showErrorLogs: true
  )
  );


Map toprated = await tmdbWithCustomLogs.v3.movies.getTopRated();


setState(() {

   topratedmovies = toprated['results'];
  
});

}
  
 




void _runFilter (String Keyword){
  List<dynamic>_result = [];
  
 Keyword==null?_result=topratedmovies:_result = topratedmovies.where((element) => element["original_title"].toLowerCase().contains(Keyword.toLowerCase())).toList();

setState(() {
  _founduser = _result;
   
});

}







  @override
  void initState() {
   
    loadMovies();
    _founduser = topratedmovies;
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

          child:   Column(

            
            children: [
              Padding(
                padding: const EdgeInsets.only(left:10.0,right: 10),
                child: TextField(
                  onChanged: (value) => _runFilter(value),
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search for movies',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
              ),

              

               SizedBox(height: 15,),         
              SingleChildScrollView(
                child: Container(
                  height: 430,
                  width: 350,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: topratedmovies.length,
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(
                            name: topratedmovies[index]['original_title']!=null?topratedmovies[index]['original_title']:'Loading', 
                            description: topratedmovies[index]['overview'], 
                            bannerurl: 'https://image.tmdb.org/t/p/w500'+topratedmovies[index]['backdrop_path'],
                             posterurl: 'https://image.tmdb.org/t/p/w500'+topratedmovies[index]['poster_path'], 
                             vote: topratedmovies[index]['vote_average'].toString(), 
                             launch_date: topratedmovies[index]['release_date']!=null?topratedmovies[index]['release_date']:'N/A')));
                          },
                          child: 
                          
                          topratedmovies[index]['original_title']!=null?
                          Container(
                            width: 140,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500'+topratedmovies[index]['backdrop_path'],
                                    ))
                                  ),
                                ),
                               
                                Container(
                    child: Text(topratedmovies[index]['title']!=null?topratedmovies[index]['title']:'loading',style: TextStyle(
                      fontSize: 16,
                      color: Colors.purple[100],
                    ),),
                  ),
                  
                   SizedBox(height: 25,),  
                              ],
                            ),
                          ):Container(),
                          
                        );
                    }),
                ),
              ),
            ],
          ),
          );
              
    
     
  }
}



