import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessangerHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 20.0,
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/9901911?v=4')
            ),
            SizedBox(width: 15.0,),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),

        actions: [
          IconButton(
            icon: CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.camera_alt,
                size: 16.0,
                color: Colors.white,
              ),
            ),
            onPressed: (){},
          ),
          IconButton(
            icon: CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.edit,
                size: 16.0,
                color: Colors.white,
              ),
            ),
            onPressed: (){},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  Search
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.all(
                      Radius.circular(5.0),
                    ),
                    color: Colors.grey[300]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                      ),
                      SizedBox(width: 15.0),
                      Text(
                        'Search',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              //  ListView stories
              Container(
                height: 100,
                child: ListView.separated(
                  itemBuilder: (context,index) => buildStoryItem(),
                  separatorBuilder: (context,index) => SizedBox(width: 20,),
                  itemCount: 8,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(height: 20,),
              // listView Chats
              ListView.separated(
                itemBuilder: (context,index) => buildChatItem(),
                separatorBuilder: (context,index) => SizedBox(height: 20,),
                itemCount: 15,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,

              ),



            ],
          ),
        ),
      ),

    );
  }
}

Widget buildChatItem() => Row(
  children: [
    Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/9901911?v=4'),

        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(
            bottom: 3.0,
            end: 3.0,
          ),
          child: CircleAvatar(
            radius: 7.0,
            backgroundColor: Colors.green,
          ),
        ),


      ],
    ),
    SizedBox(width: 20.0,),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Islam Gharib',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 5.0,),
          Row(
            children: [
              Expanded(
                child: Text(
                  'jllkkkkkkkkkkkljhgggg',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Container(
                  width: 7.0,
                  height: 7.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Text(
                '02:00 PM',
              ),
            ],
          ),
        ],
      ),
    ),
  ],
);

Widget buildStoryItem() => Container(
  width: 60.0,
  child: Column(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/9901911?v=4'),

          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: 3.0,
              end: 3.0,
            ),
            child: CircleAvatar(
              radius: 7.0,
              backgroundColor: Colors.green,
            ),
          ),


        ],
      ),
      SizedBox(height: 6.0,),
      Text(
        'Islam Gharib gghhjjjjjjjjjjjj',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),

    ],
  ),
);



