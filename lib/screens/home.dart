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
                        width: 80,
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
                        child: Text("Your Feed", style: superState == 0 ? CBStyleSelected : CBStyle),
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
                        width: 75,
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
                        child: Text("Discover", style: superState == 1 ? CBStyleSelected : CBStyle),
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
                        width: 34,
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
                      Row(
                        children: [
                          Container(
                            decoration: ShapeDecoration(
                              shape: SmoothRectangleBorder(
                                borderRadius: SmoothBorderRadius(
                                  cornerRadius: 10,
                                  cornerSmoothing: 0.9,
                                ),
                              ),
                              image: const DecorationImage(
                                image: AssetImage("lib/line1.png")
                              )
                            ),
                          )
                        ],
                      )
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
