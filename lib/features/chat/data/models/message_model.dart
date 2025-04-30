import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:franch_hub/features/chat/domain/entities/message.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MessageModel {
  final String id;
  final String senderId;
  final String receiverId;
  final String content;
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  final DateTime sentAt;

  MessageModel({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.sentAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);

  factory MessageModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;
    return MessageModel(
      id: doc.id,
      senderId: data?['senderId'] ?? '',
      receiverId: data?['receiverId'] ?? '',
      content: data?['content'] ?? '',
      sentAt: _dateTimeFromTimestamp(data?['sentAt']),
    );
  }

  static DateTime _dateTimeFromTimestamp(dynamic timestamp) {
    if (timestamp is Timestamp) {
      return timestamp.toDate();
    }
    return DateTime.now();
  }

  static Timestamp _dateTimeToTimestamp(DateTime date) => Timestamp.fromDate(date);

  Message toEntity() => Message(
    id: id,
    senderId: senderId,
    receiverId: receiverId,
    content: content,
    sentAt: sentAt,
  );

  factory MessageModel.fromEntity(Message entity) => MessageModel(
    id: entity.id,
    senderId: entity.senderId,
    receiverId: entity.receiverId,
    content: entity.content,
    sentAt: entity.sentAt,
  );
}