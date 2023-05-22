import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/post.dart';
import '../models/story.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final List<Post> _posts = [
    Post(
      username: "Azamat",
      userImage: "assets/images/user1.png",
      where: "DATA LC",
      image: "assets/images/post1.jpeg",
      description: "Great place",
      countLikes: 200,
      countComments: 15,
    ),
    Post(
      username: "Muza",
      userImage: "assets/images/user2.png",
      where: "Khorezm",
      image: "assets/images/post2.jpeg",
      description: "Great place",
      countLikes: 20,
      countComments: 105,
    ),
    Post(
      username: "Qaymaq",
      userImage: "assets/images/user3.png",
      where: "USA",
      image: "assets/images/post4.png",
      description: "Great place",
      countLikes: 200,
      countComments: 15,
    ),
    Post(
      username: "Quranboy",
      userImage: "assets/images/user4.png",
      where: "DATA LC",
      image: "assets/images/post3.jpeg",
      description: "New image",
      countLikes: 200,
      countComments: 15,
    ),
    Post(
      username: "Muza",
      userImage: "assets/images/user2.png",
      where: "Khorezm",
      image: "assets/images/post2.jpeg",
      description: "Great place",
      countLikes: 20,
      countComments: 105,
    ),
    Post(
      username: "Qaymaq",
      userImage: "assets/images/user3.png",
      where: "USA",
      image: "assets/images/post4.png",
      description:
          "Great placekjhakjdhaks jflks jflkjs fs kfhksjh hdfkgj hskjg hksjhg ksjd gkjsdh gjdgjkh djkghiefndkjv boygvbdvyvbgedvb hd kjahdk kjg jhas fjh jkfhg fjgf akjgf kjhagf kjahg fgdfg dg dg gd fg dfgdfg dfgd gdgdfgdfg dfg df g dfg dfg dfgdfg dfg dfgdfg fkj agfkj ",
      countLikes: 200,
      countComments: 15,
    ),
    Post(
      username: "Azamat",
      userImage: "assets/images/user1.png",
      image: "assets/images/post1.jpeg",
      description: "Great place",
      countLikes: 200,
      countComments: 15,
    ),
  ];
  final List<Story> _stories = [
    Story(username: "Azamat", image: "assets/images/user1.png"),
    Story(username: "Shaptoli", image: "assets/images/user2.png"),
    Story(username: "Sapargul", image: "assets/images/user3.png"),
    Story(username: "Shaptoli", image: "assets/images/user2.png"),
    Story(username: "Azamat", image: "assets/images/user1.png"),
    Story(username: "Diyorbek", image: "assets/images/post4.png"),
    Story(username: "Sapargul", image: "assets/images/user3.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(
              color: Colors.black54,
            ),
            //story
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: _stories.map((story) {
                  return itemStory(story);
                }).toList(),
              ),
            ),
            //feed
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _posts.length,
                itemBuilder: (context, index) {
                  return _itemPost(_posts[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget itemStory(Story story) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              width: 3,
              color: const Color(0xFF8c44ad),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          story.username,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _itemPost(Post post) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          //header
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.userImage),
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.username,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.fmd_good_outlined,
                              color: Colors.white,
                              size: 13,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              post.where ?? "Somewhere",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
                // SvgPicture.asset("assets/images/ic_more.svg",),
              ],
            ),
          ),
          FadeInImage(
            placeholder: const AssetImage("assets/images/post4.png"),
            image: AssetImage(post.image ?? "assets/images/post1.jpeg"),
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 25, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 10),
                    SvgPicture.asset("assets/images/ic_liked.svg"),
                    const SizedBox(width: 20),
                    SvgPicture.asset("assets/images/ic_chat.svg"),
                    const SizedBox(width: 20),
                    SvgPicture.asset("assets/images/ic_sent.svg"),
                  ],
                ),
                SvgPicture.asset("assets/images/ic_save.svg"),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "${post.countLikes} likes",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: post.username,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: " ${post.description}",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "View ${post.countComments} comment",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 14),
            child: const Text(
              "2 hours ago",
              style: TextStyle(color: Colors.grey,fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget addStory() {
    return Container(
      width: 50,
      height: 50,
    );
  }
}
