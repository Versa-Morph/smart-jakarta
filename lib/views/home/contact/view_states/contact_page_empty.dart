import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_jakarta/views/home/contact/cubit/contact_page_cubit.dart';
import 'package:smart_jakarta/views/home/contact/widgets/add_contact_button.dart';

class ContactPageEmpty extends StatelessWidget {
  const ContactPageEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(27),
        child: Column(
          children: [
            AddContactButton(
              onTap: () {
                context.read<ContactPageCubit>().goToContactPage();
              },
            ),
          ],
        ),
      ),
    );
  }
}
