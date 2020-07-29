part of 'order_list_bloc.dart';

class OrderListState extends Equatable {
  final List<Order> list;
  final int pageNo;
  final int pageSize;
  final int totalCount;

  const OrderListState(
      {this.list, this.pageNo, this.pageSize, this.totalCount});

  factory OrderListState.initial() => OrderListState(
      list: List<Order>(), pageNo: 1, pageSize: 10, totalCount: 0);

  OrderListState copyWith(
          {List<Order> list, int pageNo, int pageSize, int totalCount}) =>
      OrderListState(
          list: list ?? this.list,
          pageNo: pageNo ?? this.pageNo,
          pageSize: pageSize ?? this.pageSize,
          totalCount: totalCount ?? this.totalCount);

  @override
  List<Object> get props => [list, pageNo, pageSize];
}
