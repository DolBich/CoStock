// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort_arrangement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SortArrangement _$SortArrangementFromJson(Map<String, dynamic> json) =>
    _SortArrangement(
      customOrder:
          (json['customOrder'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
              k,
              (e as List<dynamic>).map((e) => e as String).toList(),
            ),
          ) ??
          const {},
      sortOrder:
          (json['sortOrder'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
              k,
              (e as Map<String, dynamic>).map(
                (k, e) => MapEntry(
                  $enumDecode(_$StockEntityTypeEnumMap, k),
                  (e as List<dynamic>).map((e) => e as String).toList(),
                ),
              ),
            ),
          ) ??
          const {},
    );

Map<String, dynamic> _$SortArrangementToJson(
  _SortArrangement instance,
) => <String, dynamic>{
  'customOrder': instance.customOrder,
  'sortOrder': instance.sortOrder.map(
    (k, e) =>
        MapEntry(k, e.map((k, e) => MapEntry(_$StockEntityTypeEnumMap[k]!, e))),
  ),
};

const _$StockEntityTypeEnumMap = {
  StockEntityType.group: 'group',
  StockEntityType.stock: 'stock',
};
