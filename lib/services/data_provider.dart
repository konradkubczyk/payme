import 'dart:async';
import 'package:flutter/material.dart';
import 'package:payme/database/database.dart';
import 'package:provider/provider.dart';

class DataProvider extends ChangeNotifier {
  final AppDatabase database;
  final userId;
  String userName='';
  
  // A map to hold different data streams
  final Map<String, StreamController<List<dynamic>>> _dataStreams = {};

  DataProvider(this.database, this.userId);

  // Stream getter for external classes to listen to updates
  Stream<List<T>> getDataStream<T>(String key) {
    // Create a stream controller for the specified key if not exists
    _dataStreams[key] ??= StreamController<List<T>>.broadcast();
    return _dataStreams[key]?.stream as Stream<List<T>>;
  }

  Future<void> updateData<T>(String key, Future<List<T>> Function() fetchData) async {
    // Fetch updated data
    List<T> updatedData = await fetchData();

    // Notify listeners through the stream controller
    _dataStreams[key]?.add(updatedData);
  }

  // Dispose the stream controllers when the DataProvider is disposed
  @override
  void dispose() {
    for (var controller in _dataStreams.values) {
      controller.close();
    }
    super.dispose();
  }

  static DataProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<DataProvider>(context, listen: listen);
  }
  int getUserID(){

    return userId;
  }

}
