part of 'client.dart';

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: must_be_immutable

@JsonSerializable()
class Contract extends Equatable {
  int id;

  static Contract fromJson(Map<String, dynamic> json) =>
      _$ContractFromJson(json);
  Map<String, dynamic> toJson() => _$ContractToJson(this);

  @override
  List<Object> get props => [id];
}

@JsonSerializable()
class ContractList extends Equatable {
  int totalCount;
  int pageNo;

  List<Contract> data;

  static ContractList fromJson(Map<String, dynamic> json) =>
      _$ContractListFromJson(json);
  Map<String, dynamic> toJson() => _$ContractListToJson(this);

  @override
  List<Object> get props => [totalCount, pageNo];
}
