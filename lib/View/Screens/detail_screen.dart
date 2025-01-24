import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final int index;
  final String categoryId;

  const DetailScreen({
    super.key,
    required this.index,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    var proProvider = Provider.of<ProProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Details",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: Provider.of<ProProvider>(context).fetchUsers(categoryId),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Error: ${snapshot.error}',
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  );
                } else if (snapshot.hasData) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 200,
                        viewportFraction: 0.8,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                        enlargeCenterPage: true,
                      ),
                      itemCount: proProvider
                          .categoryWiseModal!.docs[index].images.length,
                      itemBuilder: (context, mainIndex, realIndex) {
                        final data = proProvider
                            .categoryWiseModal!.docs[index].images[mainIndex];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            imageUrl: data.url,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      height: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  );
                }
              },
            ),
            FutureBuilder(
              future: Provider.of<ProProvider>(context).fetchUsers(categoryId),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Error: ${snapshot.error}',
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  );
                } else if (snapshot.hasData) {
                  final data = proProvider.categoryWiseModal!.docs[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.store.name.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        data.title,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Divider(
                        color: Colors.grey.shade400,
                        thickness: 1,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Explore more details about this category and its items. Swipe through the images above to view.",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15,),
                        Container(
                          height: 20,
                          width: 180,
                          margin: const EdgeInsets.only(bottom: 8),
                          color: Colors.grey,
                        ),
                        SizedBox(height: 7,),
                        Container(
                          height: 16,
                          width: 250,
                          margin: const EdgeInsets.only(bottom: 16),
                          color: Colors.grey,
                        ),
                        SizedBox(height: 7,),
                        Divider(
                          color: Colors.grey.shade400,
                          thickness: 1,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 14,
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 6),
                          color: Colors.grey,
                        ),
                        SizedBox(height: 7,),
                        Container(
                          height: 14,
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 6),
                          color: Colors.grey,
                        ),
                        SizedBox(height: 7,),
                        Container(
                          height: 14,
                          width: 200,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
