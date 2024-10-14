import 'package:dominos_cloneapp/gobalScreen/custom_containerSection.dart';
import 'package:flutter/material.dart';

class OffersForYouSection extends StatelessWidget {
  const OffersForYouSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offers For You'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            containerSection(),
            containerSection(),
            containerSection(),
            containerSection(),
            containerSection(),
          ],
        ),
      ),
    );
  }
}
