import 'package:flutter/material.dart';

class BodyAnimeTemplate extends StatefulWidget {
  final List animeList;
  const BodyAnimeTemplate({super.key, required this.animeList});

  @override
  State<BodyAnimeTemplate> createState() => _BodyAnimeTemplateState();
}

class _BodyAnimeTemplateState extends State<BodyAnimeTemplate> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.animeList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: 150,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 150,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        widget.animeList[index].node!.mainPicture!.medium,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.animeList[index].node!.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
