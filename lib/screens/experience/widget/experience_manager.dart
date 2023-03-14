import '../../../helpers/helpers.dart';

@injectable
class ExperienceManager extends StatefulWidget {
  const ExperienceManager({
    required String title,
    required String id,
    Key? key,
  })  : _title = title,
        _id = id,
        super(key: key);

  final _title;
  final _id;

  @override
  State<ExperienceManager> createState() => ExperienceManagerState();
}

class ExperienceManagerState extends State<ExperienceManager> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
