import 'package:flutter/material.dart';
import 'package:shope/generated/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map visibility = {"sales": false, "purchases": false, "netIncome": false};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(S.of(context).title)),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 1, 27, 65),
                ),
                child: Text(
                  S.of(context).title,
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: Text("اللغة"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.mode),
                title: Text("الوضع"),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    Text(
                      "تفصيل هذا الشهر",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 1, 27, 65),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 1, 27, 65),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "المبيعات:",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "${visibility["sales"] ? "5000" : "*****"} ر.ي",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(child: Container()),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (visibility["sales"]) {
                                      visibility["sales"] = false;
                                    } else {
                                      visibility["sales"] = true;
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                "المشتريات:",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "${visibility["purchases"] ? "3000" : "*****"} ر.ي",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(child: Container()),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (visibility["purchases"]) {
                                      visibility["purchases"] = false;
                                    } else {
                                      visibility["purchases"] = true;
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                "صافي الدخل:",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "${visibility["netIncome"] ? "2000" : "*****"} ر.ي",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(child: Container()),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (visibility["netIncome"]) {
                                      visibility["netIncome"] = false;
                                    } else {
                                      visibility["netIncome"] = true;
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "incoming");
                    },
                    textColor: Color.fromARGB(255, 1, 27, 65),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 1, 27, 65),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(
                            Icons.monetization_on,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "الدخل",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "outcoming");
                    },
                    textColor: Color.fromARGB(255, 1, 27, 65),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 1, 27, 65),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(
                            Icons.arrow_circle_down_rounded,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "السحب",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "money");
                    },
                    textColor: Color.fromARGB(255, 1, 27, 65),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 1, 27, 65),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(
                            Icons.local_atm_rounded,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "الدين",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
