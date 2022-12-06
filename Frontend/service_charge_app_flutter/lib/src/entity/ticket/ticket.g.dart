// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticket _$TicketFromJson(Map<String, dynamic> json) => Ticket(
      json['ticketID'] as int? ?? 0,
      json['userID'] as int? ?? 0,
      json['categoryID'] as int? ?? 0,
      json['status'] as String? ?? "",
      json['subject'] as String? ?? "",
      json['description'] as String? ?? "",
      json['date'] == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(json['date']),
    );

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
      'ticketID': instance.ticketID,
      'userID': instance.userID,
      'categoryID': instance.categoryID,
      'description': instance.description,
      'subject': instance.subject,
      'status': instance.status,
      'date': instance.date.toIso8601String(),
    };
