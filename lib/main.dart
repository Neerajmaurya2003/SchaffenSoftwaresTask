import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyTask(),
    );
  }
}

class MyTask extends StatefulWidget {
  const MyTask({super.key});

  @override
  State<MyTask> createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {
  double scrollPosition = 0.0;
  bool mutenotificationswitch = false;
  bool searchtrack = false;
  List<bool> isfollow = [];
  ScrollController scrollController = ScrollController();
  bool tag=false;
  int leftlist=0;
  int maxelement = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification && notification.metrics.axisDirection==AxisDirection.down) {
          scrollPosition = notification.metrics.pixels;
          print(scrollPosition);
          setState(() {});
        }
        return false;
      },
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            title:const Padding(
              padding:  EdgeInsets.only(top: 20.0),
              child: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
            ),
            bottom: PreferredSize(
              child: scrollPosition < 200
                  ? Container(
                      height: 100,
                      color: Colors.red,
                      child: Center(
                        child: ListTile(
                          title: const Text(
                            "The weekend",
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text(
                            "community . +11k Members",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: Container(
                            height: 50,
                            width: 50,
                            child: const Icon(
                              Icons.share_outlined,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.white),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ),
                    )
                  : Container(
                      height: 80,
                      color: Colors.red,
                      child: Row(
                        children: [
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 3.0, right: 10),
                            child: CircleAvatar(
                                backgroundColor: Colors.black38,
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                )),
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage("assets/images/1.png"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.only(top: 15.0, bottom: 5, left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "The weekend",
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "community . +11k Members",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          Padding(
                            padding: const EdgeInsets.only(right: 25.0),
                            child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(context: context, builder: ( context){
                                    return Container(
                                      height: 184,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child:Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 6.0),
                                            child: Center(
                                              child:Container(
                                                height: 5,
                                                width: 88,
                                                decoration: BoxDecoration(
                                                  color:const Color.fromARGB(73, 73, 73, 1),
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                              )
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(left:20),
                                            child: SizedBox(
                                              height: 24,
                                              child:Row(
                                                children: [
                                                  Image(image: AssetImage("assets/images/link.png")),
                                                  Text("  Invite",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,),)
                                                ],
                                              )
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(left:20),
                                            child: SizedBox(
                                                height: 24,
                                                child:Row(
                                                  children: [
                                                    Image(image: AssetImage("assets/images/user.png")),
                                                    Text("  Add Member",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,),)
                                                  ],
                                                )
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(left:20,bottom: 20),
                                            child: SizedBox(
                                                height: 24,
                                                child:Row(
                                                  children: [
                                                    Image(image: AssetImage("assets/images/group.png")),
                                                    Text("  Add Group",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,),)
                                                  ],
                                                )
                                            ),
                                          )
                                        ],
                                      )
                                    );
                                  });
                                },
                                child: Image.asset(
                                  "assets/images/options.png",
                                )),
                          ),
                        ],
                      ),
                    ),
              preferredSize: const Size.fromHeight(80),
            ),
            floating: true,
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Image.asset(
                  "assets/images/1.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const Padding(
                    padding: EdgeInsets.only(top: 25.0, left: 10, right: 10),
                    child: ReadMoreText(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                      trimLines: 5,
                      trimCollapsedText: "Show More",
                      colorClickableText: Colors.red,
                      trimExpandedText: "Show less",
                      trimMode: TrimMode.Line,
                      style: TextStyle(fontSize: 16),
                    )),
                Container(
                    height: 50,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          if (index < maxelement) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 10.0,bottom: 10,left: 2,right: 2),
                              child: Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border:
                                        Border.all(width: 1, color: Colors.red)),
                                child: const Center(
                                    child: Text("Outdoor",
                                        style: TextStyle(color: Colors.red))),
                              ),
                            );
                          }
                          else if(index==maxelement){
                            leftlist=6-maxelement;
                            return Padding(
                              padding: const EdgeInsets.only(top: 10.0,bottom: 10,left: 2,right: 2),
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    maxelement=6;
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.red
                                    )
                                  ),
                                  child: Center(child:Text("+${leftlist}",style: const TextStyle(color: Colors.red),)),
                                ),
                              ),
                            );
                          }

                        })),
                Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: Row(children: [
                      const Text(
                        "Media,docs and links",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      const Expanded(child: SizedBox()),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
                        ),
                      ),
                    ])),
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            height: 150,
                            width: 110,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage("assets/images/1.png"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        );
                      }),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text("Mute notification",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        const Expanded(child: SizedBox()),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Switch(
                            activeTrackColor: Colors.red,
                            inactiveTrackColor: Colors.white,
                            inactiveThumbColor: Colors.grey,
                            value: mutenotificationswitch,
                            onChanged: (value) {
                              setState(() {
                                mutenotificationswitch = value;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Image.asset("assets/images/trash.png"),
                          ),
                          const Text(" Clear Chat",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Image.asset("assets/images/lock.png"),
                          ),
                          const Text(" Encryption",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Image.asset("assets/images/logout.png"),
                          ),
                          const Text(" Exit community",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Image.asset("assets/images/dislike.png"),
                          ),
                          const Text(" Report",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red))
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: searchtrack == false
                      ? Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text(
                                "Members",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            Padding(
                              padding: const EdgeInsets.only(right: 40.0),
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      scrollController.animateTo(815,
                                          duration: const Duration(seconds: 1),
                                          curve: Curves.easeIn);
                                      searchtrack = true;
                                    });
                                  },
                                  child: Image.asset(
                                    "assets/images/search.png",
                                  )),
                            )
                          ],
                        )
                      : Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: TextField(
                              decoration: InputDecoration(
                                  hintText: "Search Member",
                                  filled: true,
                                  fillColor: Colors.grey[300],
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.grey)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.grey))),
                            )),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 20),
                              child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      searchtrack = false;
                                    });
                                  },
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                            )
                          ],
                        ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              isfollow.add(false);
              return ListTile(
                  leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage("assets/images/listimage.png"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  title: const Text("Yashika"),
                  subtitle: const Text("29,India"),
                  trailing: InkWell(
                    onTap: () {
                      setState(() {
                        if (isfollow[index] != true) {
                          isfollow[index] = true;
                        } else {
                          isfollow[index] = false;
                        }
                      });
                    },
                    child: Container(
                      height: 35,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(17)),
                      child: Center(
                          child: Text(
                        isfollow[index] != true ? "Add" : "Following",
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                    ),
                  ));
            }),
          )
        ],
      ),
    ));
  }
}
