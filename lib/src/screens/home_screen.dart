import 'package:flutter/material.dart';
import 'package:recipe_app_ui_flutter/src/constants/colors.dart';
import 'package:recipe_app_ui_flutter/src/models/categories_recipe.dart';
import 'package:recipe_app_ui_flutter/src/models/recipe_model.dart';
import 'package:recipe_app_ui_flutter/src/screens/details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedItem = 0;
  int selectedPage = 0;
  List<IconData> icons = [
    Icons.home,
    Icons.bar_chart_rounded,
    Icons.favorite,
    Icons.person_outline_rounded
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: recipeAppBackground,
      body: SafeArea(
        child: Column(
          children: [
            headerParts(),
            const SizedBox(height: 30),
            mySearchField(),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular menus',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.green,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            popularMenuItems(),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(recipeItems.length, (index) {
                    final recipe = recipeItems[index];
                    return Padding(
                      padding: index == 0
                          ? const EdgeInsets.only(left: 20, right: 10)
                          : const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  DetailsScreen(recipeItems: recipe),
                            ),
                          );
                        },
                        child: Container(
                          height: 260,
                          width: MediaQuery.of(context).size.width / 2.45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: AssetImage(recipe.image),
                                  fit: BoxFit.cover)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: recipe.fav
                                        ? Colors.red
                                        : Colors.black45),
                                child: const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black45),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            recipe.name,
                                            maxLines: 1,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                height: 0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amberAccent,
                                              size: 18,
                                            ),
                                            Text(
                                              '${recipe.rate}',
                                              style: const TextStyle(
                                                  height: 0,
                                                  color: Colors.white),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      '1 Bowl (${recipe.weight}g)',
                                      style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 12,
                                          height: 0),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      '${recipe.calorie} Kkal | 25% AKL',
                                      style: const TextStyle(
                                          color: Colors.white70),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.green,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            categoryItems(),
            Padding(
                padding: const EdgeInsets.all(40),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://test.chm.edu.vn/wp-content/uploads/2017/08/1-500x500.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Luke Nguyen',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 14),
                        ),
                        Text(
                          'Expert Chef',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
      bottomSheet: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 1),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...List.generate(
              icons.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {});
                  selectedPage = index;
                },
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        icons[index],
                        color:
                            index == selectedPage ? Colors.green : Colors.grey,
                        size: 28,
                      ),
                      index == selectedPage
                          ? Container(
                              height: 3,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView categoryItems() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            recipeCategory.length,
            (index) => Padding(
              padding: index == 0
                  ? const EdgeInsets.only(left: 20, right: 20)
                  : const EdgeInsets.only(right: 20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 33,
                    backgroundColor: recipeCategory[index].color,
                    child: Image.asset(
                      recipeCategory[index].image,
                      height: 40,
                      width: 40,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    recipeCategory[index].name,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView popularMenuItems() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            menuItems.length,
            (index) => Padding(
              padding: const EdgeInsets.only(left: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedItem = index;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: selectedItem == index
                          ? [Colors.green, Colors.lightGreen]
                          : [Colors.white, Colors.white],
                    ),
                  ),
                  child: Text(
                    menuItems[index],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: selectedItem == index
                          ? FontWeight.bold
                          : FontWeight.w500,
                      color:
                          selectedItem == index ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding mySearchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35), color: searchBarColor),
        child: const TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black45,
              ),
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.black26),
              contentPadding: EdgeInsets.symmetric(vertical: 15)),
        ),
      ),
    );
  }

  Padding headerParts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const Text.rich(TextSpan(children: [
            TextSpan(
              text: "Hello Peter,\n",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            TextSpan(
              text: "What do you want to eat today?",
              style: TextStyle(fontSize: 13, color: Colors.black45),
            ),
          ])),
          const Spacer(),
          Stack(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    'https://play-lh.googleusercontent.com/3ha-TO-wWZA8IofnlU6tWsYJiBCYbqs8hvhB6BQnct1PgsYpAZhCPMKoYggHOX9z-1qM=w526-h296-rw'),
              ),
              Positioned(
                  right: 1,
                  top: 1,
                  child: Container(
                    width: 9,
                    height: 9,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white),
                        color: Colors.green),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
