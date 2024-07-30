import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Community extends StatelessWidget {
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Text(
              "Communities",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 10),
            Container(
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  const SizedBox(width: 15),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          CupertinoIcons.person_3_fill,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(21),
                        child: Container(
                          height: 18,
                          width: 18,
                          color: Colors.blue,
                          child: FloatingActionButton(
                            elevation: 0,
                            onPressed: () {},
                            child: const Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    "New Community",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              height: 185,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(maxRadius: 25),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "React Developer",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w900),
                            ),
                            Text(
                              "(7:30PM to 8:30Pm)",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(
                      indent: 15,
                      height: 0,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(maxRadius: 25),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Flutter online class",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w900),
                            ),
                            Text(
                              "(7:30PM to 8:30Pm)",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(
                      indent: 15,
                      height: 0,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          "See All",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                        Spacer(),
                        Icon(
                          CupertinoIcons.right_chevron,
                          color: Colors.grey,
                          size: 15,
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
