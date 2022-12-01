// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticket _$TicketFromJson(Map<String, dynamic> json) => Ticket(
      json['asignee'] as String? ?? "",
      json['ticketID'] as int? ?? 0,
      json['status'] as String? ?? "",
      json['subject'] as String? ?? "",
      json['description'] as String? ?? "",
      json['tracker'] as String? ?? "",
    );

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
      'ticketID': instance.ticketID,
      'status': instance.status,
      'subject': instance.subject,
      'description': instance.description,
      'tracker': instance.tracker,
      'asignee': instance.asignee,
    };
