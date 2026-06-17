import 'dart:typed_data';

import 'package:co_stock/data/repositories/repos/i_repository.dart';
import 'package:co_stock/domain/core/image/image_asset.dart';
import 'package:co_stock/domain/notifications/snack/snack_notification.dart';
import 'package:fpdart/fpdart.dart';

abstract class IImageRepository implements IRepository {
  /// Загрузить изображение по URL и вернуть байты.
  /// Возвращает байты картинки [Uint8List] и его расширение [mime] или кидает ошибку.
  Future<Either<AppError, (Uint8List bytes, ImageMimeType mime)>> downloadImage(String url);
}
