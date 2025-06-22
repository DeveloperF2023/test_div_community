part of 'widgets_imports.dart';

class SingleInformationItem extends StatelessWidget {
  final String title;
  final String dataRow;
  const SingleInformationItem({
    super.key,
    required this.title,
    required this.dataRow,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(dataRow, style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
