import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shope/generated/l10n.dart';

class OutcomingPage extends StatefulWidget {
  const OutcomingPage({super.key});

  @override
  State<OutcomingPage> createState() => _OutcomingPageState();
}

class _OutcomingPageState extends State<OutcomingPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey<FormState> _editFormKey = GlobalKey();
  final TextEditingController _income = TextEditingController();

  Color mainColor = Color.fromARGB(255, 1, 27, 65);
  DateTime date = DateTime.now();

  List outcomeinglist = [
    {"title": "10000", "date": "2024-01-01"},
    {"title": "25000", "date": "2024-01-05"},
    {"title": "15000", "date": "2024-01-10"},
    {"title": "30000", "date": "2024-01-15"},
    {"title": "5000", "date": "2024-01-20"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: outcomeinglist.isEmpty
          ? Center(
              child: Text(
                "لم يتم اضافة سحب",
                style: TextStyle(
                  fontSize: 18,
                  color: const Color.fromARGB(255, 133, 133, 133),
                ),
              ),
            )
          : Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ادارة السحب",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 1, 27, 65),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: outcomeinglist.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: ListTile(
                              leading: Icon(Icons.arrow_downward, size: 30),
                              title: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  outcomeinglist[index]['title'],
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      228,
                                      23,
                                      9,
                                    ),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              subtitle: Text(
                                outcomeinglist[index]['date'],
                                style: TextStyle(fontSize: 16),
                              ),
                              trailing: SizedBox(
                                width: 100,
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        String editOutcome =
                                            outcomeinglist[index]['title'];
                                        String editDate =
                                            outcomeinglist[index]['date'];
                                        showDialog(
                                          animationStyle: AnimationStyle(
                                            duration: Duration(seconds: 1),
                                          ),
                                          context: context,
                                          builder: (context) => Dialog(
                                            child: Container(
                                              padding: EdgeInsets.all(20),
                                              child: Form(
                                                key: _editFormKey,
                                                child: Column(
                                                  spacing: 20,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "عدل على الدخل",
                                                      style: TextStyle(
                                                        color: mainColor,
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Row(
                                                      spacing: 10,
                                                      children: [
                                                        Expanded(
                                                          child: TextFormField(
                                                            initialValue:
                                                                editOutcome,
                                                            validator: (value) {
                                                              if (value ==
                                                                      null ||
                                                                  value
                                                                      .isEmpty) {
                                                                return "قم بادخال قمية السحب";
                                                              }
                                                              return null;
                                                            },
                                                            onChanged: (val) {
                                                              editOutcome = val;
                                                            },
                                                            cursorColor:
                                                                mainColor,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            inputFormatters: [
                                                              FilteringTextInputFormatter
                                                                  .digitsOnly,
                                                            ],
                                                            decoration: InputDecoration(
                                                              enabledBorder:
                                                                  OutlineInputBorder(
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
                                                              errorBorder: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      10,
                                                                    ),
                                                                borderSide: BorderSide(
                                                                  color: Colors
                                                                      .redAccent,
                                                                  width: 2,
                                                                ),
                                                              ),
                                                              label: Text(
                                                                "قيمة السحب",
                                                              ),
                                                              labelStyle:
                                                                  TextStyle(
                                                                    color:
                                                                        mainColor,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          "ر . ي",
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: mainColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                  10,
                                                                ),
                                                            decoration: BoxDecoration(
                                                              border: Border.all(
                                                                color:
                                                                    mainColor,
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    10,
                                                                  ),
                                                            ),
                                                            child: Text(
                                                              editDate,
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    mainColor,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        IconButton(
                                                          onPressed: () async {
                                                            DateTime? newDate =
                                                                await showDatePicker(
                                                                  context:
                                                                      context,
                                                                  initialDate:
                                                                      date,
                                                                  firstDate:
                                                                      DateTime(
                                                                        2025,
                                                                      ),
                                                                  lastDate:
                                                                      DateTime(
                                                                        2100,
                                                                      ),
                                                                );
                                                            if (newDate ==
                                                                null) {
                                                              return;
                                                            }

                                                            setState(() {
                                                              editDate =
                                                                  '${newDate.year}-${newDate.month}-${newDate.day}';
                                                            });
                                                          },
                                                          icon: Icon(
                                                            Icons.keyboard,
                                                          ),
                                                          color: mainColor,
                                                          iconSize: 30,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      spacing: 5,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.symmetric(
                                                                  vertical: 10,
                                                                ),
                                                            decoration:
                                                                BoxDecoration(
                                                                  color: Colors
                                                                      .green,
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        10,
                                                                      ),
                                                                ),
                                                            child: MaterialButton(
                                                              textColor:
                                                                  Colors.white,
                                                              onPressed: () {
                                                                if (_editFormKey
                                                                    .currentState!
                                                                    .validate()) {
                                                                  outcomeinglist[index]['title'] =
                                                                      editOutcome;
                                                                  outcomeinglist[index]['date'] =
                                                                      editDate;

                                                                  _income
                                                                      .clear();
                                                                  date =
                                                                      DateTime.now();
                                                                  setState(
                                                                    () {},
                                                                  );
                                                                  Navigator.pop(
                                                                    context,
                                                                  );
                                                                }
                                                              },
                                                              child: Text(
                                                                "تعديل",
                                                                style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.symmetric(
                                                                  vertical: 10,
                                                                ),
                                                            decoration:
                                                                BoxDecoration(
                                                                  color: Colors
                                                                      .redAccent,
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        10,
                                                                      ),
                                                                ),
                                                            child: MaterialButton(
                                                              textColor:
                                                                  Colors.white,
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                  context,
                                                                );
                                                                _income.clear();
                                                                date =
                                                                    DateTime.now();
                                                              },
                                                              child: Text(
                                                                "الغاء",
                                                                style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        size: 25,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        AwesomeDialog(
                                          context: context,
                                          dialogType: DialogType.warning,
                                          animType: AnimType.bottomSlide,
                                          title: 'مسح دخل',
                                          desc:
                                              'هل أنت متأكد من مسح هذا الدخل؟',
                                          btnOkText: 'الغاء',
                                          btnCancelText: 'مسح',
                                          btnOkOnPress: () {},
                                          btnCancelOnPress: () {
                                            setState(() {
                                              outcomeinglist.removeAt(index);
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
                                        size: 25,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              iconColor: const Color.fromARGB(255, 228, 23, 9),
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
            animationStyle: AnimationStyle(duration: Duration(seconds: 1)),
            context: context,
            builder: (context) => Dialog(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "اضافة سحب يومي جديد",
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        spacing: 10,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _income,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "قم بادخال قمية السحب";
                                }
                                return null;
                              },
                              cursorColor: mainColor,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: mainColor,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.redAccent,
                                    width: 2,
                                  ),
                                ),
                                label: Text("قيمة السحب"),
                                labelStyle: TextStyle(color: mainColor),
                              ),
                            ),
                          ),
                          Text(
                            "ر . ي",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: mainColor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: mainColor, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                '${date.year}-${date.month}-${date.day}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: mainColor,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: date,
                                firstDate: DateTime(2025),
                                lastDate: DateTime(2100),
                              );
                              if (newDate == null) return;

                              setState(() {
                                date = newDate;
                              });
                            },
                            icon: Icon(Icons.keyboard),
                            color: mainColor,
                            iconSize: 30,
                          ),
                        ],
                      ),
                      Row(
                        spacing: 5,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: MaterialButton(
                                textColor: Colors.white,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Map newIncome = {
                                      "title": '${_income.text} ر.ي',
                                      "date":
                                          '${date.year}-${date.month}-${date.day}',
                                    };

                                    outcomeinglist.add(newIncome);
                                    _income.clear();
                                    date = DateTime.now();
                                    setState(() {});
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text(
                                  "سحب",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: MaterialButton(
                                textColor: Colors.white,
                                onPressed: () {
                                  Navigator.pop(context);
                                  _income.clear();
                                  date = DateTime.now();
                                },
                                child: Text(
                                  "الغاء",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        backgroundColor: Color.fromARGB(255, 1, 27, 65),
        child: Icon(Icons.add, color: Colors.white, size: 25),
      ),
    );
  }
}
