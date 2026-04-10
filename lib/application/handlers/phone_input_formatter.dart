import 'package:flutter/services.dart';

/// Извлекает только цифры из строки.
class _DigitExtractor {
  String call(String s) => s.replaceAll(RegExp(r'\D'), '');
}

/// Вставляет символы форматирования между цифрами.
class _FormatInserter {
  final Map<int, String> _fullFormatMap;
  late final Map<int, String> _bodyFormatMap;

  _FormatInserter(this._fullFormatMap) {
    assert(_fullFormatMap.keys.every((k) => k >= 0), 'Ключи должны быть >= 0');

    /// Убираем [0], потому что он относится к префиксу
    _bodyFormatMap = Map.from(_fullFormatMap)..remove(0);
  }

  /// Форматирует тело (цифры) вставляя символы для ключей > 0.
  String insertBodyFormatting(String digits) {
    if (digits.isEmpty) return '';
    final buffer = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      buffer.write(digits[i]);

      /// Сначала записываем цифру, затем проверяем есть ли на следующей позиции
      /// знак форматирования и ставим его, если есть
      if (_bodyFormatMap.containsKey(i + 1)) {
        buffer.write(_bodyFormatMap[i + 1]);
      }
    }
    return buffer.toString();
  }

  /// Длина строки форматирования перед цифрой с индексом [digitIndex] (только для индексов > 0).
  int formatLengthBefore(int digitIndex) {
    if (digitIndex <= 0) return 0;
    return _bodyFormatMap[digitIndex]?.length ?? 0;
  }
}

/// Управляет префиксом: код страны (или альт. префикс) + форматирование для индекса 0.
class _PrefixManager {
  final String countryCode;
  final String? altPrefix;
  final Map<int, String> formatMap;

  late final String _displayPrefix;
  late final int _prefixLength;

  _PrefixManager({
    required this.countryCode,
    required this.altPrefix,
    required this.formatMap,
  }) {
    final prefixFormat = formatMap[0] ?? '';
    _displayPrefix = countryCode + prefixFormat;
    _prefixLength = _displayPrefix.length;
  }

  String get displayPrefix => _displayPrefix;

  int get prefixLength => _prefixLength;

  String stripPrefixes(String text) {
    String result = text;

    if (result.startsWith(_displayPrefix)) {
      result = result.substring(_displayPrefix.length);
      return result;
    }

    if (altPrefix != null) {
      final altFullPrefix = altPrefix! + (formatMap[0] ?? '');
      if (result.startsWith(altFullPrefix)) {
        result = result.substring(altFullPrefix.length);
        return result;
      }
    }

    for (final ch in _displayPrefix.split('')) {
      if (result.startsWith(ch)) {
        result = result.substring(1);
      } else {
        break;
      }
    }
    return result;
  }
}

/// Предварительно форматирует тело номера (цифры -> строка с символами форматирования).
class _BodyPreformatter {
  final _FormatInserter _formatInserter;
  final _DigitExtractor _digitExtractor = _DigitExtractor();

  _BodyPreformatter(this._formatInserter);

  String format(String rawBody) {
    final digits = _digitExtractor(rawBody);
    return _formatInserter.insertBodyFormatting(digits);
  }
}

/// Корректирует позицию курсора при переходе от сырого тела к отформатированному.
class _CursorPreAdjuster {
  final int prefixLength;
  final _FormatInserter _formatInserter;

  _CursorPreAdjuster({
    required this.prefixLength,
    required _FormatInserter formatInserter,
  }) : _formatInserter = formatInserter;

  /// Определяет где должен оказаться курсор после того, как мы применили
  /// форматирование к телу номера
  int adjust(int originalCursor, String rawBody) {
    /// Положение курсора в сыром теле (без префикса)
    int posInRawBody = originalCursor - prefixLength;

    /// Он не может оказаться внутри префикса, эта проверка просто на всякий
    /// случай
    if (posInRawBody < 0) posInRawBody = 0;

    /// Берём часть сырого тела до курсора
    final rawBeforeCursor = rawBody.substring(
      0,
      posInRawBody.clamp(0, rawBody.length),
    );

    /// Извлекаем цифры из этой левой части от курсора
    final digitsBefore = _DigitExtractor()(rawBeforeCursor);

    /// Форматируем только эти цифры
    final formattedBefore = _formatInserter.insertBodyFormatting(digitsBefore);

    /// Позиция курсора в отформатированной строке = длина префикса + длина отформатированной части
    /// Поскольку дальнейшее форматирование текста не затрагивает положение курсора
    return prefixLength + formattedBefore.length;
  }
}

/// Ограничивает количество цифр.
class _LengthLimiter {
  final int maxDigits;

  _LengthLimiter(this.maxDigits);

  /// Ограничивает число цифр при добавлении, сохраняя уже существующие цифры
  /// и порядок новых (новые невлезшие убираются как в середине, так и в конце)
  String limit(String newDigits, String oldDigits) {
    if (newDigits.length <= maxDigits) return newDigits;
    if (oldDigits.length == maxDigits) return oldDigits;

    /// Число добавленных цифр
    /// [temp] сохраняет в себе те символы в новом тексте, которых не было
    /// в старом тексте в порядке слева направо
    String temp = newDigits;
    for (final d in oldDigits.split('')) {
      temp = temp.replaceFirst(d, '');
    }
    final added = temp.length;

    /// Допустимое число добавленных цифр
    final allowed = maxDigits - oldDigits.length;
    final toAdd = added.clamp(0, allowed);

    /// Сборка результирующей новой строки с учётом новых символов и их
    /// допустимого количества
    String remainingOld = oldDigits;
    final buffer = StringBuffer();
    int addedSoFar = 0;
    for (final d in newDigits.split('')) {
      if (remainingOld.isNotEmpty && remainingOld[0] == d) {
        buffer.write(d);
        remainingOld = remainingOld.substring(1);
      } else if (addedSoFar < toAdd) {
        buffer.write(d);
        addedSoFar++;
      }
    }
    return buffer.toString();
  }
}

/// Конвертер курсора между форматированной строкой и индексом цифры.
class _CursorConverter {
  final int prefixLength;
  final _FormatInserter _formatInserter;
  final int maxDigits;

  _CursorConverter({
    required this.prefixLength,
    required _FormatInserter formatInserter,
    required this.maxDigits,
  }) : _formatInserter = formatInserter;

  /// Возвращает индекс цифры (0..maxDigits) по позиции курсора в полной форматированной строке.
  int toDigitsPosition(int formattedCursor, String formattedBody) {
    /// Определяем позицию курсора внутри тела (без префикса)
    int pos = formattedCursor - prefixLength;
    if (pos < 0) pos = 0;

    /// Проходим по каждому символу отформатированного тела
    int digitCount = 0;
    int currentPos = 0;
    for (final ch in formattedBody.split('')) {
      /// Останавливаемся, как только дошли до позиции курсора
      if (currentPos >= pos) break;

      /// Если символ — цифра, увеличиваем счётчик
      if (RegExp(r'\d').hasMatch(ch)) {
        digitCount++;
      }
      currentPos++;
    }

    /// Возвращаем количество цифр до курсора, но не больше максимального
    return digitCount.clamp(0, maxDigits);
  }

  /// Возвращает позицию курсора в полной форматированной строке для заданного индекса цифры.
  int toFormattedCursor(int digitIndex) {
    /// Строим тело для ровно digitIndex цифр, наполнение цифр не имеет значения
    /// они просто обозначают позицию и количество цифр в номере до курсора
    final digits = List.generate(
      digitIndex.clamp(0, maxDigits),
      (i) => i.toString(),
    ).join();
    /// Форматируем левую часть тела от курсора
    final formattedBody = _formatInserter.insertBodyFormatting(digits);

    return prefixLength + formattedBody.length;
  }

  /// Ограничивает курсор допустимым диапазоном (не меньше длины префикса).
  int clampCursor(int cursor) {
    /// Максимальная длина: префикс + все цифры + всё форматирование тела
    int maxLen = prefixLength + maxDigits;
    for (int i = 1; i <= maxDigits; i++) {
      maxLen += _formatInserter.formatLengthBefore(i);
    }
    return cursor.clamp(prefixLength, maxLen);
  }
}

/// Обрабатывает удаление цифр и символов форматирования.
class _DeleteCalculator {
  final _DigitExtractor _digitExtractor = _DigitExtractor();

  /// Возвращает (новые цифры, индекс цифры для курсора) после удаления.
  (String, int) processDelete({
    required String oldRawBody,
    required String newRawBody,
    required int oldCursorPos,
    required int newCursorPos,
    required int prefixLength,
    required String oldDigits,
    required String newDigits,
  }) {
    final oldDigitsBefore = _countDigitsBefore(oldRawBody, oldCursorPos, prefixLength);
    final newDigitsBefore = _countDigitsBefore(newRawBody, newCursorPos, prefixLength);

    /// Если удалено несколько символов (выделение), просто берём новые цифры
    /// Ставим selection на место где остановился курсор после удаления
    if ((oldDigits.length - newDigits.length).abs() > 1) {
      return (newDigits, newDigitsBefore.clamp(0, newDigits.length));
    }

    /// Определяем направление удаления по изменению абсолютной позиции курсора
    final bool isBackspace = oldCursorPos > newCursorPos;

    String resultDigits;
    int resultDigitIndex;

    if (isBackspace) {
      /// Удаление влево: удаляем цифру слева от старого курсора (индекс oldDigitsBefore - 1)
      if (oldDigitsBefore > 0) {
        resultDigits = oldDigits.replaceRange(oldDigitsBefore - 1, oldDigitsBefore, '');
        resultDigitIndex = oldDigitsBefore - 1;
      } else {
        /// Попытка удалить перед первой цифрой — ничего не делаем
        resultDigits = oldDigits;
        resultDigitIndex = 0;
      }
    } else {
      /// Удаление вправо: удаляем цифру справа от старого курсора (индекс oldDigitsBefore)
      if (oldDigitsBefore < oldDigits.length) {
        resultDigits = oldDigits.replaceRange(oldDigitsBefore, oldDigitsBefore + 1, '');
        resultDigitIndex = oldDigitsBefore;
      } else {
        /// Попытка удалить за последней цифрой — ничего не делаем
        resultDigits = oldDigits;
        resultDigitIndex = oldDigits.length;
      }
    }

    return (resultDigits, resultDigitIndex.clamp(0, resultDigits.length));
  }

  /// Считает сколько цифр стоит до курсора
  int _countDigitsBefore(String rawBody, int cursorPos, int prefixLength) {
    final int posInRaw = cursorPos - prefixLength;
    final String before = rawBody.substring(0, posInRaw.clamp(0, rawBody.length));
    return _digitExtractor(before).length;
  }
}

/// Основной форматтер ввода телефона.
class PhoneInputFormatter extends TextInputFormatter {
  final String countryCode;
  final String? countryAltPrefix;
  final int nationalLength;
  final Map<int, String> formatMap;

  late final _PrefixManager _prefixManager;
  late final _FormatInserter _formatInserter;
  late final _BodyPreformatter _bodyPreformatter;
  late final _CursorPreAdjuster _cursorPreAdjuster;
  late final _LengthLimiter _lengthLimiter;
  late final _CursorConverter _cursorConverter;
  late final _DeleteCalculator _deleteCalculator;
  final _DigitExtractor _digitExtractor = _DigitExtractor();

  PhoneInputFormatter({
    this.countryCode = '+7',
    this.nationalLength = 10,
    this.countryAltPrefix = '8',
    this.formatMap = const {0: ' (', 3: ') ', 6: '-', 8: '-'},
  }) {
    assert(
      formatMap.keys.every((k) => k >= 0 && k < nationalLength),
      'Ключи formatMap должны быть в диапазоне 0..nationalLength-1',
    );
    assert(
      formatMap.containsKey(0),
      'formatMap должен содержать ключ 0 для префикса',
    );

    _prefixManager = _PrefixManager(
      countryCode: countryCode,
      altPrefix: countryAltPrefix,
      formatMap: formatMap,
    );
    _formatInserter = _FormatInserter(formatMap);
    _bodyPreformatter = _BodyPreformatter(_formatInserter);
    _cursorPreAdjuster = _CursorPreAdjuster(
      prefixLength: _prefixManager.prefixLength,
      formatInserter: _formatInserter,
    );
    _lengthLimiter = _LengthLimiter(nationalLength);
    _cursorConverter = _CursorConverter(
      prefixLength: _prefixManager.prefixLength,
      formatInserter: _formatInserter,
      maxDigits: nationalLength,
    );
    _deleteCalculator = _DeleteCalculator();
  }

  /// Возвращает полный префикс (код страны + символы форматирования для ключа 0).
  String get getFullPrefix {
    final prefixFormat = formatMap[0] ?? '';
    return countryCode + prefixFormat;
  }

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    ///           ===SELECTION===
    if (oldValue == newValue) return newValue;

    /// Ограничение выделения (не даём выбрать префикс)
    final clampedBase = _cursorConverter.clampCursor(
      newValue.selection.baseOffset,
    );
    final clampedExtent = _cursorConverter.clampCursor(
      newValue.selection.extentOffset,
    );
    if (clampedBase != newValue.selection.baseOffset ||
        clampedExtent != newValue.selection.extentOffset) {
      newValue = newValue.copyWith(
        selection: TextSelection(
          baseOffset: clampedBase,
          extentOffset: clampedExtent,
        ),
      );
    }

    ///           ===ФОРМАТИРОВАНИЕ===
    if (oldValue.text == newValue.text) return newValue;

    /// Извлекаем сырое тело (без префикса) из старого и нового значений
    final String oldRawBody = _prefixManager.stripPrefixes(oldValue.text);
    String newRawBody = _prefixManager.stripPrefixes(newValue.text);

    /// Обработка случая вставки полного номера с любым форматированием
    final newDigitsAll = _digitExtractor(newRawBody);
    final countryDigits = _digitExtractor(countryCode);
    if (newDigitsAll.length == countryDigits.length + nationalLength &&
        newDigitsAll.startsWith(countryDigits)) {
      /// Вставлен полный номер с кодом страны
      newRawBody = newDigitsAll.substring(countryDigits.length);
    } else if (countryAltPrefix != null &&
        newDigitsAll.length == countryAltPrefix!.length + nationalLength &&
        newDigitsAll.startsWith(countryAltPrefix!)) {
      /// Вставлен полный номер с альтернативным префиксом
      newRawBody = newDigitsAll.substring(countryAltPrefix!.length);
    }

    /// Если в новом тексте нет ничего, кроме префикса, то только его и показываем
    if (newRawBody.isEmpty) {
      return TextEditingValue(
        text: _prefixManager.displayPrefix,
        selection: .collapsed(offset: _prefixManager.prefixLength),
      );
    }

    /// Предварительное форматирование
    /// Нужно тчобы новое значение уже имело форматирование в соответствии
    /// с нашими правилами для последующих првоерок и ограничений (единая форма)
    final String formattedBody = _bodyPreformatter.format(newRawBody);
    final int adjustedCursor = _cursorPreAdjuster.adjust(
      newValue.selection.baseOffset,
      newRawBody,
    );

    final preformattedText = _prefixManager.displayPrefix + formattedBody;
    final preformattedValue = TextEditingValue(
      text: preformattedText,
      selection: .collapsed(offset: adjustedCursor),
    );

    /// Извлекаем цифры из отформатированных тел (без префикса)
    final String oldBodyDigits = _digitExtractor(oldRawBody);

    /// У предформатированного текста уже есть префикс, поэтому тут его исключаем
    final String newBodyDigits = _digitExtractor(
      preformattedValue.text.substring(_prefixManager.prefixLength),
    );

    /// Определяем, является ли действие удалением.
    /// Сравниваем длины полностью отформатированных строк (префикс + тело).
    /// Так как [preformattedValue] уже содержит новое значение в нашем стандартном формате,
    /// уменьшение длины гарантированно означает удаление (символа или цифры).
    /// Этот подход не зависит от форматирования вставленного текста и корректно
    /// обрабатывает случаи, когда вставка имеет более короткое форматирование,
    /// но большее количество цифр.
    final bool isDeleting = oldValue.text.length > preformattedValue.text.length;

    String resultDigits;
    int resultDigitIndex;

    if (!isDeleting) {
      /// Добавление
      /// Накалдывает ограничение на добавление цифр и переводит курсор на
      /// ту же цифру, где был, но без форматирования
      resultDigits = _lengthLimiter.limit(newBodyDigits, oldBodyDigits);
      resultDigitIndex = _cursorConverter.toDigitsPosition(
        preformattedValue.selection.baseOffset,
        formattedBody,
      );
      resultDigitIndex = resultDigitIndex.clamp(0, resultDigits.length);
    } else {
      /// Удаление
      (resultDigits, resultDigitIndex) = _deleteCalculator.processDelete(
        oldRawBody: oldRawBody,
        newRawBody: newRawBody,
        oldCursorPos: oldValue.selection.baseOffset,
        newCursorPos: newValue.selection.baseOffset,
        prefixLength: _prefixManager.prefixLength,
        oldDigits: oldBodyDigits,
        newDigits: newBodyDigits,
      );
    }

    /// Финальное форматирование
    final String finalFormattedBody = _formatInserter.insertBodyFormatting(
      resultDigits,
    );
    final String fullText = _prefixManager.displayPrefix + finalFormattedBody;
    final int finalCursor = _cursorConverter.toFormattedCursor(
      resultDigitIndex,
    );

    return TextEditingValue(
      text: fullText,
      selection: .collapsed(offset: finalCursor),
    );
  }
}
