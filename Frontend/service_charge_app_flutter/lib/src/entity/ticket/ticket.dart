import 'package:json_annotation/json_annotation.dart';

part 'ticket.g.dart';

@JsonSerializable()
class Ticket {
  final int ticketID;
  final int userID;
  final int categoryID;
  final String description;
  final String subject;
  final String status;
  DateTime? date;

  Ticket({
    this.ticketID = 0,
    this.userID = 0,
    this.categoryID = 0,
    this.status = "",
    this.subject = "",
    this.description = "",
    this.date,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
  Map<String, dynamic> toJson() => _$TicketToJson(this);
}
//DateTime.fromMillisecondsSinceEpoch
// date: DateTime.fromMillisecondsSinceEpoch(json['date']),