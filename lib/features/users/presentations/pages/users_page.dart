import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_projek/core/dependency_injection.dart';
import 'package:mobile_projek/features/users/presentations/bloc/users_bloc.dart';
import 'package:mobile_projek/features/users/presentations/bloc/users_event.dart';
import 'package:mobile_projek/features/users/presentations/bloc/users_state.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UsersBloc>()..add(GetUsersEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Users'),
        ),
        body: BlocBuilder<UsersBloc, UsersState>(builder: (context, state){
          if(state.status == UsersStatus.loading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(state.status == UsersStatus.error){
            return Center(
              child: Text(state.errorMessage?? ''),
            );
          }
          else if(state.status == UsersStatus.success){
            return ListView.builder(itemBuilder: (context, index){
              return ListTile(
                title: Text(state.users![index].firstName),
                subtitle: Text((state.users![index].email)),
              );
            }, itemCount: state.users?.length ?? 0, shrinkWrap: true,
            );
          }
          return Container();
        }),
      ),
    );
  }
}
