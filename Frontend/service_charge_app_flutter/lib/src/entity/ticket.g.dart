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
      json['subject'] as String? ?? "",
      json['description'] as String? ?? "",
      json['date'] == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(json['date'] * 1000),
    );

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
      'ticketID': instance.ticketID,
      'assigneeID': instance.assigneeID,
      'userID': instance.userID,
      'category': instance.category,
      'description': instance.description,
      'subject': instance.subject,
      'status': instance.status,
      'date': instance.date.toIso8601String(),
    };
