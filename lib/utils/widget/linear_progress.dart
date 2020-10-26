import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rawg_flutter/core/network/model/ratings.dart';



class MyAssetsBar extends StatelessWidget {
  MyAssetsBar(
      {Key key,
      @required this.width,
      this.height =25,
      this.radius,
      this.assets,
      this.assetsLimit,
      this.background = Colors.grey})
      : assert(width != null),
        assert(assets != null),
        super(key: key);

  final double width;
  final double height;
  final double radius;
  final List<Ratings> assets;
  final double assetsLimit;
  final Color background;

  double _getValuesSum() {
    double sum = 0;
    assets.forEach((single) => sum += single.percent);
    return sum;
  }

  Widget _createSingle(Ratings singleAsset) {
    return SizedBox(
      width: (singleAsset.percent * width) / (assetsLimit ?? _getValuesSum()),
      child: Container(color: singleAsset.getColor()),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (assetsLimit != null && assetsLimit < _getValuesSum()) {
      return Container();
    }

    final double rad = radius ?? (height / 2);

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(rad)),
      child: Container(
        decoration: new BoxDecoration(
          color: background,
        ),
        width: width,
        height: height,
        child: Row(
            children: assets
                .map((singleAsset) => _createSingle(singleAsset))
                .toList()),
      ),
    );
  }
}
