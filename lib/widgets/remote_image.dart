import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_app/utils/constant.dart' show aliyunOss;
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class RemoteImage extends StatelessWidget {
  RemoteImage(
    this.path, {
    Key key,
    this.width,
    this.height,
    this.fit,
    this.loading = false,
    this.errorWidget,
  }) : super(key: key);

  final String path;
  final double width;
  final double height;
  final BoxFit fit;
  final bool loading;
  final Widget errorWidget;

  final String _loadingImage = 'assets/images/image-loading.png';
  final String _errorImage = 'assets/images/image-failed.png';

  @override
  Widget build(BuildContext context) {
    // CachedNetworkImage
    String _imageUrl = path.startsWith('http') ? path : '${aliyunOss}/$path';
    return CachedNetworkImage(
      imageUrl: _imageUrl,
      placeholder: (context, url) => loading
          ? Image.asset(
              _loadingImage,
              width: width,
              height: height,
              filterQuality: FilterQuality.low,
            )
          : null,
      errorWidget: (context, url, error) =>
          errorWidget ??
          Image.asset(
            _errorImage,
            width: width,
            height: height,
            filterQuality: FilterQuality.low,
          ),
      fit: fit ?? BoxFit.cover,
      width: width,
      height: height,
    );
  }
}

class RemoteImageProvider extends CachedNetworkImageProvider {
  RemoteImageProvider(this.path,
      {this.scale: 1.0, this.errorListener, this.headers, this.cacheManager})
      : super("$aliyunOss/$path",
            scale: scale,
            errorListener: errorListener,
            headers: headers,
            cacheManager: cacheManager);

  final String path;
  final double scale;
  final ErrorListener errorListener;
  final Map<String, String> headers;
  final BaseCacheManager cacheManager;
}

class ImageBox extends StatelessWidget {
  ImageBox(
      {this.title, this.width, this.right, this.image, this.onTap, Key key})
      : super(key: key);

  final String title;
  final double width;
  final double right;
  final String image;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    // implement build
    return Container(
      width: width,
      margin: EdgeInsets.only(right: right ?? 0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider("$aliyunOss/${image}",
              errorListener: () => {}),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(6.0),
        ),
      ),
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.3),
                borderRadius: BorderRadius.all(
                  Radius.circular(6.0),
                ),
              ),
            ),
            Positioned(
              top: 10.0,
              left: 10.0,
              bottom: 10.0,
              right: 10.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    title ?? "",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}

class CircleImage extends StatelessWidget {
  const CircleImage(this.path, {this.backgroundColor, this.radius = 40});

  final String path;
  final double radius;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    // implement build
    return CircleAvatar(
      radius: radius,
      backgroundColor:
          backgroundColor ?? Theme.of(context).textTheme.display3.color,
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: "$aliyunOss/${path}",
          //placeholder: (context, url) => new CircularProgressIndicator(),
          placeholder: (context, url) => Image.asset(
            "assets/images/avatar-female.png",
            fit: BoxFit.fill,
          ),
          errorWidget: (context, url, error) =>
              Image.asset("assets/images/avatar-female.png"),
          width: radius * 2,
          height: radius * 2,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
