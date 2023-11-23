class FlightsModel {
  String? id;
  String? flightNumber;
  String? allowedWeight;
  String? flightLine;
  String? fromAirport;
  String? toAirport;
  String? departureDate;
  String? durationHours;
  String? departureTime;
  String? arrivalTime;
  String? numStops;
  String? adultPrice;
  String? infantPrice;
  String? childPrice;
  String? numTickets;
  String? numReturnTickets;
  String? tax;
  String? allowReturn;
  String? returnStartDate;
  String? returnEndDate;
  String? arrivalFromReturn;
  String? departureToReturn;
  String? allowedWeightReturn;
  String? returnFlightNumber;
  String? createdAt;
  String? returnEndDate1;
  String? returnEndDate2;
  String? arrivDate;
  String? locStops;
  String? numStopsReturn;
  String? locStopsReturn;
  String? hoursStopsReturn;
  String? hoursArriv;

  FlightsModel(
      {this.id,
      this.flightNumber,
      this.allowedWeight,
      this.flightLine,
      this.fromAirport,
      this.toAirport,
      this.departureDate,
      this.durationHours,
      this.departureTime,
      this.arrivalTime,
      this.numStops,
      this.adultPrice,
      this.infantPrice,
      this.childPrice,
      this.numTickets,
      this.numReturnTickets,
      this.tax,
      this.allowReturn,
      this.returnStartDate,
      this.returnEndDate,
      this.arrivalFromReturn,
      this.departureToReturn,
      this.allowedWeightReturn,
      this.returnFlightNumber,
      this.createdAt,
      this.returnEndDate1,
      this.returnEndDate2,
      this.arrivDate,
      this.locStops,
      this.numStopsReturn,
      this.locStopsReturn,
      this.hoursStopsReturn,
      this.hoursArriv});

  FlightsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    flightNumber = json['flightNumber'];
    allowedWeight = json['allowedWeight'];
    flightLine = json['flightLine'];
    fromAirport = json['fromAirport'];
    toAirport = json['toAirport'];
    departureDate = json['departureDate'];
    durationHours = json['durationHours'];
    departureTime = json['departureTime'];
    arrivalTime = json['arrivalTime'];
    numStops = json['numStops'];
    adultPrice = json['adultPrice'];
    infantPrice = json['infantPrice'];
    childPrice = json['childPrice'];
    numTickets = json['numTickets'];
    numReturnTickets = json['numReturnTickets'];
    tax = json['tax'];
    allowReturn = json['allowReturn'];
    returnStartDate = json['returnStartDate'];
    returnEndDate = json['returnEndDate'];
    arrivalFromReturn = json['arrivalFromReturn'];
    departureToReturn = json['departureToReturn'];
    allowedWeightReturn = json['allowedWeightReturn'];
    returnFlightNumber = json['returnFlightNumber'];
    createdAt = json['created_at'];
    returnEndDate1 = json['returnEndDate1'];
    returnEndDate2 = json['returnEndDate2'];
    arrivDate = json['arrivDate22'];
    locStops = json['locStops'];
    numStopsReturn = json['num_stops_return'];
    locStopsReturn = json['loc_stops_return'];
    hoursStopsReturn = json['hours_stops_return'];
    hoursArriv = json['hours_arriv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['flightNumber'] = this.flightNumber;
    data['allowedWeight'] = this.allowedWeight;
    data['flightLine'] = this.flightLine;
    data['fromAirport'] = this.fromAirport;
    data['toAirport'] = this.toAirport;
    data['departureDate'] = this.departureDate;
    data['durationHours'] = this.durationHours;
    data['departureTime'] = this.departureTime;
    data['arrivalTime'] = this.arrivalTime;
    data['numStops'] = this.numStops;
    data['adultPrice'] = this.adultPrice;
    data['infantPrice'] = this.infantPrice;
    data['childPrice'] = this.childPrice;
    data['numTickets'] = this.numTickets;
    data['numReturnTickets'] = this.numReturnTickets;
    data['tax'] = this.tax;
    data['allowReturn'] = this.allowReturn;
    data['returnStartDate'] = this.returnStartDate;
    data['returnEndDate'] = this.returnEndDate;
    data['arrivalFromReturn'] = this.arrivalFromReturn;
    data['departureToReturn'] = this.departureToReturn;
    data['allowedWeightReturn'] = this.allowedWeightReturn;
    data['returnFlightNumber'] = this.returnFlightNumber;
    data['created_at'] = this.createdAt;
    data['returnEndDate1'] = this.returnEndDate1;
    data['returnEndDate2'] = this.returnEndDate2;
    data['arrivDate22'] = this.arrivDate;
    data['locStops'] = this.locStops;
    data['num_stops_return'] = this.numStopsReturn;
    data['loc_stops_return'] = this.locStopsReturn;
    data['hours_stops_return'] = this.hoursStopsReturn;
    data['hours_arriv'] = this.hoursArriv;
    return data;
  }
}

class BookFlightModel {
  String? flightNumber;
  String? weightAllowed;
  String? departureFrom;
  String? arrivalTo;
  String? departureDate;
  String? arrivalDate;
  String? returnFrom;
  String? returnTo;
  String? returnFlightNumber;
  String? returnWeightAllowed;
  String? returnDepartureDate;
  String? returnArrivalDate;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? nationality;
  String? passportNumber;
  String? adultsCount;
  String? tax;
  String? total;
  String? netTotal;

  BookFlightModel(
      {this.flightNumber,
      this.weightAllowed,
      this.departureFrom,
      this.arrivalTo,
      this.departureDate,
      this.arrivalDate,
      this.returnFrom,
      this.returnTo,
      this.returnFlightNumber,
      this.returnWeightAllowed,
      this.returnDepartureDate,
      this.returnArrivalDate,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.nationality,
      this.passportNumber,
      this.adultsCount,
      this.tax,
      this.total,
      this.netTotal});

  BookFlightModel.fromJson(Map<String, dynamic> json) {
    flightNumber = json['flight_number'];
    weightAllowed = json['weight_allowed'];
    departureFrom = json['departure_from'];
    arrivalTo = json['arrival_to'];
    departureDate = json['departure_date'];
    arrivalDate = json['arrival_date'];
    returnFrom = json['return_from'];
    returnTo = json['return_to'];
    returnFlightNumber = json['return_flight_number'];
    returnWeightAllowed = json['return_weight_allowed'];
    returnDepartureDate = json['return_departure_date'];
    returnArrivalDate = json['return_arrival_date'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    nationality = json['nationality'];
    passportNumber = json['passport_number'];
    adultsCount = json['adults_count'];
    tax = json['tax'];
    total = json['total'];
    netTotal = json['net_total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flight_number'] = this.flightNumber;
    data['weight_allowed'] = this.weightAllowed;
    data['departure_from'] = this.departureFrom;
    data['arrival_to'] = this.arrivalTo;
    data['departure_date'] = this.departureDate;
    data['arrival_date'] = this.arrivalDate;
    data['return_from'] = this.returnFrom;
    data['return_to'] = this.returnTo;
    data['return_flight_number'] = this.returnFlightNumber;
    data['return_weight_allowed'] = this.returnWeightAllowed;
    data['return_departure_date'] = this.returnDepartureDate;
    data['return_arrival_date'] = this.returnArrivalDate;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['nationality'] = this.nationality;
    data['passport_number'] = this.passportNumber;
    data['adults_count'] = this.adultsCount;
    data['tax'] = this.tax;
    data['total'] = this.total;
    data['net_total'] = this.netTotal;
    return data;
  }
}
