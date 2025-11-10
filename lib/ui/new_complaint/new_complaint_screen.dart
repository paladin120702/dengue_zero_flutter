import 'package:dengue_zero/ui/new_complaint/new_complaint_view_model.dart';
import 'package:dengue_zero/ui/new_complaint/widgets/image_input.dart';
import 'package:dengue_zero/ui/new_complaint/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewComplaintScreen extends StatelessWidget {
  const NewComplaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewComplaintViewModel>(
      builder: (context, viewModel, _) {
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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        TextField(
                          controller: viewModel.titleController,
                          decoration:
                              const InputDecoration(labelText: 'Título'),
                        ),
                        const SizedBox(height: 10),
                        ImageInput(
                          image: viewModel.pickedImage,
                          onSelectImage: (img) async =>
                              viewModel.selectImage(img),
                        ),
                        const SizedBox(height: 10),
                        LocationInput(
                          location: viewModel.pickedPosition,
                          onSelectPosition: (pos) async =>
                              viewModel.selectPosition(pos),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: ElevatedButton.icon(
                  onPressed: viewModel.isValidForm
                      ? () => viewModel.submitForm(context)
                      : null,
                  label: viewModel.isSubmitting
                      ? const Text('Enviando...')
                      : const Text('Denunciar'),
                  icon: const Icon(Icons.add),
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
