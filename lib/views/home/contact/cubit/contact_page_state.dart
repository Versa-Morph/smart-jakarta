part of 'contact_page_cubit.dart';

sealed class ContactPageState extends Equatable {
  const ContactPageState();

  @override
  List<Object?> get props => [];
}

final class ContactPageLoadingState extends ContactPageState {}

final class AddContactPageState extends ContactPageState {
  const AddContactPageState({this.errorMsg});
  final String? errorMsg;
  @override
  List<Object?> get props => [errorMsg];
}

final class ContactPageLoadedState extends ContactPageState {
  final List<UserContact> userContact;
  const ContactPageLoadedState(this.userContact);

  @override
  List<Object> get props => [userContact];
}

final class ContactPageEmptyState extends ContactPageState {}

final class ContactPageErrorState extends ContactPageState {
  const ContactPageErrorState(this.errorMsg);
  final String errorMsg;

  @override
  List<Object?> get props => [errorMsg];
}
