enum LessonTime { morning, night, any }

class Lesson {
  final String id;
  final String title;
  final String scholarName;
  final String description;
  final String audioAssetPath;
  Duration duration;
  final LessonTime timeOfDay;
  final String course;
  final List<String> tags;
  final String? arabicLabel;
  final String? scholarPhotoPath;

  Lesson({
    required this.id,
    required this.title,
    required this.scholarName,
    required this.description,
    required this.audioAssetPath,
    required this.duration,
    required this.timeOfDay,
    this.course = '',
    this.tags = const [],
    this.arabicLabel,
    this.scholarPhotoPath,
  });
}
