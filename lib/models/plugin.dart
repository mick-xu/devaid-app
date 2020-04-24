final List<Plugin> Plugins = <Plugin>[
  Plugin(
    cover: "upload/2019/00/swiper.png",
    title: "flutter_swiper",
    subtitle: "flutter最强大的siwiper, 多种布局方式，无限轮播，Android和IOS双端适配.",
    route: "flutterSwiperPage",
  ),
  Plugin(
    cover: "upload/2019/00/device-info.png",
    title: "device_info",
    subtitle: "从 Flutter 应用中获取当前设备的信息",
    route: "deviceInfoPage",
  ),
  Plugin(
    cover: "upload/2019/00/video-player.png",
    title: "video_player",
    subtitle: "Android、iOS 视频播放器插件",
    route: "videoPlayerPage",
  ),
  Plugin(
    cover: "upload/2019/00/webview.png",
    title: "webview_flutter",
    subtitle: "一个提供 Webview widget 的 Flutter 插件，由 Flutter 团队开发",
    route: "webviewPage",
  ),
];

class Plugin {
  Plugin({this.cover, this.title, this.subtitle, this.route});

  final String cover;
  final String title;
  final String subtitle;
  final String route;
}
