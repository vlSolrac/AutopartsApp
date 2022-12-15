import 'package:flutter/material.dart';

class GetStartHeader extends StatelessWidget {
  const GetStartHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Autoparts",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: size.width * 0.08),
            ),
            SizedBox(height: size.height * 0.01),
            SizedBox(
              width: size.width * 0.7,
              child: Text(
                "Crea y manten el control de tu carro, de cada reparacion que le hagas o le hagan en un taller, como un diario de reparaciones.",
                style: TextStyle(fontSize: size.width * 0.04),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
