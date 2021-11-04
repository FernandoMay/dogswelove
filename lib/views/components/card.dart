import 'package:dogswelove/constants.dart';
import 'package:dogswelove/models/dog.dart';
import 'package:flutter/material.dart';

class DogCard extends StatefulWidget {
  final Dog? dog;

  const DogCard({Key? key, required this.dog}) : super(key: key);

  @override
  State<DogCard> createState() => _DogCardState();
}

class _DogCardState extends State<DogCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: 4.0,
        vertical: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: SizedBox(
              width: size.width * 0.36,
              height: size.height / 4,
              child: Image.network(
                widget.dog!.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 200,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
            ),
            padding: const EdgeInsets.only(
              bottom: 34.0,
              top: 18.0,
              left: 14.0,
              right: 8.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.dog!.dogName,
                  style: H2Black,
                ),
                const SizedBox(
                  height: 14.0,
                ),
                Text(
                  widget.dog!.description,
                  style: H3Black,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Almost " + widget.dog!.age.toString() + " years",
                  style: H4Black,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
