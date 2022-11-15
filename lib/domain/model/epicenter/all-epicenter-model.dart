import 'package:enivronment/domain/model/epicenter/epicenter_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'all-epicenter-model.g.dart';


@JsonSerializable()
class AllEpicenterModel {
  final List<EpicenterModel> epicenterModel ;
  final String totalItems ;

  AllEpicenterModel({
    required this.epicenterModel,
    required this.totalItems
});

  factory AllEpicenterModel.fromJson(Map<String, dynamic> srcJson) =>
      _$AllEpicenterModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AllEpicenterModelToJson(this);

}

