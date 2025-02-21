// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampaignModel _$CampaignModelFromJson(Map<String, dynamic> json) =>
    CampaignModel(
      id: json['id'] as String?,
      startTime: json['startTime'] as num?,
      endTime: json['endTime'] as num?,
      thumbnail: json['thumbnail'] as String?,
      amountTarget: json['amount_target'] as num?,
      currentAmount: json['current_amount'] as num?,
      author: json['author'] as Map<String, dynamic>?,
      title: json['title'] as String?,
      backers: json['backers'] as List<dynamic>?,
    );

Map<String, dynamic> _$CampaignModelToJson(CampaignModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'thumbnail': instance.thumbnail,
      'amount_target': instance.amountTarget,
      'current_amount': instance.currentAmount,
      'author': instance.author,
      'title': instance.title,
      'backers': instance.backers,
    };
