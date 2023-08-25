import 'package:flutter/material.dart';



class Description extends StatelessWidget {
  final String name,launch_date;
  final String description,bannerurl,posterurl,vote;

  const Description({super.key, required this.name, required this.description, required this.bannerurl, required this.posterurl, required this.vote, required this.launch_date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Container(
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
             Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(bannerurl,fit: BoxFit.cover,),
                  ),),
                 

                    
                ],
              ),
             ),
             SizedBox(height: 20,),
             Container(
              child: Text( name!=null?name:'Loading Name',style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),),
             ),
            SizedBox(height: 10,),
             Container(
              child: Text('Releasing on : ' + launch_date,style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),),
             ),

             Row(
              children: [
                Container(
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Text(description,style: TextStyle(fontSize: 15,color: Colors.white),),
                  ),
                ),
                

              ],
             ),
             Container(
              child: Text('Avg Ratting : ' + vote + ' ⭐',style: TextStyle(
                fontSize: 18,
                color: Colors.amber,
              ),),
             ),
            ],
           
          ),
        ),
    );
  }
}