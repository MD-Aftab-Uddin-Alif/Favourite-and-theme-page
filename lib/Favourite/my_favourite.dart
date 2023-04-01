import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favourite_provider.dart';

class MyFavouriteItem extends StatefulWidget {
  const MyFavouriteItem({Key? key}) : super(key: key);

  @override
  _MyFavouriteItemState createState() => _MyFavouriteItemState();
}

class _MyFavouriteItemState extends State<MyFavouriteItem> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider=Provider.of<FavouriteItemProvider>(context);
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
              itemCount: favouriteProvider.selectedItem.length ,
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
                        child: Text("Item no: "+index.toString())),
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
