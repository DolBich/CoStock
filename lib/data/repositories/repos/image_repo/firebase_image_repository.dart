import 'dart:typed_data';

import 'package:co_stock/data/repositories/repos/image_repo/i_image_repository.dart';
import 'package:co_stock/domain/core/image/image_asset.dart';
import 'package:co_stock/domain/notifications/snack/snack_notification.dart';
import 'package:fpdart/fpdart.dart';

class FirebaseImageRepository extends IImageRepository {
  @override
  Future<Either<AppError, (Uint8List, ImageMimeType)>> downloadImage(String url) {
    // TODO: implement downloadImage
    throw UnimplementedError();
  }

}
