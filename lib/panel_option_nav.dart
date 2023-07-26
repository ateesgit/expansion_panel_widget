import 'package:expansion_panel_widget/page.dart';
import 'package:flutter/material.dart';



class ExpansionPanelPage extends StatefulWidget {
  @override
  _ExpansionPanelPageState createState() => _ExpansionPanelPageState();
}

class _ExpansionPanelPageState extends State<ExpansionPanelPage> {
  List<ExpansionPanelItem> _expansionPanelItems = [
    ExpansionPanelItem(
      headerText: 'Panel 1',
      options: ['Option 1', 'Option 2', 'Option 3'],
      isExpanded: false,
    ),
    ExpansionPanelItem(
      headerText: 'Panel 2',
      options: ['Option A', 'Option B', 'Option C'],
      isExpanded: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expansion Panel with List'),
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
              body: ListView.builder(
                shrinkWrap: true,
                itemCount: item.options.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(item.options[index]),
                    onTap: () {
                      // Navigate to the selected option page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectedOptionPage(item.options[index]),
                        ),
                      );
                    },
                  );
                },
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
  List<String> options;
  bool isExpanded;

  ExpansionPanelItem({required this.headerText, required this.options, this.isExpanded = false});
}

