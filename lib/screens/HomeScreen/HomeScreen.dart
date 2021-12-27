import 'package:flutter/material.dart';

const IMAGES = [
  {
    "image":
        "https://media-exp1.licdn.com/dms/image/C4D03AQGljX322fRI8Q/profile-displayphoto-shrink_800_800/0/1621277184610?e=1646265600&v=beta&t=iCdv_bayed4hl75a786_Lrc3ZGLYyyOLFYNgc_kp564",
    "username": "Richard Bathiebo",
    "postImage":
        "https://images.pexels.com/photos/2834917/pexels-photo-2834917.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
  },
  {
    "image":
        "https://images.pexels.com/photos/1858175/pexels-photo-1858175.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    "username": "Sarah Caterine",
    "postImage":
        "https://images.pexels.com/photos/10033222/pexels-photo-10033222.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
  },
  {
    "image":
        "https://images.pexels.com/photos/3760856/pexels-photo-3760856.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    "username": "Ashley Camille",
    "postImage":
        "https://images.pexels.com/photos/3551230/pexels-photo-3551230.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
  },
  {
    "image":
        "https://images.pexels.com/photos/2691608/pexels-photo-2691608.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    "username": "Jean-Paul",
    "postImage":
        "https://images.pexels.com/photos/6952853/pexels-photo-6952853.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
  },
  {
    "image":
        "https://images.pexels.com/photos/1852083/pexels-photo-1852083.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    "username": "Maxime Vincent",
    "postImage":
        "https://images.pexels.com/photos/9967679/pexels-photo-9967679.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
  },
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        leading: Icon(Icons.add_circle),
        title: Text("InstaClone"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(
              Icons.ac_unit,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Color(0xFFF2F6F7),
          color: Theme.of(context).backgroundColor,

          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildStoriesItem(),
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Explorer",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70),
                              color: Colors.white,
                            ),
                            width: size.width * 0.5,
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search),
                              ),
                            ),
                          )
                        ],
                      ),
                      ...IMAGES
                          .map((e) => Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  FeedItem(
                                      image: e['image'],
                                      username: e["username"],
                                      postImage: e['postImage']),
                                ],
                              ))
                          .toList()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomAppbarItem(
                iconData: Icons.align_vertical_top_sharp,
                isActive: true,
              ),
              BottomAppbarItem(
                iconData: Icons.search,
              ),
              InkWell(
                child: Image(
                  image: AssetImage("assets/images/instagram.png"),
                  height: 50,
                ),
              ),
              BottomAppbarItem(
                iconData: Icons.ac_unit,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://media-exp1.licdn.com/dms/image/C4D03AQGljX322fRI8Q/profile-displayphoto-shrink_800_800/0/1621277184610?e=1646265600&v=beta&t=iCdv_bayed4hl75a786_Lrc3ZGLYyyOLFYNgc_kp564"),
              )
            ],
          ),
        ),
      ),
    );
  }

  SingleChildScrollView buildStoriesItem() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: IMAGES
            .map((e) => Row(
                  children: [
                    StoryItem(image: e["image"]),
                    SizedBox(
                      width: 14,
                    ),
                  ],
                ))
            .toList(),
      ),
    );
  }
}

class BottomAppbarItem extends StatelessWidget {
  bool isActive;
  final IconData iconData;

  BottomAppbarItem({
    Key? key,
    this.isActive = false,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Icon(
        iconData,
        size: 30,
        color: isActive ? Colors.white : Color(0xFFB0B0B0),
      ),
    );
  }
}

class FeedItem extends StatelessWidget {
  final image;
  final username;
  final postImage;

  const FeedItem({
    Key? key,
    this.image,
    this.username,
    this.postImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 0.2),
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).cardColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
          bottom: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    child: ListTile(
                      title: Text(
                        username,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      subtitle: Text('Hier , 20:07',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          )),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          image,
                        ),
                      ),
                      trailing: Wrap(
                        spacing: 14,
                        children: [
                          Icon(Icons.share,
                              color: Theme.of(context).primaryColor),
                          Icon(
                            Icons.apps,
                            color: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Stack(
              children: [
                Container(
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          postImage,
                        )),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color(0xFFFA057B),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.favorite,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 230,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.comment_rounded,
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text("824 j'aime",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      )),
                  SizedBox(
                    height: 4,
                  ),
                  Text("Voir les commentaires",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      )),
                  SizedBox(
                    height: 4,
                  ),
                  Text("Voir les commentaires",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StoryItem extends StatelessWidget {
  final image;

  const StoryItem({
    Key? key,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            image,
          ),
        ),
        border: Border.all(color: Color(0xFFBA1A7F), width: 3),
        borderRadius: BorderRadius.circular(70),
      ),
    );
  }
}
