part of 'banner_carousel_slider_cubit.dart';

sealed class BannerCarouselSliderState {
  const BannerCarouselSliderState();

  List<Object> get props => [];
}

final class BannerCarouselSliderInitial extends BannerCarouselSliderState {}

final class BannerCarouselSliderChanged extends BannerCarouselSliderState {
  final int selectedIndex;
  const BannerCarouselSliderChanged({required this.selectedIndex});
  @override
  List<Object> get props => [selectedIndex];
}
