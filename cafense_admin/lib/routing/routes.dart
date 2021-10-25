const rootRoute = "/";

const OrdersPageRoute = "/oders";
const OrdersPageRouteName = "Oders";

const FoodsPageRoute = "/foods";
const FoodsPageRouteName = "Foods";

const FeedbackPageRoute = "/feedbacks";
const FeedbackPageRouteName = "Feedbacks";

const authenticationPageRoute = "/auth";
const authenticationPageRouteName = "Log Out";

class MenuItem {
  final String name;
  final String route;
  
  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItemRoutes = [
  MenuItem(OrdersPageRouteName, OrdersPageRoute),
  MenuItem(FoodsPageRouteName, FoodsPageRoute),
  MenuItem(FeedbackPageRouteName, FeedbackPageRoute),
  MenuItem(authenticationPageRouteName, authenticationPageRouteName)
];
