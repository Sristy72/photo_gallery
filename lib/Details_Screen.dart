import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<SuggestionImage> sugggestios = [
  SuggestionImage(
    imagePath: 'images/travel.jpeg',
    title: "Travel",
  ),

  SuggestionImage(
    imagePath: 'images/leaves.jpeg',
    title: "Leaves",
  ),

  SuggestionImage(
    imagePath: 'images/road.jpeg',
    title: "Road",
  ),

  SuggestionImage(
    imagePath: 'images/sky.jpeg',
    title: "Sky",
  ),
];


class DetailScreen extends StatelessWidget{
  late String imagePath;
  late String title;
  late String details;
  late String detailsHeading;

  DetailScreen({required this.imagePath, required this.title, required this.details, required this.detailsHeading});


  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);
    return Scaffold(
      appBar: AppBar(
          title: Center(child: Text(title)),
          backgroundColor: Color(0xff2CAB00),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
          ],
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(CupertinoIcons.arrow_left))
      ),
      body: OrientationBuilder(builder: (BuildContext context, Orientation orientation) {
        if(orientation == Orientation.portrait){
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: SizedBox(
                      height: 325,
                      width: 410,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              image: AssetImage(imagePath),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 30,
                                  color: Colors.grey.withOpacity(0.9),
                                  spreadRadius: 5,
                                  offset: Offset(0, 15)
                              )
                            ]
                        ),
                      ),
                    ),
                  ),
                ),

                Container(
                  //height: 260,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:20, left: 30, bottom: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              detailsHeading,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                fontStyle: FontStyle.normal
                              ),
                            ),

                            SizedBox(height: 10,),
                            Text(
                              details,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                fontStyle: FontStyle.normal
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: double.infinity,
                        height: 90,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff2CAB00),
                                  foregroundColor: Colors.white,
                                  elevation: 25,

                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)
                                  )
                              ),
                              onPressed: (){}, child: Text('See More', style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500, fontStyle: FontStyle.normal
                          ),)),
                        ),
                      ),


                      Container(
                        //width: 20,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, left: 30, bottom: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Suggestions',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff2CAB00),
                                  fontStyle: FontStyle.normal
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 9),
                        child: Container(
                            width: 370,
                            height: (MediaQuery.of(context).size.height)*.58,

                            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                                ),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: sugggestios.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 180,
                                  height: 180,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                        image: AssetImage(sugggestios[index].imagePath),
                                        fit: BoxFit.fill
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
                                    child: Text(sugggestios[index].title, style:TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white
                                    )),
                                  ),
                                );
                              },)
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        else{
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left section with fixed image
                SizedBox(
                  width: 300, // Adjusted width for frozen image
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 0, 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 30,
                          color: Colors.grey.withOpacity(0.9),
                          spreadRadius: 5,
                          offset: Offset(0, 15),
                        )
                      ],
                    ),
                  ),
                ),
                // Right section with scrollable content
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Details section
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  detailsHeading,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  details,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // See More button
                          Container(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff2CAB00),
                                foregroundColor: Colors.white,
                                elevation: 25,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: () {},
                              child: Text('See More', style: TextStyle(
                                fontStyle: FontStyle.normal, fontWeight: FontWeight.w500
                              ),),
                            ),
                          ),
                          // Suggestions section
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Suggestions',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green,
                                  ),
                                ),

                                SizedBox(height: 10),

                                Container(
                                  width: 330,
                                  height: MediaQuery.of(context).size.height,
                                  child: GridView.builder(
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1,
                                      mainAxisSpacing: 5,
                                      crossAxisSpacing: 5,
                                    ),
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: sugggestios.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        width: 180,
                                        height: 180,
                                        margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          image: DecorationImage(
                                            image: AssetImage(sugggestios[index].imagePath),
                                            fit: BoxFit.cover,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 7,
                                              color: Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              offset: Offset(0, 15),
                                            )
                                          ],
                                        ),
                                        child: Container(
                                          alignment: Alignment.bottomLeft,
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            sugggestios[index].title,
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
      ),


    );
  }
}

class SuggestionImage{
  late String imagePath;
  late String title;

  SuggestionImage({required this.imagePath, required this.title});

}