import 'package:blur/blur.dart';
import 'package:commutix/widgets/hoverView.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const TextStyle CBStyle = TextStyle(
  color: Color(0xFF666666),
  fontWeight: FontWeight.w500,
  letterSpacing: -0.6,
);

const TextStyle CBStyleSelected = TextStyle(
  // color: Color(0xFF78FF9E),
  color: Color(0xFFFFFFFF),
  fontWeight: FontWeight.w500,
  letterSpacing: -0.6,
);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

late StateSetter internalSetter;
final PageController pageController = PageController();
dynamic superState = 0;

  Widget SuperController() {
  return Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    child: StatefulBuilder(
      builder: (context, StateSetter setSuperContollerState) {
        internalSetter = setSuperContollerState;
        return Container(
          height: 98,
          padding: const EdgeInsets.only(top: 0, left: 30, right: 30),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 0.5, color: Color(0xFF232323)),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5)),
                          color: superState == 0 ? const Color(0xFF2094EF) : Colors.transparent,

                        ),
                        width: 60,
                        height: 3,
                      ),
                      CupertinoButton(
                        onPressed: () {
                          pageController.animateToPage(0, duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);

                          setSuperContollerState(() {
                            superState = 0;
                          });
                        },
                        padding: EdgeInsets.zero,
                        child: Text("Travel", style: superState == 0 ? CBStyleSelected : CBStyle),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5)),
                          color: superState == 1 ? const Color(0xFF2094EF) : Colors.transparent,

                        ),
                        width: 60,
                        height: 3,
                      ),
                      CupertinoButton(
                        onPressed: () {
                          pageController.animateToPage(1, duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);

                          setSuperContollerState(() {
                            superState = 1;
                          });
                        },
                        padding: EdgeInsets.zero,
                        child: Text("Map", style: superState == 1 ? CBStyleSelected : CBStyle),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5)),
                          color: superState == 2 ? const Color(0xFF2094EF) : Colors.transparent,

                        ),
                        width: 60,
                        height: 3,
                      ),
                      CupertinoButton(
                        onPressed: () {
                          pageController.animateToPage(2, duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);

                          setSuperContollerState(() {
                            superState = 2;
                          });
                        },
                        padding: EdgeInsets.zero,
                        child: Container(
                          child: Icon(CupertinoIcons.cube_box_fill, color: superState == 2 ? const Color(0xFFFFFFFF) : const Color(0xFF666666)),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ).frosted(
            blur: 20,
            frostColor: const Color(0xFF101010),
            frostOpacity: 0.4
        );
      },
    ),
  );
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            PageView(
              physics: const BouncingScrollPhysics(),
              onPageChanged: (e) {
                internalSetter(() {
                  superState = e;
                });
              },
              controller: pageController,

              children: [
                Container(
                  margin: const EdgeInsets.only(top: 150),
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      _titleTextWithLink("Existing Routes", "See All"),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              height: 140,
                              width: MediaQuery.of(context).size.width/2-30,
                              decoration: ShapeDecoration(
                                  shape: SmoothRectangleBorder(
                                    borderRadius: SmoothBorderRadius(
                                      cornerRadius: 20,
                                      cornerSmoothing: 0.9,
                                    ),
                                  ),
                                  image: const DecorationImage(
                                      image: AssetImage("lib/assets/line1.png"),
                                      fit: BoxFit.fill
                                  )
                              ),
                              child: Column(
                                children: [
                                  const Expanded(child: SizedBox(width: 10)),
                                  Container(
                                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                                    width: MediaQuery.of(context).size.width/2-20,
                                    child: const Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Line 1",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: -1
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text("Ghatkopar → Versova",
                                          style: TextStyle(
                                              color: Colors.white24,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: -1
                                          ),
                                        )
                                      ],
                                    ),
                                  ).frosted(
                                      blur: 4,
                                      frostColor: Colors.black,
                                      frostOpacity: 1/10000000
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              height: 140,
                              width: MediaQuery.of(context).size.width/2-30,
                              decoration: ShapeDecoration(
                                  shape: SmoothRectangleBorder(
                                    borderRadius: SmoothBorderRadius(
                                      cornerRadius: 20,
                                      cornerSmoothing: 0.9,
                                    ),
                                  ),
                                  image: const DecorationImage(
                                      image: AssetImage("lib/assets/line2a.png"),
                                      fit: BoxFit.fill
                                  )
                              ),
                              child: Column(
                                children: [
                                  const Expanded(child: SizedBox(width: 10)),
                                  Container(
                                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                                    width: MediaQuery.of(context).size.width/2-20,
                                    child: const Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Line 2A",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: -1
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text("Anand Nagar → DN Nagar",
                                          style: TextStyle(
                                              color: Colors.white24,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: -1
                                          ),
                                        )
                                      ],
                                    ),
                                  ).frosted(
                                      blur: 4,
                                      frostColor: Colors.black,
                                      frostOpacity: 1/10000000
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),
                      _titleText("Fare Calculator"),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        width: MediaQuery.of(context).size.width,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF222222),
                          shape: SmoothRectangleBorder(
                            borderRadius: SmoothBorderRadius(
                              cornerRadius: 20,
                              cornerSmoothing: 0.9,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(CupertinoIcons.exclamationmark_triangle, color: Colors.grey, size: 15,),
                                SizedBox(width: 4),
                                Flexible(
                                  child: Text("Note: All fares and prices are calculated over a particular conversion rate and might vary slightly at times.",
                                    style: TextStyle(
                                      overflow: TextOverflow.visible,
                                      color: Colors.grey,
                                      fontSize: 12
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Departure",
                                  style: TextStyle(
                                    fontSize: 17,
                                    letterSpacing: -1,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  child: CupertinoButton(
                                    color: const Color(0xFF333333),
                                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                    onPressed: () {},
                                    child: const Row(
                                      children: [
                                        Text("Ghatkopar", style: TextStyle(fontSize: 15),),
                                        SizedBox(width: 4),
                                        Icon(CupertinoIcons.chevron_down, size: 15,)
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 13),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Arrival",
                                  style: TextStyle(
                                      fontSize: 17,
                                      letterSpacing: -1,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  child: CupertinoButton(
                                    color: const Color(0xFF333333),
                                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                    onPressed: () {},
                                    child: const Row(
                                      children: [
                                        Text("Versova", style: TextStyle(fontSize: 15),),
                                        SizedBox(width: 4),
                                        Icon(CupertinoIcons.chevron_down, size: 15,)
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 13),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Return Journey",
                                  style: TextStyle(
                                      fontSize: 17,
                                      letterSpacing: -1,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                                CupertinoSwitch(
                                  onChanged: (x) {},
                                  value: true,
                                )
                              ],
                            )
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),
                      _titleText("Emergency Contacts"),
                    ],
                  ),
                )
              ],

            ),
            HoverView(context),
            SuperController()
          ],
        ),
      ),
    );
  }

  _titleText(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 22,
            letterSpacing: -1
          ),
        ),
      ],
    );
  }

  _titleTextWithLink(String title, String linkText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 22,
              letterSpacing: -1
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            linkText,
            style: const TextStyle(
              color: Color(0xFF0090FF),
              fontWeight: FontWeight.w600,
              letterSpacing: -1,
              fontSize: 17
            ),
          ),
        )
      ],
    );
  }
}
