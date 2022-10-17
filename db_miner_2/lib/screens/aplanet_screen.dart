import 'package:db_miner_2/helpers/DbHelper.dart';
import 'package:db_miner_2/helpers/animal_api_helper.dart';
import 'package:db_miner_2/resources/reso.dart';
import 'package:db_miner_2/screens/detail_animal_screen.dart';
import 'package:flutter/material.dart';

class AplanetScreen extends StatefulWidget {
  const AplanetScreen({Key? key}) : super(key: key);

  @override
  State<AplanetScreen> createState() => _AplanetScreenState();
}

class _AplanetScreenState extends State<AplanetScreen> {
  Future getData = DBHelper.dbHelper.fetchAllData();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffc19e82),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.88,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(200),
                      bottomRight: Radius.circular(200)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          "assets/images/joao-costa-oKhcGwGcENQ-unsplash.jpg"))),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                              text: "aplanet\n",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .merge(TextStyle(color: Colors.white)),
                              children: [
                                TextSpan(
                                    text: "we love our planet.",
                                    style: Theme.of(context).textTheme.caption)
                              ]),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.menu),
                          color: Colors.white,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Welcome to\nNew Aplanet",
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .merge(const TextStyle(fontSize: 35)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.amber.withOpacity(0.5))),
                  label: Text(
                    "Enter Animal Name..",
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                onChanged: (val) {
                  setState(() {
                    getData = DBHelper.dbHelper.fetchSearchData(name: val);
                  });
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "- - - - - Quick Categories - - - - -",
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
                future: getData,
                builder: (context, snapshot) {
                  List<Map<String, Object?>>? data =
                      snapshot.data as List<Map<String, Object?>>?;
                  return Container(
                    width: 400,
                    height: 350,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: data!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () async {
                            List<Map<String, Object?>> passData =
                                await DBHelper.dbHelper.fetchSingleData(
                                    id: int.parse(
                                        data[index]["id"].toString()));

                            // print(passData[0]);

                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailAnimalScreen(
                                      name: data[index]["name"].toString(),
                                      photoString:
                                          data[index]["photoString"].toString(),
                                      data: passData),
                                ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    height: 280,
                                    width: 180,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(data[index]
                                                    ["photoString"]
                                                .toString()))),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  data[index]["name"].toString(),
                                  style: Theme.of(context).textTheme.caption,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
