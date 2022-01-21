import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testtask/model/exhibit_model.dart';
import 'package:testtask/service/exhibit_service.dart';

final getExhibitProvider = ChangeNotifierProvider((ref) => ExhibitViewModel());

enum ExhibitStatus { LOADING, COMPLETED, NOT_INTERNET_CONNECTION, ERROR }

class ExhibitViewModel extends ChangeNotifier {
  ExhibitStatus _getLoadingStaus = ExhibitStatus.LOADING;
  ExhibitStatus get getLoadingStaus => _getLoadingStaus;

  late List<Exhibit> _getMainMenuList;
  List<Exhibit> get getMainMenuList => _getMainMenuList;

  Future<void> getExhibitViewModel() async {
    try {
      _getMainMenuList = await ExhibitService().getExhibitList();

      _getLoadingStaus = ExhibitStatus.COMPLETED;
    } catch (error) {
      _getLoadingStaus = ExhibitStatus.ERROR;
    } finally {
      notifyListeners();
    }
  }
}
