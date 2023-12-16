import 'package:flutter/services.dart' as the_bundle;
import 'package:dbhiveecom/model/beds_model.dart';

class Helper {
  Future<List<Furnitures>> getBeds() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/beds.json");
    final bedList = furnituresFromJson(data); //from models
    return bedList;
  }

  Future<List<Furnitures>> getChairs() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/beds.json");
    final bedList = furnituresFromJson(data); //from models
    return bedList;
  }

  //addd all you want

  //get single bed
  Future<Furnitures> getBedsByIdd(String id) async {
    //remove list to just return bed
    final data =
        await the_bundle.rootBundle.loadString("assets/json/beds.json");
    final bedList = furnituresFromJson(data); //from models
    final bed = bedList.firstWhere((bed) => bed.id == id);
    return bed;
  }

  // do for other items
}
