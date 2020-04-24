import 'package:scoped_model/scoped_model.dart';
import 'state/states.dart';
import 'package:flutter/material.dart';

class MainStateModel extends Model
    with countdown, packageInfoModel, userInfoModel, themeModel, localeModel {
  MainStateModel of(BuildContext context) =>
      ScopedModel.of<MainStateModel>(context, rebuildOnChange: true);
}
