import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/Login/Welcome.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/Login/otp.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/Login/phone.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/bag/bag_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/bottom_bar/bottom_navigation_bar_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/category/category_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/category/fashion_details_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/category/fashion_search_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/category/filters_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/category/offers_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/category/rating_and_reviews_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/category/top_fashion_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/home/home_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/home/notification_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/home/search_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/my_address/add_address_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/my_address/edit_address_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/my_address/my_address_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/on_boarding/on_boarding_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/order_summary/offers_promotions_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/order_summary/order_summary_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/payment/card_details_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/payment/payment_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/profile/edit_profile_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/profile/profile_tabs/customer_care_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/profile/profile_tabs/languages_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/profile/profile_tabs/my_order/add_reviews_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/profile/profile_tabs/my_order/my_orders_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/profile/profile_tabs/my_order/order_details_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/profile/profile_tabs/my_order/order_status_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/profile/profile_tabs/my_review_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/profile/profile_tabs/notifications_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/profile/profile_tabs/returns_policy_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/profile/profile_tabs/save_for_later_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/profile/profile_tabs/terms_and_conditions_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/profile/profile_tabs/who_we_are_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/wishlist/wishlist_view.dart';
import '../views/splash/splash_view.dart';

class AppRoutes {
  static const String splashView = "/splash_view";
  static const String onBoardingView = "/on_boarding_view";
  static const String welcomeView = "/Welcome";
  static const String phoneview = "/phone";
  static const String otpview = "/otp";
  static const String homeView = "/home_view";
  static const String bottomView = "/bottom_navigation_bar_view";
  static const String notificationView = "/notification_view";
  static const String searchView = "/search_view";
  static const String categoryView = "/category_view";
  static const String topFashionView = "/top_fashion_view";
  static const String filtersView = "/filters_view";
  static const String fashionDetailsView = "/fashion_details_view";
  static const String ratingAndReviewsView = "/rating_and_reviews_view";
  static const String offersView = "/offers_view";
  static const String wishlistView = "/wishlist_view";
  static const String myAddressView = "/my_address_view";
  static const String addAddressView = "/add_address_view";
  static const String orderSummaryView = "/order_summary_view";
  static const String offersAndPromotionsView = "/offers_promotions_view";
  static const String paymentView = "/payment_view";
  static const String cardDetailsView = "/card_details_view";
  static const String myOrdersView = "/my_orders_view";
  static const String orderDetailsView = "/order_details_view";
  static const String orderStatusView = "/order_status_view";
  static const String addReviewsView = "/add_reviews_view";
  static const String editProfileView = "/edit_profile_view";
  static const String saveForLaterView = "/save_for_later_view";
  static const String notificationsView = "/notifications_view";
  static const String languagesView = "/languages_view";
  static const String termsAndConditionsView = "/terms_and_conditions_view";
  static const String returnsPolicyView = "/returns_policy_view";
  static const String whoWeAreView = "/who_we_are_view";
  static const String customerCareView = "/customer_care_view";
  static const String myReviewsView = "/my_reviews_view";
  static const String bagView = "/bag_view";
  static const String editAddressView = "/edit_address_view";
  static const String fashionSearchView = "/fashion_search_view";

  static List<GetPage> pages = [
    GetPage(name: splashView, page: () => SplashView()),
    GetPage(name: onBoardingView, page: () => OnBoardingView()),
    GetPage(name: welcomeView, page: () => Welcome()),
    GetPage(name: phoneview, page: () => MyPhone()),
    GetPage(name: otpview, page: () => MyOtp()),

    // GetPage(name: logInView, page: () => LogInView()),
    // GetPage(name: otpView, page: () => OTPView()),
    GetPage(name: homeView, page: () => HomeView()),
    GetPage(name: bottomView, page: () => const BottomNavigationBarView()),
    GetPage(name: notificationView, page: () => NotificationView()),
    GetPage(name: searchView, page: () => const SearchView()),
    GetPage(name: categoryView, page: () => CategoryView()),
    // GetPage(name: topFashionView, page: () => const TopFashionView()),
    GetPage(name: filtersView, page: () => const FiltersView()),
    // GetPage(name: fashionDetailsView, page: () => FashionDetailsView()),
    GetPage(name: ratingAndReviewsView, page: () => RatingAndReviewsView()),
    GetPage(name: offersView, page: () => OffersView()),
    GetPage(name: wishlistView, page: () => WishlistView()),
    GetPage(name: myAddressView, page: () => MyAddressView()),
    GetPage(name: addAddressView, page: () => const AddAddressView()),
    GetPage(name: orderSummaryView, page: () => OrderSummaryView()),
    GetPage(
        name: offersAndPromotionsView, page: () => OffersAndPromotionsView()),
    GetPage(name: paymentView, page: () => PaymentView()),
    GetPage(name: cardDetailsView, page: () => CardDetailsView()),
    GetPage(name: myOrdersView, page: () => MyOrdersView()),
    GetPage(name: orderDetailsView, page: () => OrderDetailsView()),
    GetPage(name: orderStatusView, page: () => OrderStatusView()),
    GetPage(name: addReviewsView, page: () => AddReviewsView()),
    GetPage(name: editProfileView, page: () => const EditProfileView()),
    GetPage(name: saveForLaterView, page: () => SaveForLaterView()),
    GetPage(name: notificationsView, page: () => NotificationsView()),
    GetPage(name: languagesView, page: () => LanguagesView()),
    GetPage(name: termsAndConditionsView, page: () => TermsAndConditionsView()),
    GetPage(name: returnsPolicyView, page: () => ReturnsPolicyView()),
    GetPage(name: whoWeAreView, page: () => WhoWeAreView()),
    GetPage(name: customerCareView, page: () => CustomerCareView()),
    GetPage(name: myReviewsView, page: () => MyReviewView()),
    GetPage(name: bagView, page: () => BagView()),
    GetPage(name: editAddressView, page: () => const EditAddressView()),
    GetPage(name: fashionSearchView, page: () => const FashionSearchView()),
  ];
}
