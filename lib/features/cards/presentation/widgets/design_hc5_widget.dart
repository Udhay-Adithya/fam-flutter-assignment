import 'package:flutter/material.dart';
import '../../data/models/hc_group_model.dart';

class DesignHC5Widget extends StatelessWidget {
  final HcGroup hcGroup;

  const DesignHC5Widget({super.key, required this.hcGroup});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Set the height of the parent container
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hcGroup.cards.length,
        itemBuilder: (context, index) {
          final card = hcGroup.cards[index];
          return Container(
            height: 150,
            width: MediaQuery.of(context).size.width - 10,
            margin: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              image: DecorationImage(
                image: NetworkImage(
                  card.bgImage?.imageUrl ?? "",
                  scale: 1,
                ),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
