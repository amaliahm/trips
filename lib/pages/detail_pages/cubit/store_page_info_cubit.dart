import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/pages/detail_pages/cubit/store_page_info_state.dart';

class StorePageInfoCubits extends Cubit<List<StorePageInfoState>> {
  StorePageInfoCubits() : super([]);
  String? icon = "heart_";

  addPageInfo(String? name, int? index, String? icon) {
    emit([StorePageInfoState(name: name, index: index, icon: icon), ...state]);
  }

  updatePageInfo(String? name, int? index, String? icon) {
    var list = state;
    for (int i = 0; i < list.length; i++) {
      if (list[i].name == name) {
        state.removeAt(i);
      }
    }
    emit([StorePageInfoState(name: name, index: index, icon: icon), ...state]);
  }

  updatePageWish(String? name, int? index, String? new_icon) {
    var list = state;
    for (int i = 0; i < list.length; i++) {
      if (list[i].name == name) {
        state.removeAt(i);
      }
    }
    icon = new_icon;
    emit([StorePageInfoState(name: name, index: index, icon: icon), ...state]);
  }
}
