import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridSearchScreen extends StatefulWidget {
  const GridSearchScreen({Key? key}) : super(key: key);

  @override
  State<GridSearchScreen> createState() => _GridSearchScreenState();
}

class _GridSearchScreenState extends State<GridSearchScreen> {

  List<String> itemsList = [
    'Arts',
    'Desin',
    'Entertainite',
    'tfgss',
    'kjhg',
    'jhhg',
    'poi',
    'ccdf',
    'nhg',
    'oiuy',
    'sdfgh',
    'zxcvbn',
    'vfdew',
    'qwerghj',
  ];

  List<String>? itemsListSearch;

  final FocusNode _textFocusNode = FocusNode();
  final TextEditingController? _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textFocusNode.dispose();
    _textEditingController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)
            ),
            child: Center(
              child: TextFormField(
                controller: _textEditingController,
                focusNode: _textFocusNode,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    prefix: Icon(Icons.search),
                    hintText: 'Search here',
                    border: InputBorder.none
                ),
                onChanged: (value) {
                  setState(() {
                    itemsListSearch = itemsList
                        .where((element) =>
                        element
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                    if (_textEditingController!.text.isNotEmpty &&
                        itemsListSearch!.isEmpty) {
                      print(
                          'itemsListSearch length ${itemsListSearch!.length}');
                    }
                  });
                },
              ),
            ),
          ),
        ),
        body:
        _textEditingController!.text.isNotEmpty && itemsListSearch!.isEmpty
            ? Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.search_off,
                    size: 160,
                  ),

                ),
                Padding(padding: EdgeInsets.all(8),
                  child: Text(
                    'No results found,\nPlease try different keyword',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                )
              ],
            ),
          ),
        )
            : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3,
              crossAxisSpacing: 12,
            ),
              itemCount: _textEditingController!.text.isNotEmpty
                  ? itemsListSearch!.length
                  : itemsList.length,
              itemBuilder: (context, index){
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 1),
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                        child: Icon(Icons.work_outline,
                            color: Colors.white)
                    ),
                    title: Text(_textEditingController!.text.isNotEmpty
                        ? itemsListSearch![index]
                        : itemsList[index]),
                  ),
                );
              }
            ));
  }
}
