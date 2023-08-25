import 'package:flutter/material.dart';

import '../desc.dart';


class UpcomingMovies extends StatelessWidget {
final List up;

  const UpcomingMovies({super.key, required this.up});

  @override
  Widget build(BuildContext context) {
    return Container(
     
      padding: const EdgeInsets.all(10),
      child: Column(

        children: [
          Text('Upcomming soon',style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
          SizedBox(height: 15,),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: up.length,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(
                    name: up[index]['original_title']!=null?up[index]['original_title']:'Loading', 
                    description: up[index]['overview'], 
                    bannerurl: 'https://image.tmdb.org/t/p/w500'+up[index]['backdrop_path'],
                     posterurl: 'https://image.tmdb.org/t/p/w500'+up[index]['poster_path'], 
                     vote: up[index]['vote_average'].toString(), 
                     launch_date: up[index]['release_date']!=null?up[index]['release_date']:'N/A')));
                  },
                  child:
                  up[index]['original_title']!=null?
                  
                   Container(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      children: [
                        Container(
                          
                          width: 250,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500'+up[index]['backdrop_path'],
                            ))
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
            child: Text(up[index]['title']!=null?up[index]['title']:'loading',style: TextStyle(
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