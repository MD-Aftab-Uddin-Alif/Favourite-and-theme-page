import 'package:favourite_with_them/Favourite/favourite_provider.dart';
import 'package:favourite_with_them/Favourite/my_favourite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favourite_Screen extends StatefulWidget {
  const Favourite_Screen({Key? key}) : super(key: key);

  @override
  _Favourite_ScreenState createState() => _Favourite_ScreenState();
}

class _Favourite_ScreenState extends State<Favourite_Screen> {
  List<int> selectedItem=[];
  @override
  Widget build(BuildContext context) {

    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite app"),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyFavouriteItem()));
            },
              child: Icon(Icons.favorite)),
          SizedBox(width: 20,),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 21,
              itemBuilder: (context, index){
                return Consumer<FavouriteItemProvider>(builder: (context, value, child){
                  return ListTile(
                    onTap: (){
                      if(value.selectedItem.contains(index)){
                        value.removeItem(index);
                      }else{
                        value.addItem(index);
                      }
                    },
                    title: Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                        child: Center(child: Text("Item no: "+index.toString()))),
                    trailing: Icon(
                        value.selectedItem.contains(index)?Icons.favorite:Icons.favorite_outline),
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
