import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
              extended: isExpanded,
              backgroundColor: Colors.grey,
              unselectedIconTheme:
                  IconThemeData(color: Colors.white, opacity: 1),
              unselectedLabelTextStyle: TextStyle(
                color: Colors.white,
              ),
              selectedIconTheme: IconThemeData(color: Colors.white70),
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text("Dashboard"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.article),
                  label: Text("Ticket Management"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.report),
                  label: Text("Reports"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person),
                  label: Text("Profile"),
                ),
              ],
              selectedIndex: 0),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(60.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          icon: Icon(Icons.menu),
                        ),
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              "data:image/png;base64,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"),
                          radius: 26.0,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.article,
                                        size: 26.0,
                                      ),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Text(
                                        "Tickets",
                                        style: (TextStyle(
                                            fontSize: 26.0,
                                            fontWeight: FontWeight.bold)),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    "180 Tickets",
                                    style: TextStyle(
                                        fontSize: 26.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.article,
                                        size: 26.0,
                                      ),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Text(
                                        "Pending Tickets",
                                        style: (TextStyle(
                                            fontSize: 26.0,
                                            fontWeight: FontWeight.bold)),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Text(
                                    "20 Tickets",
                                    style: TextStyle(
                                        fontSize: 26.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.article,
                                        size: 26.0,
                                      ),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Text(
                                        "Approved Tickets",
                                        style: (TextStyle(
                                            fontSize: 26.0,
                                            fontWeight: FontWeight.bold)),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Text(
                                    "30 Tickets",
                                    style: TextStyle(
                                        fontSize: 26.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.article,
                                        size: 26.0,
                                      ),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Text(
                                        "Updated Tickets",
                                        style: (TextStyle(
                                            fontSize: 26.0,
                                            fontWeight: FontWeight.bold)),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Text(
                                    "40 Tickets",
                                    style: TextStyle(
                                        fontSize: 26.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 300.0,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search Ticket",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.redAccent.shade200,
                          ),
                          label: Text(
                            "View All Tickets",
                            style: TextStyle(color: Colors.redAccent.shade200),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        DataTable(
                            headingRowColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.grey.shade200),
                            columns: [
                              DataColumn(label: Text("ID")),
                              DataColumn(label: Text("Status")),
                              DataColumn(label: Text("Description")),
                              DataColumn(label: Text("Asignee")),
                            ],
                            rows: [
                              DataRow(cells: [
                                DataCell(Text("0001")),
                                DataCell(Text("Pending")),
                                DataCell(Text("Aged Ticket")),
                                DataCell(Text("HR Ruby Mutya")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text("0002")),
                                DataCell(Text("Approved")),
                                DataCell(Text("New Ticket")),
                                DataCell(Text("HR Ruby Mutya")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text("0003")),
                                DataCell(Text("Pending")),
                                DataCell(Text("Aged Ticket")),
                                DataCell(Text("HR Ruby Mutya")),
                              ]),
                            ]),
                        SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "1",
                                style:
                                    TextStyle(color: Colors.redAccent.shade200),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "2",
                                style:
                                    TextStyle(color: Colors.redAccent.shade200),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "3",
                                style:
                                    TextStyle(color: Colors.redAccent.shade200),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "See All",
                                style:
                                    TextStyle(color: Colors.redAccent.shade200),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.white60,
      ),
    );
  }
}
