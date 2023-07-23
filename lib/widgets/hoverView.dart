import 'package:blur/blur.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Widget HoverView(BuildContext context) {

  var media = MediaQuery.of(context).size;

  return Container(
    height: 130,
    padding: const EdgeInsets.only(top: 75, left: 25, right: 25),
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 0.5, color: Color(0xFF232323)),
      ),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "mumbai metro",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.white,
                letterSpacing: -1
              ),
            ),
            SizedBox(
              width: 37,
              height: 37,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  showMaterialModalBottomSheet(
                      expand: false,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) => Container(
                        padding: const EdgeInsets.only(bottom: 50),
                        height: media.height-70,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF151515),
                          shape: SmoothRectangleBorder(
                            borderRadius: SmoothBorderRadius(
                              cornerRadius: 20,
                              cornerSmoothing: 0.9,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(width: 10),
                                CupertinoButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    padding: const EdgeInsets.all(17),
                                    child: const Icon(CupertinoIcons.multiply_circle_fill, color: Color(0xFF333333), size: 30,))
                              ],
                            ),
                            Center(
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.grey.withOpacity(0.1),
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(1, 10),
                                        spreadRadius: 5,
                                        blurRadius: 38,
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                      )
                                    ]
                                ),
                                child: Center(
                                  child: Text("AJ",
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.4),
                                      fontSize: 26,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF222222),
                                    shape: SmoothRectangleBorder(
                                      borderRadius: SmoothBorderRadius(
                                        cornerRadius: 6,
                                        cornerSmoothing: 0.9,
                                      ),
                                    ),
                                  ),
                                  child: Text('Welcome',
                                    style: GoogleFonts.michroma(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Expanded(child: SizedBox(width: 10)),
                            Container(
                                padding: const EdgeInsets.only(left: 17, right: 20),
                                height: 50,
                                width: media.width - 30,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF222222),
                                  shape: SmoothRectangleBorder(
                                    borderRadius: SmoothBorderRadius(
                                      cornerRadius: 10,
                                      cornerSmoothing: 0.9,
                                    ),
                                  ),
                                ),
                                child: CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Reset Password",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: -1,
                                            fontSize: 17,
                                            color: Color(0xFF666666)
                                        ),
                                      ),
                                      Icon(CupertinoIcons.pencil_ellipsis_rectangle, size: 20, color: Color(0xFF666666),),
                                    ],
                                  ),
                                )
                            ),
                            const SizedBox(height: 12),
                            Container(
                                padding: const EdgeInsets.only(left: 17, right: 20),
                                height: 50,
                                width: media.width - 30,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF222222),
                                  shape: SmoothRectangleBorder(
                                    borderRadius: SmoothBorderRadius(
                                      cornerRadius: 10,
                                      cornerSmoothing: 0.9,
                                    ),
                                  ),
                                ),
                                child: CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(CupertinoIcons.arrow_left_circle, size: 25, color: Color(0xFFFF6060),),
                                      Text("Sign Out",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: -1,
                                            fontSize: 17,
                                            color: Color(0xFFFF6060)
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          ],
                        ),
                      )
                  );
                },
                child: Container(
                  child: const Icon(CupertinoIcons.info_circle),
                ),
              ),
            )
          ],
        )
      ],
    ),
  ).frosted(
      blur: 10,
      frostColor: const Color(0xFF101010),
      frostOpacity: 0.4
  );
}