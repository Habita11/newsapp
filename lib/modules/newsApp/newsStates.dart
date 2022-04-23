abstract class NewsStates {}
class InitilBottomNavState extends NewsStates{}
class ChangeBottomNavState extends NewsStates{}

class GetBusinessLoading extends NewsStates{}

class GetBusinessSuccess extends NewsStates{}

class GetBusinessError extends NewsStates{
  final String error;
  GetBusinessError(this.error);

}
class GetScienceError extends NewsStates{
  final String error;
  GetScienceError(this.error);
}

class GetSportsError extends NewsStates{
  final String error;
  GetSportsError(this.error);

}



class GetScienceLoading extends NewsStates{}
class GetScienceSuccess extends NewsStates{}

class GetSportsLoading extends NewsStates{}

class GetSportsSuccess extends NewsStates{}



