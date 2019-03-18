// store database connection here
library beers.core;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

void bootstrapBeers() async {
  // add logic for wiping database
  File file = new File('../../../data/beers.json');
  String raw = file.readAsStringSync();
  List<Map> data = json.decode(raw);
  // process data into models and store in db
}
