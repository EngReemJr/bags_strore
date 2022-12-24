class AppRouter {
   AppRouter._();
static AppRouter appRouter = AppRouter._();
GlobalKey<NavigatorState> navigatorKey=GlobalKey(); 

showCustomDialoug(String title, String content) {
showDialog(
context: navigatorkey.currentContext!,
builder: (context) {
return 
  AlertDialog (
title: Text(title),
content: Text (content),
actions: [
1,
TextButton(
onPressed: () {
},
navigatorkey.currentState!.pop();
child: Text('Ok')) ]// TextButton
); });
};}