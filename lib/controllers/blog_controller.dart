import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:chaleno/chaleno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mnine/models/blog_model.dart';
import 'package:mnine/pages/singup_page.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import '../network/api_exception.dart';

class BlogController extends GetxController with StateMixin<List<BlogModel>> {
  int _counter = 0;
  late TutorialCoachMark tutorialCoachMark;
  GlobalKey keyBottomNavigation1 = GlobalKey();
  Timer? _timer;
  @override
  void onInit() {
    super.onInit();
    createTutorial();
    getData();
  }

  void createTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      targets: _createTargets(),
      colorShadow: Colors.white10,
      textSkip: "SKIP",
      paddingFocus: 10,
      opacityShadow: 0.5,
      imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      onFinish: () {},
      onClickTarget: (target) {},
      onClickTargetWithTapPosition: (target, tapDetails) {},
      onClickOverlay: (target) {},
      onSkip: () {
        return true;
      },
    );
  }

  void showTutorial(BuildContext context) {
    tutorialCoachMark.show(context: context);
  }

  List<TargetFocus> _createTargets() {
    List<TargetFocus> targets = [];
    targets.add(
      TargetFocus(
        identify: "keyBottomNavigation1",
        keyTarget: keyBottomNavigation1,
        alignSkip: Alignment.topRight,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Tap here to refresh page",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "အကောင့်သစ်ဖွင့်ရန် ဒီနေရာကို ၃ ချက်နှိပ်ပါ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
    return targets;
  }

  void tapRefresh() {
    _counter++;

    if ((_timer?.isActive ?? false) && _counter > 2) {
      Get.to(() => const SingupPage(),
          transition: Transition.upToDown,
          duration: const Duration(milliseconds: 1000));
    } else if ((_timer?.isActive ?? false) && _counter < 2) {
      _counter++;
      return;
    } else {
      _counter = 0;
    }

    _timer = Timer(const Duration(milliseconds: 500), () {
      _counter > 2 ? null : getData();
    });
  }

  void getData() async {
    try {
      change(null, status: RxStatus.loading());
      var parser = await Chaleno()
          .load('https://m9-shankoemee.blogspot.com/2024/05/api.html');
      Result results = parser!.getElementById('post-body-4838342441007194872');
      var js = jsonDecode(results.text!.trim());
      List<BlogModel> model =
          (js as List).map((e) => BlogModel.fromJson(e)).toList();

      change(model, status: RxStatus.success());
    } on ApiException catch (e) {
      change(null, status: RxStatus.error(e.message));
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
