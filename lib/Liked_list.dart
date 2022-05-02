import 'package:flutter/material.dart';
import 'package:profile_lister/Profile_Screen.dart';
import 'Data.dart';

class LikedList extends StatelessWidget {
  final List<Data> liked;
  const LikedList(this.liked);
  @override
  Widget build(BuildContext context) {
    {
      return Container(child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {

            return Container(
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
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
                        child: Image(
                          image: NetworkImage(liked[0].picture),
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
                        '${liked[index].title} ${liked[index].firstName} ${liked[index].lastName}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 12.0,
                        ),
                      ),
                      Text(
                        liked[index].id,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                          fontSize: 15.0,
                        ),
                      ),

                        Icon(Icons.thumb_up,
                        color: Colors.blue,
                        )

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
          itemCount: liked.length));
          }

  }
}
