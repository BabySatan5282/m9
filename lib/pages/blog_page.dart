import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mnine/controllers/blog_controller.dart';
import 'package:mnine/pages/blog_detail.dart';
import 'package:mnine/widgets/logo.dart';

class BlogPage extends GetView<BlogController> {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BlogController());
   controller.showTutorial(context);
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Logo(
            size: 50,
          ),
        ),
        title: const Text("M9 SKM Offical"),
      ),
      floatingActionButton: FloatingActionButton(
        key: controller.keyBottomNavigation1,
        backgroundColor: Colors.white38,
        foregroundColor: Colors.black,
        onPressed: () {
          controller.tapRefresh();
        },
        child: const Icon(CupertinoIcons.refresh),
      ),
      body: controller.obx(
        (state) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CarouselSlider.builder(
                itemCount: state!.length,
                itemBuilder: (_, __, i) {
                  return Container(
                    margin: const EdgeInsets.all(4),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade400,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                      clipBehavior: Clip.hardEdge,
                      child: Image.network(
                        state[__].image ?? "",
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  autoPlay: true,
                ),
              ),
              const SizedBox(height: 8),
              const Divider(),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: state.length,
                  itemBuilder: (_, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(4),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(15)),
                              width: Get.width * .4,
                              height: Get.width * .3,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(13),
                                clipBehavior: Clip.hardEdge,
                                child: Hero(
                                  tag: state[index].image!,
                                  child: Image.network(
                                    state[index].image ?? "",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state[index].title ?? '',
                                    style: Get.textTheme.titleMedium,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    state[index].content ?? '',
                                    style: Get.textTheme.bodySmall,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => BlogDetail(model: state[index]));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            width: double.infinity,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Read Full Article",
                              style: Get.textTheme.labelLarge,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
