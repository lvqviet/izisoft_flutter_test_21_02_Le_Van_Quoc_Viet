// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'campaign_model.g.dart';

@JsonSerializable()
class CampaignModel {
  final String? id;
  final num? startTime;
  final num? endTime;
  final String? thumbnail;
  @JsonKey(name: 'amount_target')
  final num? amountTarget;
    @JsonKey(name: 'current_amount')
  final num? currentAmount;
  final Map? author;
  final String? title;
  final List<dynamic>? backers;

  CampaignModel({
    this.id,
    this.startTime,
    this.endTime,
    this.thumbnail,
    this.amountTarget,
    this.currentAmount,
    this.author,
    this.title,
    this.backers,
  });

  factory CampaignModel.fromJson(Map<String, dynamic> json) => _$CampaignModelFromJson(json);

  Map<String, dynamic> toJson() => _$CampaignModelToJson(this);
}