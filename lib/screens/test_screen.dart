import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_psi/providers/question_provider.dart';
import 'package:test_psi/theme/app_theme.dart';
import 'package:test_psi/widgets/custom_header.dart';
import 'package:test_psi/widgets/test_body.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  void initState() {
    super.initState();
    final questionProvider =
        Provider.of<QuestionProvider>(context, listen: false);

    questionProvider.getQuestion();
  }

  @override
  Widget build(BuildContext context) {
    final headerHeight = MediaQuery.of(context).padding.top + 56;
    final bottomSafeArea = MediaQuery.of(context).padding.bottom;
    final deviceSize = MediaQuery.of(context).size;

    //Provider
    final questionProvider = Provider.of<QuestionProvider>(context);

    //questionProvider.getQuestion();

    return Scaffold(
      body: Column(
        children: [
          const CustomHeader(
            name: "Arturo",
          ),
          SizedBox(
            height: deviceSize.height - headerHeight - bottomSafeArea,
            width: double.infinity,
            child: renderContent(
              questionProvider.dataReceived,
              questionProvider.loadingData,
              questionProvider.error,
              questionProvider.errorMessage,
            ),
          ),
        ],
      ),
    );
  }

  //
  Widget renderContent(
      bool dataReceived, bool loading, bool error, String errMsg) {
    //questionProvider.
    if (loading && !error) {
      //Loading
      return loadingContent();
    }
    if (!loading && dataReceived) {
      //Result
      return TestBody();
    }
    if (!loading && error) {
      //Error
      onError(errMsg);
    }
    return Container();
  }

  //Loading Content
  Center loadingContent() {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: AppTheme.primaryColor,
        color: AppTheme.accentColor,
      ),
    );
  }

  //Error content
  Center onError(String err) {
    return Center(child: Text(err));
  }
}
