part of 'order_list_bloc.dart';

abstract class OrderListEvent extends Equatable {
  const OrderListEvent();

  @override
  List<Object> get props => throw UnimplementedError();
}

class RefreshOrderList extends OrderListEvent {}

class LoadOrderList extends OrderListEvent {}
