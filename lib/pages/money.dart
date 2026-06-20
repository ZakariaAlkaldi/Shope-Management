import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shope/generated/l10n.dart';

class MoneyPage extends StatefulWidget {
  const MoneyPage({super.key});

  @override
  State<MoneyPage> createState() => _MoneyPageState();
}

class _MoneyPageState extends State<MoneyPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _name = TextEditingController();
  Color mainColor = Color.fromARGB(255, 1, 27, 65);

  List persons = [
    {'name': 'زكريا الكلدي', 'money': 10000},
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
        body: persons.isEmpty
            ? Center(
                child: Text(
                  "لم يتم اضافة أشخاص",
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
                    Expanded(
                      child: ListView.builder(
                        itemCount: persons.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              onTap: () {
                                Navigator.pushNamed(context, 'persons');
                              },
                              leading: Icon(Icons.person, size: 40),
                              title: Text(persons[index]['name']),
                              subtitle: Text(
                                '${persons[index]['money'].toString()} ر.ي',
                              ),
                              trailing: Container(
                                width: 100,
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        String nameEdited =
                                            persons[index]['name'];
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Dialog(
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                  20,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  spacing: 20,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      'قم بالتعديل على السجل',
                                                      style: TextStyle(
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: mainColor,
                                                      ),
                                                    ),
                                                    Form(
                                                      key: _formKey,
                                                      child: Column(
                                                        spacing: 15,
                                                        children: [
                                                          TextFormField(
                                                            initialValue:
                                                                nameEdited,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            cursorColor:
                                                                mainColor,
                                                            decoration: InputDecoration(
                                                              labelText:
                                                                  'أسم السجل',
                                                              labelStyle: TextStyle(
                                                                color:
                                                                    mainColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                              errorBorder: OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                      color: Colors
                                                                          .red,
                                                                      width: 2,
                                                                    ),
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      10,
                                                                    ),
                                                              ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                          width:
                                                                              2,
                                                                        ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                          10,
                                                                        ),
                                                                  ),
                                                              focusedBorder: OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                      color:
                                                                          mainColor,
                                                                      width: 2,
                                                                    ),
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      10,
                                                                    ),
                                                              ),
                                                            ),
                                                            validator: (value) {
                                                              if (value ==
                                                                      null ||
                                                                  value
                                                                      .isEmpty) {
                                                                return 'الرجاء ادخال اسم السجل!';
                                                              }
                                                              return null;
                                                            },
                                                            onChanged: (value) {
                                                              nameEdited =
                                                                  value;
                                                            },
                                                          ),
                                                          Row(
                                                            spacing: 5,
                                                            children: [
                                                              Expanded(
                                                                child: Container(
                                                                  padding:
                                                                      EdgeInsets.all(
                                                                        10,
                                                                      ),
                                                                  decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .green,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                          10,
                                                                        ),
                                                                  ),
                                                                  child: MaterialButton(
                                                                    textColor:
                                                                        Colors
                                                                            .white,
                                                                    onPressed: () {
                                                                      if (_formKey
                                                                          .currentState!
                                                                          .validate()) {
                                                                        persons[index]['name'] =
                                                                            nameEdited;
                                                                        setState(
                                                                          () {},
                                                                        );
                                                                        _name
                                                                            .clear();
                                                                        Navigator.pop(
                                                                          context,
                                                                        );
                                                                      }
                                                                    },
                                                                    child: Text(
                                                                      "تعديل",
                                                                      style: TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 100,
                                                                padding:
                                                                    EdgeInsets.all(
                                                                      10,
                                                                    ),
                                                                decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .red,
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        10,
                                                                      ),
                                                                ),
                                                                child: MaterialButton(
                                                                  textColor:
                                                                      Colors
                                                                          .white,
                                                                  onPressed: () {
                                                                    _name
                                                                        .clear();
                                                                    Navigator.pop(
                                                                      context,
                                                                    );
                                                                  },
                                                                  child: Text(
                                                                    "الغاء",
                                                                    style: TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
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
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        size: 30,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        AwesomeDialog(
                                          context: context,
                                          dialogType: DialogType.warning,
                                          animType: AnimType.bottomSlide,
                                          title: 'مسح سجل شخص',
                                          desc:
                                              'هل أنت متأكد من مسح سجل هذا الشخص؟',
                                          btnOkText: 'الغاء',
                                          btnCancelText: 'مسح',
                                          btnOkOnPress: () {},
                                          btnCancelOnPress: () {
                                            setState(() {
                                              persons.removeAt(index);
                                            });
                                          },
                                          titleTextStyle: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                              255,
                                              1,
                                              27,
                                              65,
                                            ),
                                          ),
                                          descTextStyle: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black87,
                                          ),
                                        ).show();
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        size: 30,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              iconColor: mainColor,
                              titleTextStyle: TextStyle(
                                color: mainColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              subtitleTextStyle: TextStyle(
                                color: Colors.green,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 20,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'قم باضافة سجل شخص جديد',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: mainColor,
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            spacing: 15,
                            children: [
                              TextFormField(
                                controller: _name,
                                keyboardType: TextInputType.text,
                                cursorColor: mainColor,
                                decoration: InputDecoration(
                                  labelText: 'أسم السجل',
                                  labelStyle: TextStyle(
                                    color: mainColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: mainColor,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'الرجاء ادخال اسم السجل!';
                                  }
                                  return null;
                                },
                              ),
                              Row(
                                spacing: 5,
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: MaterialButton(
                                        textColor: Colors.white,
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            persons.add({
                                              'name': _name.text,
                                              'money': 0,
                                            });
                                            setState(() {});
                                            _name.clear();
                                            Navigator.pop(context);
                                          }
                                        },
                                        child: Text(
                                          "اضافة",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: MaterialButton(
                                      textColor: Colors.white,
                                      onPressed: () {
                                        _name.clear();
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "الغاء",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
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
                );
              },
            );
          },
          backgroundColor: Color.fromARGB(255, 1, 27, 65),
          child: Icon(Icons.add, color: Colors.white, size: 25),
        ),
      ),
    );
  }
}
