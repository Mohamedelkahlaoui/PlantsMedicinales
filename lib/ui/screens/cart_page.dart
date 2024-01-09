import 'package:flutter/material.dart';
import 'package:plantesmedicinales/constants.dart';
import 'package:plantesmedicinales/models/plants.dart';
import 'package:plantesmedicinales/ui/screens/widgets/plant_widget.dart';

class CartPage extends StatefulWidget {
  final List<Plant> addToCartPlants;
  const CartPage({Key? key, required this.addToCartPlants}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double total =
        widget.addToCartPlants.fold(0, (sum, plant) => sum + plant.price);

    return Scaffold(
      body: widget.addToCartPlants.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset('assets/images/add-cart.png'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Your Cart is Empty',
                    style: TextStyle(
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
              height: size.height,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: widget.addToCartPlants.length,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return PlantWidget(
                              index: index, plantList: widget.addToCartPlants);
                        }),
                  ),
                  Column(
                    children: [
                      const Divider(
                        thickness: 1.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Totals',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            '\$$total',
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
