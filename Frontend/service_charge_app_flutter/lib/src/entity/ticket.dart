import 'package:json_annotation/json_annotation.dart';

part 'ticket.g.dart';

@JsonSerializable()
class Ticket {
  final int ticketID;
  final String status;
  final String subject;
  final String description;
  final String tracker;
  final String asignee;

  Ticket([
    this.asignee = "",
    this.ticketID = 0,
    this.status = "",
    this.subject = "",
    this.description = "",
    this.tracker = "",
  ]);

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
  Map<String, dynamic> toJson() => _$TicketToJson(this);

  static Ticket fromJsonn(var data) {
    return Ticket(
      data["ticketID"],
      data["assignee"],
      data["status"],
      data["subject"],
      data["description"],
      data["tracker"],
    );
  }
}
