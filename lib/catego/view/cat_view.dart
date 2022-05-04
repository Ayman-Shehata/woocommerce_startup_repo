import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:woo_template/catego/model/catego.dart';

Future<List<Catego>> fetchData() async {
  final response = await http.get(Uri.parse(
      'http://shop.absobject.com/wp-json/wc/v2/products/categories?consumer_key=ck_fec37ac0d172a010c7b6a0e988d96af4b2d931bc&consumer_secret=cs_f7b532e73aec482b2378a20f818f05684a0e3242'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Catego.fromJson(data)).toList();
  } else {
    throw Exception("Exception");
  }
}
// ---------------------------

class CatView extends StatefulWidget {
  const CatView({Key? key}) : super(key: key);

  @override
  State<CatView> createState() => _CatViewState();
}

class _CatViewState extends State<CatView> {
  late Future<List<Catego>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Categories",
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: FutureBuilder<List<Catego>>(
                future: futureData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Catego>? data2 = snapshot.data;
                    return GridView.builder(
                      padding: const EdgeInsets.all(10),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 2 / 3,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemCount: data2!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GridTile(
                          key: ValueKey(data2[index].id),
                          child: GestureDetector(
                              onTap: () {},
                              child: Image.network(
                                data2[index].image!.src.toString(),
                                fit: BoxFit.cover,
                              )),
                          footer: GridTileBar(
                            backgroundColor: Colors.black54,
                            title: Text(
                              data2[index].name.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                // item counter
                                setState(() {
                                  //shoppingItems += 1;
                                });
                                //toast
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: Colors.black,
                                  elevation: 12,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  content: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        data2[index].name.toString() +
                                            ' أضيف للسلة بنجاح',
                                        style: const TextStyle(
                                            fontSize: 18, fontFamily: 'Cairo'),
                                      ),
                                      const Icon(
                                        Icons.check_circle_outlined,
                                        color: Colors.green,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                ));
                              },
                              child: const Icon(Icons.add_shopping_cart),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
