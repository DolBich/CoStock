import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_asset.freezed.dart';
part 'image_asset.g.dart';

/// Модель картинки с уникальным идентификатором [id], с ссылкой на картинку на
/// сервере [url], с путём к локально сохранённой картинке [localPath], с
/// байтами картинки в качестве кэша, для оперативной работы с картинкой [bytes]
///
/// Если при получении [ImageAsset] с сервера мы не находим картинки по [localPath],
/// то загужаем картинку с [url] и загружаем её в [localPath], чтобы в будущем не
/// гонять трафик
@freezed
sealed class ImageAsset with _$ImageAsset {
  const factory ImageAsset({
    required String id,
    /// Постоянный URL на сервере (нужен для первоначальной загрузки или расшаривания)
    required String url,
    /// Локальный путь к файлу (например, из path_provider)
    String? localPath,
    /// Байты изображения [bytes] только для оперативной работы, не подходят для
    /// api и локального хранения из-за своих размеров
    @JsonKey(includeToJson: false, includeFromJson: false) Uint8List? bytes,
    /// Если по каким-то причинам не удалось загрузить картинку
    @Default(false) bool isError,
    /// MIME-тип изображения, например 'image/jpeg', 'image/png'
    required ImageMimeType mime,
  }) = _ImageAsset;

  factory ImageAsset.fromJson(Map<String, dynamic> json) =>
      _$ImageAssetFromJson(json);
}

enum ImageMimeType {
  jpeg('image/jpeg', 'jpg'),
  png('image/png', 'png'),
  gif('image/gif', 'gif'),
  webp('image/webp', 'webp'),
  bmp('image/bmp', 'bmp'),
  unknown('application/octet-stream', 'jpg');

  final String mime;
  final String extension;

  const ImageMimeType(this.mime, this.extension);

  /// Получить расширение файла по MIME-строке
  static String extensionFromMime(String mime) {
    return fromMime(mime).extension;
  }

  /// Получить MIME-строку по расширению файла
  static String mimeFromExtension(String ext) {
    return fromExtension(ext).mime;
  }

  /// Получить тип расштрения по mime
  static ImageMimeType fromMime(String mime) {
    return values.firstWhere(
          (t) => t.mime == mime,
      orElse: () => unknown,
    );
  }

  /// Получить тип расштрения по ext
  static ImageMimeType fromExtension(String ext) {
    return values.firstWhere(
          (t) => t.extension == ext,
      orElse: () => unknown,
    );
  }
}