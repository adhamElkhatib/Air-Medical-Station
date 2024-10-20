//t2 Core Packages Imports
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//t2 Dependencies Imports
//t3 Services
//t3 Models
//t1 Exports

class FileContainer extends StatelessWidget {
  final Map<String, dynamic> file;

  const FileContainer({
    super.key,
    required this.file,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: ShapeDecoration(
              color: const Color(0xFFFEFCFB),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFE4E2E1)),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.file_copy),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(DateFormat('EEEE, dd MMM yyyy')
                            .format(file["uploadDate"])),
                        Text(file["fileName"].toString().split(".")[0])
                      ],
                    )
                  ],
                ),
                IconButton(
                    onPressed: () {
                      // file["url"];
                    },
                    icon: Icon(
                      Icons.download,
                      color: Theme.of(context).colorScheme.primary,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
