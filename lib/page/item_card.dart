import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String name;
  final String arabic;
  final String latin;
  final String terjemahan;
  const ItemCard(
      {Key? key,
      required this.name,
      required this.arabic,
      required this.latin,
      required this.terjemahan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blue)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(name),
              ),
              Text(arabic),
              Text(latin),
              Text(terjemahan),
            ],
          ),
        ],
      ),
    );
  }
}
