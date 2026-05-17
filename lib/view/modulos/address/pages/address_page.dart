import 'package:ferremateriales/view/modulos/address/cubit/address_cubit.dart';
import 'package:ferremateriales/view/modulos/address/pages/add_address_page.dart';
import 'package:ferremateriales/view/modulos/address/service/address_service.dart';
import 'package:ferremateriales/view/modulos/address/widgets/address_card.dart';
import 'package:ferremateriales/view/modulos/address/widgets/empty_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) => AddressCubit(addressService: AddressService())..getAddresses(),

      child: Scaffold(
        appBar: AppBar(title: const Text("Mis direcciones")),

        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              child: const Icon(Icons.add),

              onPressed: () async {
                /// ESPERAR RESULTADO
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AddAddressPage()),
                );

                /// RECARGAR DIRECCIONES
                if (result == true && context.mounted) {
                  context.read<AddressCubit>().getAddresses();
                }
              },
            );
          },
        ),

        body: BlocConsumer<AddressCubit, AddressState>(
          listener: (context, state) {
            if (state.error != null) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error!)));
            }

            if (state.success != null) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.success!)));
            }
          },

          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.addresses.isEmpty) {
              return const EmptyAddress();
            }

            return ListView.builder(
              itemCount: state.addresses.length,

              itemBuilder: (context, index) {
                final address = state.addresses[index];

                return AddressCard(
                  address: address,

                  onDelete: () {
                    context.read<AddressCubit>().deleteAddress(address.id);
                  },

                  onEdit: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AddAddressPage(address: address),
                      ),
                    );

                    /// RECARGAR DESPUÉS DE EDITAR
                    if (result == true && context.mounted) {
                      context.read<AddressCubit>().getAddresses();
                    }
                  },

                  onPrincipal: () {
                    context.read<AddressCubit>().setPrincipal(address.id);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
