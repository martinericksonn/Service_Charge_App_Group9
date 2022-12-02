import 'package:json_annotation/json_annotation.dart';

part 'ticket.g.dart';


@JsonSerializable()
class Ticket {
<<<<<<< Updated upstream
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
=======
  final int ticketID;
  final int assigneeID;
  final int userID;
  final int category;
  final String description;
  final String subect;
  final String status;
  final DateTime  date;

  Ticket([
    this.assigneeID = 0,
    this.ticketID = 0,
    this.userID = 0,
    this.category = 0,
    this.status = "",
    this.subect = "",
    this.description = "",
    DateTime? date,
  ]) : this.date = date ?? DateTime.now();
>>>>>>> Stashed changes

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
  Map<String, dynamic> toJson() => _$TicketToJson(this);
}
