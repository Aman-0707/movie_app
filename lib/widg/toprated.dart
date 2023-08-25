import 'package:flutter/material.dart';

import '../desc.dart';


class TopRated extends StatelessWidget {
final List toprated;

  const TopRated({super.key, required this.toprated});

  @override
  Widget build(BuildContext context) {
    return Container(
     
      padding: const EdgeInsets.all(10),
      child: Column(

        children: [
          Text('Top Rated Movies',style: TextStyle(fontSize: 22,color: Colors.purple[200],fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Container(
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: toprated.length,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(
                    name: toprated[index]['original_title']!=null?toprated[index]['original_title']:'Loading', 
                    description: toprated[index]['overview'], 
                    bannerurl: 'https://image.tmdb.org/t/p/w500'+toprated[index]['backdrop_path'],
                     posterurl: 'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path'], 
                     vote: toprated[index]['vote_average'].toString(), 
                     launch_date: toprated[index]['release_date']!=null?toprated[index]['release_date']:'N/A')));
                  },
                  child: 
                  toprated[index]['original_title']!=null?
                  Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path'],
                            ))
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
            child: Text(toprated[index]['title']!=null?toprated[index]['title']:'loading',style: TextStyle(
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