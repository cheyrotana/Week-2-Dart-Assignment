enum Skill { FLUTTER, DART, OTHER }

class Address {
  String street;
  String city;
  double zipCode;

  Address(this.city, this.street, this.zipCode);
}

class Employee {
  String _name;
  double _baseSalary;
  List<Skill> _skill;
  int _yearOfExperience;
  Address _address;

  String get name {
    return _name;
  }

  double get baseSalary {
    return _baseSalary;
  }

  List<Skill> get skill {
    return _skill;
  }

  int get yearOfExperience {
    return _yearOfExperience;
  }

  Address get address {
    return _address;
  }

  Employee(
    this._name,
    this._baseSalary,
    this._skill,
    this._yearOfExperience,
    this._address,
  );

  Employee.mobileDeveloper(
    this._name,
    this._baseSalary,
    this._yearOfExperience,
    this._address,
  ) : _skill = [Skill.DART, Skill.FLUTTER];

  double computeSalary() {
    double totalSalary = _baseSalary;

    totalSalary += yearOfExperience * 2000;

    for (Skill skills in _skill) {
      if (skills == Skill.FLUTTER) {
        totalSalary += baseSalary + 5000;
      } 
      else if (skills == Skill.DART) {
        totalSalary += baseSalary + 3000;
      } 
      else {
        totalSalary += baseSalary + 1000;
      }
    }

    return totalSalary;
  }

  void printDetails() {
    print('Employee: $name, Base _salary: \$${computeSalary()}');
  }
}

void main() {
  var address1 = Address('CityA', 'StreetA', 12345);
  var emp1 = Employee.mobileDeveloper('Sokea', 40000, 3, address1);
  emp1.printDetails();

  var address2 = Address('CityB', 'StreetB', 54321);
  var emp2 = Employee.mobileDeveloper('Ronan', 45000, 5, address2);
  emp2.printDetails();
}
