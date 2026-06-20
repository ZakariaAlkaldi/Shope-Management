import 'package:flutter/material.dart';
import 'package:shope/generated/l10n.dart';

class PersonsPage extends StatefulWidget {
  const PersonsPage({super.key});

  @override
  State<PersonsPage> createState() => _PersonsPageState();
}

class _PersonsPageState extends State<PersonsPage> {
  Color mainColor = Color.fromARGB(255, 1, 27, 65);

  List operations = [];

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
        body: operations.isEmpty
            ? Center(
                child: Text(
                  "لم يتم اضافة عمليات",
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 133, 133, 133),
                  ),
                ),
              )
            : Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20,
                  children: [
                    Text(
                      "ادارة الدين",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                    ),
                  ],
                ),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color.fromARGB(255, 1, 27, 65),
          child: Icon(Icons.add, color: Colors.white, size: 25),
        ),
      ),
    );
  }
}
