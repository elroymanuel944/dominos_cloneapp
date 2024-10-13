import 'package:flutter/material.dart';

class CravingSection extends StatelessWidget {
  final String imageurl;
  final String title;
  const CravingSection({
    required this.imageurl,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
        Container(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => OfferSectionViewPage(),
                  //     ));
                },
                child: CircleAvatar(
                  radius: 50,
                  child: CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.amber,
                      backgroundImage: NetworkImage(imageurl)),
                ),
              ),
              Text(title),
            ],
          ),
        ),
      ],
    );
  }
}
