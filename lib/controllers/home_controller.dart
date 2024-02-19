import 'package:flutter/cupertino.dart';
import 'package:watter_bucket/models/step_model.dart';
import 'package:watter_bucket/models/water_mesurement.dart';

class HomeController{
  late WaterMeasurement waterMeasurement;
  ValueNotifier<int> target = ValueNotifier(0);
  ValueNotifier<List<StepModel>> result = ValueNotifier<List<StepModel>>([]);

  List<StepModel> getInstruction(int x, int y, int z){
    target.value = z;
    waterMeasurement = WaterMeasurement(x, y, z);
    result.value = waterMeasurement.solve();
    return [];
  }

  void dispose(){
    result.dispose();
    target.dispose();
  }
}