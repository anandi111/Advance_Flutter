import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sky_scrapper_1/globals/globals.dart';
import 'package:sky_scrapper_1/globals/globals1.dart';
import 'package:sky_scrapper_1/helpers/carrdatahelper.dart';
import 'package:sky_scrapper_1/models/carrdata.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int val1 = 0;
  int val2 = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.darkBackgroundGray,
      appBar: AppBar(
        title: const Text(
          "Currency Converter",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: CupertinoColors.darkBackgroundGray,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Text(
                "From",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Container(
                  height: 60,
                  width: 350,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color(0xff484858),
                      )),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      isExpanded: true,
                      value: val1,
                      items: allCurrencies
                          .map((e) => DropdownMenuItem(
                                value: allCurrencies.indexOf(e),
                                child: Text(
                                  e,
                                ),
                              ))
                          .toList(),
                      onChanged: (int? value) {
                        setState(() {
                          val1 = value!;
                        });
                      },
                      dropdownColor: const Color(0xff797993),
                      style: const TextStyle(color: Colors.white),
                      iconEnabledColor: Colors.blue,
                      icon: const Icon(Icons.pin_drop_outlined),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "To",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Container(
                  height: 60,
                  width: 350,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color(0xff484858),
                      )),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      isExpanded: true,
                      value: val2,
                      items: allCurrencies
                          .map((e) => DropdownMenuItem(
                                value: allCurrencies.indexOf(e),
                                child: Text(
                                  e,
                                ),
                              ))
                          .toList(),
                      onChanged: (int? value) {
                        setState(() {
                          val2 = value!;
                        });
                      },
                      dropdownColor: const Color(0xff797993),
                      style: const TextStyle(color: Colors.white),
                      iconEnabledColor: Colors.blue,
                      icon: const Icon(Icons.pin_drop_outlined),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              FutureBuilder(
                future: CarrAPIHelper.currAPIHelper
                    .fetchingUserData(From: currVal[val1], To: currVal[val2]),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "Error ==> ${snapshot.error}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    CurrData? data = snapshot.data as CurrData?;

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Result:",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 150,
                          width: 350,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              "1 ${currVal[val1]}",
                              style: const TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "=",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 150,
                          width: 350,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              "${data!.data} ${currVal[val2]}",
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          data.error,
                          style: const TextStyle(color: Colors.grey),
                        )
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
