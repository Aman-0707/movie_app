import 'package:flutter/material.dart';
import 'package:movie_app/desc.dart';


class TrendingMovies extends StatelessWidget {
final List trending;

  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
     
      padding: const EdgeInsets.all(10),
      child: Column(

        children: [
          Text('Trending Movies',style: TextStyle(fontSize: 26,color: Colors.purple[200],fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(
                    name: trending[index]['original_title']!=null?trending[index]['original_title']:'Loading', 
                    description: trending[index]['overview'], 
                    bannerurl: 'https://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path'],
                     posterurl: 'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'], 
                     vote: trending[index]['vote_average'].toString(), 
                     launch_date: trending[index]['release_date']!=null?trending[index]['release_date']:'N/A')));
                  },
                  child: 
                  trending[index]['original_title']!=null?
                  Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'],
                            ))
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
            child: Text(trending[index]['title']!=null?trending[index]['title']:'loading',style: TextStyle(
              fontSize: 16,
              color: Colors.purple[100],
            ),),
          )
                      ],
                    ),
                  ):Container(),
                  
                );
            }),
          ),
          

        ],
      ),
    );
  }
}