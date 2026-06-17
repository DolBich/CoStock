import 'dart:typed_data';

import 'package:co_stock/application/tools/cancel_token.dart';
import 'package:co_stock/data/repositories/repos/i_repository.dart';
import 'package:co_stock/data/repositories/repos/image_repo/i_image_repository.dart';
import 'package:co_stock/domain/core/image/image_asset.dart';
import 'package:co_stock/domain/notifications/snack/snack_notification.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

class MockImageRepository extends IImageRepository with MockRepoDelay {
  /// Набор тестовых URL для имитации серверных изображений
  static const _mockUrls = [
    'https://avatars.mds.yandex.net/i?id=6fb15c9a5d16d96034a0477233ec6c63_sr-8339391-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=efee3a6464720d4e435275a3040bf5e8_l-9848534-images-thumbs&n=13',
    'https://i.pinimg.com/736x/73/17/3f/73173fcc58c0ffedf5163d98513b1bad.jpg',
  ];

  @override
  Future<Either<AppError, (Uint8List, ImageMimeType)>> downloadImage(String url) async {
    try {
      /// Реальная загрузка
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final contentType = response.headers['content-type'] ?? 'image/jpeg';
        final mime = contentType.split(';').first.trim();
        return right((response.bodyBytes, .fromMime(mime)));
      } else {
        return left(
          .server(
            type: .server,
            error: Exception(
              'HTTP ${response.statusCode}: ${response.reasonPhrase}',
            ),
          ),
        );
      }
    } catch (e, st) {
      return left(.client(type: .smth, error: e, stackTrace: st));
    }
  }
}
