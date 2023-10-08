export 'message_job_item.dart';
export 'message_my_item.dart';
export 'message_my_system_item.dart';
export 'message_them_item.dart';
export 'message_them_system_item.dart';

enum MessageType {
  text('text'),
  image('image'),
  video('video'),
  audio('audio'),
  system('system'),;

  final String name;
  const MessageType(this.name);
}
