import 'package:expansion_panel_widget/panel_option_nav.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:ExpansionPanelPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ExpansionPanelItem> _expansionPanelItems = [
    ExpansionPanelItem(
      headerText: 'Panel 1',
      body: 'Content for Panel 1',
    ),
    ExpansionPanelItem(
      headerText: 'Panel 2',
      body: 'Content for Panel 2',
    ),
    // Add more ExpansionPanelItem objects as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expansion Panel Example'),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _expansionPanelItems[index].isExpanded = !isExpanded;
            });
          },
          children: _expansionPanelItems.map((item) {
            return ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    item.headerText,
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                );
              },
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(item.body),
              ),
              isExpanded: item.isExpanded,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ExpansionPanelItem {
  String headerText;
  String body;
  bool isExpanded;

  ExpansionPanelItem({required this.headerText, required this.body, this.isExpanded = false});
}
