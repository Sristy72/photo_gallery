
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Details_Screen.dart';

List<ImageDetails> details_Image = [
  ImageDetails(
    imagePath: 'images/mood.jpeg',
    title: "Mood",
    detailsHeading: "Mood With Nature",
    details: "Being in nature, or even viewing scenes of nature, reduces anger, fear, and stress and increases pleasant feelings",
  ),

  ImageDetails(
    imagePath: 'images/aesthetic.jpeg',
    title: "Aesthetic",
    detailsHeading: "Aesthetic",
    details: "Aesthetics is the branch of philosophy concerned with the nature of beauty and the nature of taste",
  ),

  ImageDetails(
    imagePath: 'images/animals.jpeg',
    title: "Animals",
    detailsHeading: "Importance of Animals",
    details: "Animals improve the welfare of humans in many ways, for a number of species, as food.",
  ),

  ImageDetails(
    imagePath: 'images/city.jpeg',
    title: "City",
    detailsHeading: "Definition of City",
    details: "A city has many buildings and streets. It has houses, hotels, condominiums, and apartments for many people to live in.",
  ),

  ImageDetails(
    imagePath: 'images/travel.jpeg',
    title: "Travel",
    detailsHeading: "Travelling",
    details: "Traveling helps to condition the quality of life positively by coming into contact with new cultures",
  ),

  ImageDetails(
    imagePath: 'images/sky.jpeg',
    title: "Sky",
    detailsHeading: "Sky is blue",
    details: "The sky is an unobstructed view upward from the surface of the Earth. It includes the atmosphere and outer space.",
  ),

  ImageDetails(
    imagePath: 'images/road.jpeg',
    title: "Road",
    detailsHeading: "Definition of Road",
    details: "A wide way leading from one place to another, especially one with a specially prepared surface which vehicles can use.",
  ),

  ImageDetails(
    imagePath: 'images/flowers.jpeg',
    title: "Flowers",
    detailsHeading: "Importance of Flowers",
    details: "Flowers attract pollinators to make seeds, helping plants to reproduce and form the next generation. ",
  ),
];

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //toolbarHeight: 60,
          title: Center(child: Text('Photo Gallery')),
          backgroundColor: Color(0xff2CAB00),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
          ],
          leading: Icon(CupertinoIcons.arrow_left),
        ),

        body: OrientationBuilder(builder: (BuildContext context, Orientation orientation){
          if(orientation == Orientation.portrait){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, childAspectRatio: 1),

                  itemCount: details_Image.length,
                  itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context){
                              return DetailScreen(
                                  imagePath: details_Image[index].imagePath,
                                  title: details_Image[index].title,
                                  details: details_Image[index].details,
                                  detailsHeading: details_Image[index].detailsHeading
                              );
                            },)
                        );
                      },
                      child: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10,10),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                    image: AssetImage(details_Image[index].imagePath),
                                    fit: BoxFit.cover
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 7,
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      offset: Offset(0, 15)
                                  )
                                ]
                            ),

                            child: Container(
                              alignment: Alignment.bottomLeft,
                              margin: EdgeInsets.only(bottom: 19, left: 23),
                              child: Text(details_Image[index].title, style:TextStyle(
                                  fontSize: 20,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white
                              )),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            );
          }else{
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, crossAxisSpacing: 10, mainAxisSpacing: 10),

                  itemCount: details_Image.length,
                  itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context){
                              return DetailScreen(
                                  imagePath: details_Image[index].imagePath,
                                  title: details_Image[index].title,
                                  details: details_Image[index].details,
                                  detailsHeading: details_Image[index].detailsHeading
                              );
                            },)
                        );
                      },
                      child: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10,10),
                          child: SizedBox(
                            height: 180,
                            width: 180,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                      image: AssetImage(details_Image[index].imagePath),
                                      fit: BoxFit.cover
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 7,
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        offset: Offset(0, 15)
                                    )
                                  ]
                              ),

                              child: Container(
                                alignment: Alignment.bottomLeft,
                                margin: EdgeInsets.only(bottom: 19, left: 23),
                                child: Text(details_Image[index].title, style:TextStyle(
                                    fontSize: 20,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            );
          }
        })
    );
  }
}


class ImageDetails{
  late  String imagePath;
  late  String title;
  late String details;
  late String detailsHeading;
  ImageDetails({required this.imagePath, required this.details, required this.title, required this.detailsHeading});
}