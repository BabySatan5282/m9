import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mnine/models/blog_model.dart';

class BlogDetail extends StatelessWidget {
  final BlogModel model;
  const BlogDetail({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.title ?? 'Details'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: Get.height * .3,
            width: double.infinity,
            child: Hero(
              tag: model.image!,
              child: Image.network(
                model.image ?? '',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(model.content ?? ''),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
