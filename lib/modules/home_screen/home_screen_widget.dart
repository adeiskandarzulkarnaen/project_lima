import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../configs/apps_routes.dart';
import '../../models/user.dart';

class HeaderWidget extends StatelessWidget {
  final User user;

  const HeaderWidget({ super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Hi, Selamat datang"),
            Text(
              user.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(
            user.profilePhoto!,
          ),
        ),
      ],
    );
  }
}


class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: "Masukan kata kunci disini",
        isDense: true,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16) 
        ),
        suffixIcon: const Icon(Icons.search_rounded),
      ),
    );
  }
}


class SectionTitle extends StatelessWidget {
  final String lable;

  const SectionTitle({ super.key, required this.lable });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          lable,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const Icon(
          Icons.chevron_right_rounded,
        ),
      ],
    );
  }
}   


class HotesNewsCard extends StatelessWidget {
  final Size size;
  final String pictureUrl;
  final String newsTitle;

  const HotesNewsCard({
    super.key,
    required this.size,
    required this.pictureUrl,
    required this.newsTitle,
  });


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect( // u kasih border gambar internet
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              pictureUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 50,
            width: size.width - 32,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: Text(
            newsTitle,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black, 
            ),
          ),
        ),
      ],
    );
  }
}


class LatesNewsCard extends StatelessWidget {
  const LatesNewsCard({
    super.key,
    required this.size,
    required this.i,
  });

  final Size size;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                spreadRadius: 1,
                color: Colors.black12,
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              GoRouter.of(context).goNamed(
                AppRoutes.newsDetail,
                params: {
                  "id": i.toString(),
                }
              );
            },
            child: Row(
              children: [
                SizedBox(
                  width: size.width * 0.25,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Image.network(
                        "https://picsum.photos/200"
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${i + 1} Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac consequat eros. Donec vitae orci eu risus maximus facilisis.",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
      ],
    );
  }
}


class LatesNewsIndexCardSection extends StatelessWidget {
  const LatesNewsIndexCardSection({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   color: Colors.red,
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(
        height: 300,
      ),
      child: Column(
        children: [
          for (int i = 0; i < 2; i++)
            LatesNewsCard(size: size, i: i),
        ],
      ),
    );
  }
}
