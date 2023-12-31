import 'dart:ui';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slide_action/slide_action.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';
import 'package:scanscape/screens/camera.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: Container(
        margin: EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 40),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Scanscape", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700, letterSpacing: -1),),
                  SizedBox(
                    width: 22,
                    child: CupertinoButton(
                      child: Icon(CupertinoIcons.info_circle, color: Colors.blueAccent, size: 24,),
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width-45,
              height: 150,
              decoration: ShapeDecoration(
                  shape: SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: 20,
                      cornerSmoothing: 0.8,
                    ),
                  ),
                image: DecorationImage(
                  image: AssetImage("lib/assets/home_display.png"),
                  fit: BoxFit.cover
                )
              ),
            ),
            Expanded(child: SizedBox(height: 1)),
            // _selectedImage != null ? Image.file(_selectedImage!) : const Text("select an image"),
            SlideAction(
              trackHeight: 62,
                trackBuilder: (context, state) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xFF47D982),
                      border: Border.all(color: Colors.grey.withOpacity(0.3))
                    ),
                    child: Center(
                      child: Text(
                        // Show loading if async operation is being performed
                        state.isPerformingAction ? "Loading..." : "Slide to access camera",
                        style: TextStyle(
                          color: Color(0xFF111111),
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.5,
                          fontSize: 17
                        ),
                      ),
                    ),
                  );
                },
                thumbBuilder: (context, state) {
                  return Container(
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Center(
                      // Show loading indicator if async operation is being performed
                      child: state.isPerformingAction
                          ? const CupertinoActivityIndicator(
                        color: Colors.white,
                      )
                          : const Row(
                        children: [
                          SizedBox(width: 15,),
                          SizedBox(
                            width: 10,
                            child: Icon(
                              CupertinoIcons.chevron_right,
                              size: 22,
                              color: Color(0xFF111111),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                            child: Icon(
                              CupertinoIcons.chevron_right,
                              size: 22,
                              color: Color(0xFF111111),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                action: () {},
            ),
          ],
        ),
      )
    );
  }

  // Future _selectImageFromPhotos() async {
  //   final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
  //
  //   setState(() {
  //     _selectedImage = File(returnedImage!.path);
  //   });
  // }

  _getCameras() async {
    final cameras = await availableCameras();
  }
}
