import 'package:json_annotation/json_annotation.dart';

part 'ticket.g.dart';


@JsonSerializable()
class Ticket {
  final String ticketID;
  final String status;
  final String subject;
  final String description;
  final String tracker;

  Ticket(
    this.ticketID,
    this.status,
    this.subject,
    this.description,
    this.tracker,
  );

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
  Map<String, dynamic> toJson() => _$TicketToJson(this);
}
