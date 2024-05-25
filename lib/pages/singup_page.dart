import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/singup_controller.dart';

import '../widgets/logo.dart';
import '../widgets/cust_btn.dart';

class SingupPage extends GetView<SingupController> {
  const SingupPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SingupController());
    return Scaffold(
      body: controller.obx(
        (state) => Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Logo(),
                  const SizedBox(height: 30),
                  Text(
                    "အကောင့်သစ်ဖွင့်ခြင်း",
                    style: Get.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "အကောင့်သစ်ဖွင့်ခြင်း နှင့် ငွေသွင်း/ထုတ် ပြုလုပ်ခြင်းအတွက် အောက်ပါ ဗိုက်ဗာနှင့် တယ်လီဂရမ် အကောင့်များမှတဆင့် လုပ်ဆောင်နိုင်ပါသည်",
                    style: Get.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    runSpacing: 8,
                    spacing: 8,
                    children: [
                      CustBtn(
                        onPressed: () async {
                          launchUrl(
                            Uri.parse(
                                state?.viberUrl ?? 'https://www.google.com'),
                            mode: LaunchMode.externalApplication,
                          );
                        },
                        borderColor: Colors.deepPurple,
                        foregroundColor: Colors.deepPurple,
                        text: "Viber",
                      ),
                      CustBtn(
                        onPressed: () {
                          launchUrl(
                            Uri.parse(
                                state?.teletUrl ?? 'https://www.google.com'),
                            mode: LaunchMode.externalApplication,
                          );
                        },
                        borderColor: Colors.lightBlueAccent,
                        foregroundColor: Colors.lightBlueAccent,
                        text: "Telegram",
                      ),
                      CustBtn(
                        onPressed: () {
                          launchUrl(
                            Uri.parse(
                                state?.messenger ?? 'https://www.google.com'),
                            mode: LaunchMode.externalApplication,
                          );
                        },
                        foregroundColor: Colors.blue,
                        borderColor: Colors.blue,
                        text: "Messenger",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
