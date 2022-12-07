// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticket _$TicketFromJson(Map<String, dynamic> json) => Ticket(
      ticketID: json['ticketID'] as int? ?? 0,
      userID: json['userID'] as int? ?? 0,
      categoryID: json['categoryID'] as int? ?? 0,
      status: json['status'] as String? ?? "",
      subject: json['subject'] as String? ?? "",
      description: json['description'] as String? ?? "",
      date: json['date'],
    );

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
      'ticketID': instance.ticketID,
      'userID': instance.userID,
      'categoryID': instance.categoryID,
      'description': instance.description,
      'subject': instance.subject,
      'status': instance.status,
      'date': instance.date?.toIso8601String(),
    };
