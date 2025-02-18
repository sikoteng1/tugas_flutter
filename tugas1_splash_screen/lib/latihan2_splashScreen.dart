import 'package:flutter/material.dart';


class latihan2 extends StatelessWidget {
  const latihan2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[900],
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 240,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://t2.genius.com/unsafe/425x425/https%3A%2F%2Fimages.genius.com%2F59b5cdbd188ffaa769226d86548ca611.1000x1000x1.png',
                  width: 300,
                  height: 200,
                ),
                const Text(
                  "OIIA OIIA (Spinning Cat) \nOiiai, oiiai, oiiai, oii,Oiiai, oiia, oiiai, oii", textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
