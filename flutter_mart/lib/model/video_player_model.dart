class VideoModel{
  final String title;
  final String time;
  final String  video;

  const VideoModel({
    required this.time,
    required this.title,
    required this.video,
   });
}


final List<VideoModel> courseCurriculum = [
  const VideoModel(time: "2:35", title: "Introduction",video: "assets/video.mp4"),
  const VideoModel(time: "10:15", title: "Chapter 1: Basics", video: "assets/video2.mp4"),
  const VideoModel(time: "8:45", title: "Chapter 2: Advanced Concepts", video: "assets/video.mp4"),
  const VideoModel(time: "5:30", title: "Chapter 3: Practical Examples", video: "assets/video2.mp4"),
  const VideoModel(time: "12:00", title: "Conclusion", video: "assets/video.mp4"),
];
