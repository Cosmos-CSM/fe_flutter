import 'package:csm_client_core/csm_client_core.dart';
import 'package:flutter_extension/flutter_extension.dart';

/// Represents an [IEntity] based { view } page.
///
/// [TEntityTableAdapter] - Type of the inner entity table adapter.
abstract class EntityViewPageBase<TEntity extends IEntity<TEntity>, TEntityTableAdapter extends IEntityTableAdapter<TEntity>> extends PageBase implements IEntityViewPage<TEntity, TEntityTableAdapter> {
  /// [EntityTable] adapter configuration.
  @override
  final TEntityTableAdapter adapter;

  /// Creates a new instance.
  const EntityViewPageBase({required this.adapter, required super.routingData});
}
