part of 'widgets_imports.dart';

class ContactItem extends StatelessWidget {
  final String phone;
  const ContactItem({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    void callNumber() async {
      final Uri url = Uri(scheme: 'tel', path: phone);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    void openWhatsApp() async {
      final Uri whatsappUrl = Uri.parse("https://wa.me/$phone");
      if (await canLaunchUrl(whatsappUrl)) {
        await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch WhatsApp';
      }
    }

    return Container(
      padding: EdgeInsets.all(14),
      margin: EdgeInsetsGeometry.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: HelperFunctions.isDarkMode(context)
            ? AppColors.darkContainer
            : AppColors.lightContainer,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Contact me",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: callNumber,
                child: Iconify(Ic.round_local_phone, color: AppColors.info),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: openWhatsApp,
                child: Iconify(
                  Ic.outline_whatsapp,
                  color: AppColors.presentColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
