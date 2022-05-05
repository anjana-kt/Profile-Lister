import 'package:flutter/material.dart';
import 'package:profile_lister/Liked_list.dart';
import 'package:profile_lister/profile.dart';
import 'Data.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isWaiting = false;
  Map<String, String> details = {};
  var data;
  List<Color> selcol = [];
  List<Data> liked = [];


  Container getProfileCard() {
    //List<Widget> profileCard = [];
    print(data);
    print("hey");
    for (int i = 0; i < limit; i++) {
      selcol.add(Colors.grey);
    }
    if (data != null) {
      return Container(
        child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 7,
                            offset: Offset(3, 5), // Shadow position
                          ),
                        ],
                      ),
                      width: 120,
                      height: 180,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: FittedBox(
                          fit: BoxFit.none,
                          child: Image.network(data['data'][index]['picture'],
                            width: 200,
                            height: 200,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${data['data'][index]['title']} ${data['data'][index]['firstName']} ${data['data'][index]['lastName']}',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 12.0,
                          ),
                        ),
                        Text(
                          data['data'][index]['id'],
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                            fontSize: 15.0,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (selcol[index] == Colors.blue)
                            {setState(() {
                              selcol[index] = Colors.grey;
                              Data l = Data(data['data'][index]['title'],
                                  data['data'][index]['firstName'],
                                  data['data'][index]['lastName'],
                                  data['data'][index]['picture'],
                                  data['data'][index]['id']);
                              liked.remove(l);
                            });
                            }
                            else
                            {setState(() {
                              selcol[index] = Colors.blue;
                              Data l = Data(data['data'][index]['title'],
                                  data['data'][index]['firstName'],
                                  data['data'][index]['lastName'],
                                  data['data'][index]['picture'],
                                  data['data'][index]['id']);
                              liked.add(l);

                              }
                            );
                              }
                          },
                          icon: Icon(Icons.thumb_up),
                          color: selcol[index],
                        ),
                      ],
                    ),
                  )
                ]),
              );
            },
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: limit),
      );
    }
    return Container(child: Center(child: Text('Loading...')));
  }

  void getProfile() async {
    try {
      isWaiting = true;
      data = await ProfileData().getProfileData();
      setState(() {
        data = data;
      });

      isWaiting = false;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Ticker'),
        backgroundColor: Colors.brown,
      ),
      body: Column(children:
        [Expanded(child: getProfileCard(),
        flex: 8,),
          Expanded(
            child: GestureDetector(

              onTap:(){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        LikedList(liked)));
              },
              child: Container(
                width: double.infinity,
                child: Center(child: Text('Liked Profiles',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                color: Colors.brown,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(bottom: 20),
                height: 80,
              ),
            ),
          )])
    );
  }
}
