
import 'package:flutter/services.dart';
import 'package:flutter101/json_parse/json_structure.dart';

Future loadJsonString(JsonStructure structure) => rootBundle.loadString(_assetPathOf(structure));

String _assetPathOf(JsonStructure structure) {
  String fileName;
  switch (structure) {
    case JsonStructure.basicList:
      fileName = 'basic_list.json';
      break;
    case JsonStructure.basicMap:
      fileName = 'basic_map.json';
      break;
    case JsonStructure.basicMapWithList:
      fileName = 'basic_map_with_list.json';
      break;
    case JsonStructure.basicMapWithListModel:
      fileName = 'basic_map_with_list_model.json';
      break;
    case JsonStructure.basicMapWithModel:
      fileName = 'basic_map_with_model.json';
      break;
  }
  return 'assets/json_parse/$fileName';
}