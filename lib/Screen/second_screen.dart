import 'package:flutter/material.dart';
import 'package:fundraiser/widget/tabbar.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/splash_image.jpeg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/Fundtool_image.png',
                        height: 31,
                      ),
                    ),
                    Image.asset(
                      'assets/icons/Notification.png',
                      height: 21,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Image.asset(
                          'assets/images/Invitationcode.png',
                          height: 200,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26)),
                          height: 60,
                          width: 380,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Create a Fundraiser',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    'Schedule a fundraiser for your group',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  side: const BorderSide(
                                    color: Color(0xff0050A0),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                  color: Color(0xff92CD01),
                                ),
                              )
                            ],
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Top Fundraisers',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 27,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'View All',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff1D6B94),
                              ),
                            ),
                          ],
                        ),
                        CustomTab(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
