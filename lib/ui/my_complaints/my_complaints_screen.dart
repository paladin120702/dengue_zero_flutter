import 'package:dengue_zero/ui/my_complaints/my_complaints_view_model.dart';
import 'package:dengue_zero/ui/my_complaints/widgets/complaint_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyComplaintsScreen extends StatelessWidget {
  const MyComplaintsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        Provider.of<MyComplaintsViewModel>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.loadDenounces();
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: kToolbarHeight,
          child: Image.asset(
            'assets/images/Z.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: Consumer<MyComplaintsViewModel>(
        builder: (ctx, vm, _) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (vm.items.isEmpty) {
            return const Center(child: Text('Nenhuma denúncia cadastrada!'));
          } else {
            return ListView.builder(
              itemCount: vm.items.length,
              itemBuilder: (ctx, i) {
                final item = vm.itemByIndex(i);
                return ComplaintCard(
                  title: item.title,
                  imageUrl: item.imageUrl!,
                );
              },
            );
          }
        },
      ),
    );
  }
}
