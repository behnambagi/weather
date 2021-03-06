part of image_widget;

class SvgImage extends StatelessWidget {
  final ImageAsset image;
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const SvgImage(this.image, {Key? key, this.width, this.height,
        this.color, this.padding, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding, margin: margin,
      width: width, height: height,
      color: Colors.transparent,
      child: SvgPicture.asset("${image.patch}.${TypeFileEnum.svg}", color: color),
    );
  }
}
