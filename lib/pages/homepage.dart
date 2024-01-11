// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habbittracker/pages/promoCard.dart';
import 'package:habbittracker/theme_provider.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
      ),
      drawer: Drawer(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        child: Center(
          child: CupertinoSwitch(
              value: Provider.of<ThemeProvider>(context).isDarkMode,
              onChanged: (value) =>
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme()),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Find Your",
                          style: TextStyle(fontSize: 24),
                        ),
                        Text(
                          "Inspiration",
                          style: TextStyle(
                              fontSize: 34, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                  hintText: "search what you are looking for",
                                  hintStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary)),
                            ))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Promo Today",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              PromoCard(image: "lib/assets/one.jpg"),
                              PromoCard(image: "lib/assets/two.jpg"),
                              PromoCard(image: "lib/assets/three.jpg"),
                              PromoCard(image: "lib/assets/four.jpg"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 180,
                          width: double.infinity,
                          child: PageView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                width: double.maxFinite,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage("lib/assets/three.jpg"),
                                      fit: BoxFit.cover),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomRight,
                                          stops: [
                                            0.1,
                                            0.9
                                          ],
                                          colors: [
                                            Colors.black.withOpacity(0.8),
                                            Colors.black.withOpacity(0.1)
                                          ])),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(
                                        "Best Design",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
