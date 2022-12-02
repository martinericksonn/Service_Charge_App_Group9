// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticket _$TicketFromJson(Map<String, dynamic> json) => Ticket(
      json['assigneeID'] as int? ?? 0,
      json['ticketID'] as int? ?? 0,
      json['userID'] as int? ?? 0,
      json['category'] as int? ?? 0,
      json['status'] as String? ?? "",
      json['subect'] as String? ?? "",
      json['description'] as String? ?? "",
      json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
      'ticketID': instance.ticketID,
      'assigneeID': instance.assigneeID,
      'userID': instance.userID,
      'category': instance.category,
      'description': instance.description,
      'subect': instance.subect,
      'status': instance.status,
      'date': instance.date.toIso8601String(),
    };
