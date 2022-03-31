import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerVehicle extends StatelessWidget {
  const ShimmerVehicle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      child: ListView.builder(
        itemBuilder: (_, index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Shimmer.fromColors(
              baseColor: Color(0xFFEFEFEF),
              highlightColor: Color(0xFFE0E0E0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(color: Colors.white, height: 18, width: MediaQuery.of(context).size.width * .20),
                            SizedBox(height: 3),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              color: Colors.white,
                              height: 18,
                              width: MediaQuery.of(context).size.width * .15,
                            ),
                          ],
                        ),
                        width: MediaQuery.of(context).size.width * .25,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          children: [
                            Container(color: Colors.white, height: 18, width: MediaQuery.of(context).size.width * .65),
                            SizedBox(height: 3),
                            Container(color: Colors.white, height: 18, width: MediaQuery.of(context).size.width * .65),
                            SizedBox(height: 3),
                            Container(color: Colors.white, height: 18, width: MediaQuery.of(context).size.width * .65),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: 10,
        shrinkWrap: true,
      ),
    );
  }
}
