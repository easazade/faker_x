import "package:fake_it/fake_it.dart";

Future main(List<String> args) async {
// fa_ir - phone
  print("phone_number = ${FakeIt.localized.fa_ir.phone.phoneNumber}");
  print(
      "international_phone_number = ${FakeIt.localized.fa_ir.phone.internationalPhoneNumber}");

// fa_ir - address
  print("building_name = ${FakeIt.localized.fa_ir.address.buildingName}");
  print("street_suffix = ${FakeIt.localized.fa_ir.address.streetSuffix}");
  print("state = ${FakeIt.localized.fa_ir.address.state}");
  print("address = ${FakeIt.localized.fa_ir.address.address}");
  print("city_name = ${FakeIt.localized.fa_ir.address.cityName}");
  print("postcode = ${FakeIt.localized.fa_ir.address.postcode}");
  print("building_number = ${FakeIt.localized.fa_ir.address.buildingNumber}");
  print("street_name = ${FakeIt.localized.fa_ir.address.streetName}");
  print("alley = ${FakeIt.localized.fa_ir.address.alley}");
  print("street_prefix = ${FakeIt.localized.fa_ir.address.streetPrefix}");

// fa_ir - job
  print("job_suffix = ${FakeIt.localized.fa_ir.job.jobSuffix}");
  print("job_title = ${FakeIt.localized.fa_ir.job.jobTitle}");
  print("job_prefix = ${FakeIt.localized.fa_ir.job.jobPrefix}");

// fa_ir - person
  print("last_name_en = ${FakeIt.localized.fa_ir.person.lastNameEn}");
  print("first_name_en = ${FakeIt.localized.fa_ir.person.firstNameEn}");
  print("first_name_male = ${FakeIt.localized.fa_ir.person.firstNameMale}");
  print("full_name = ${FakeIt.localized.fa_ir.person.fullName}");
  print("first_name_female = ${FakeIt.localized.fa_ir.person.firstNameFemale}");
  print("last_name = ${FakeIt.localized.fa_ir.person.lastName}");
  print("first_name = ${FakeIt.localized.fa_ir.person.firstName}");

// fa_ir - automotive
  print("license_plate = ${FakeIt.localized.fa_ir.automotive.licensePlate}");

// fa_ir - color
  print("color_hex = ${FakeIt.localized.fa_ir.color.colorHex}");
  print("color_name = ${FakeIt.localized.fa_ir.color.colorName}");

// fa_ir - lorem
  print("sentence = ${FakeIt.localized.fa_ir.lorem.sentence}");
  print("word = ${FakeIt.localized.fa_ir.lorem.word}");

// fa_ir - animal
  print("animal_name = ${FakeIt.localized.fa_ir.animal.animalName}");

// fa_ir - vehicle
  print("car = ${FakeIt.localized.fa_ir.vehicle.car}");

// fa_ir - internet
  print("http_url = ${FakeIt.localized.fa_ir.internet.httpUrl}");
  print("email = ${FakeIt.localized.fa_ir.internet.email}");
  print("https_url = ${FakeIt.localized.fa_ir.internet.httpsUrl}");
  print("safe_email = ${FakeIt.localized.fa_ir.internet.safeEmail}");
  print("ipv4 = ${FakeIt.localized.fa_ir.internet.ipv4}");
  print("domain_suffixes = ${FakeIt.localized.fa_ir.internet.domainSuffixes}");
  print("user_name = ${FakeIt.localized.fa_ir.internet.userName}");
  print(
      "disposable_email = ${FakeIt.localized.fa_ir.internet.disposableEmail}");
  print("mac_address = ${FakeIt.localized.fa_ir.internet.macAddress}");
  print("emoji = ${FakeIt.localized.fa_ir.internet.emoji}");
  print("ipv6 = ${FakeIt.localized.fa_ir.internet.ipv6}");
  print("mail_provider = ${FakeIt.localized.fa_ir.internet.mailProvider}");
  print("domain_name = ${FakeIt.localized.fa_ir.internet.domainName}");
  print(
      "disposable_mail_provider = ${FakeIt.localized.fa_ir.internet.disposableMailProvider}");

// fa_ir - image
  print("avatar_uri = ${FakeIt.localized.fa_ir.image.avatarUri}");

// fa_ir - location
  print("geo_location = ${FakeIt.localized.fa_ir.location.geoLocation}");

// en_us - phone
  print("phone_number = ${FakeIt.localized.en_us.phone.phoneNumber}");
  print(
      "international_phone_number = ${FakeIt.localized.en_us.phone.internationalPhoneNumber}");

// en_us - address
  print("state_abbr = ${FakeIt.localized.en_us.address.stateAbbr}");
  print("state = ${FakeIt.localized.en_us.address.state}");
  print("address = ${FakeIt.localized.en_us.address.address}");
  print("city_name = ${FakeIt.localized.en_us.address.cityName}");
  print("neighborhood = ${FakeIt.localized.en_us.address.neighborhood}");
  print("building_number = ${FakeIt.localized.en_us.address.buildingNumber}");
  print("city_suffix = ${FakeIt.localized.en_us.address.citySuffix}");
  print("street_suffix = ${FakeIt.localized.en_us.address.streetSuffix}");
  print("street_address = ${FakeIt.localized.en_us.address.streetAddress}");
  print("postcode = ${FakeIt.localized.en_us.address.postcode}");
  print("street_name = ${FakeIt.localized.en_us.address.streetName}");
  print("postcode_format = ${FakeIt.localized.en_us.address.postcodeFormat}");
  print("city_prefix = ${FakeIt.localized.en_us.address.cityPrefix}");
  print(
      "secondary_address = ${FakeIt.localized.en_us.address.secondaryAddress}");

// en_us - job
  print("job_suffix = ${FakeIt.localized.en_us.job.jobSuffix}");
  print("job_title = ${FakeIt.localized.en_us.job.jobTitle}");
  print("job_prefix = ${FakeIt.localized.en_us.job.jobPrefix}");

// en_us - person
  print("last_name_en = ${FakeIt.localized.en_us.person.lastNameEn}");
  print("first_name_en = ${FakeIt.localized.en_us.person.firstNameEn}");
  print("first_name_male = ${FakeIt.localized.en_us.person.firstNameMale}");
  print("full_name = ${FakeIt.localized.en_us.person.fullName}");
  print("first_name_female = ${FakeIt.localized.en_us.person.firstNameFemale}");
  print("last_name = ${FakeIt.localized.en_us.person.lastName}");
  print("first_name = ${FakeIt.localized.en_us.person.firstName}");

// en_us - automotive
  print("license_plate = ${FakeIt.localized.en_us.automotive.licensePlate}");

// en_us - color
  print("color_hex = ${FakeIt.localized.en_us.color.colorHex}");
  print("color_name = ${FakeIt.localized.en_us.color.colorName}");

// en_us - lorem
  print("sentence = ${FakeIt.localized.en_us.lorem.sentence}");
  print("word = ${FakeIt.localized.en_us.lorem.word}");

// en_us - animal
  print("animal_name = ${FakeIt.localized.en_us.animal.animalName}");

// en_us - vehicle
  print("car = ${FakeIt.localized.en_us.vehicle.car}");

// en_us - internet
  print("http_url = ${FakeIt.localized.en_us.internet.httpUrl}");
  print("email = ${FakeIt.localized.en_us.internet.email}");
  print("https_url = ${FakeIt.localized.en_us.internet.httpsUrl}");
  print("safe_email = ${FakeIt.localized.en_us.internet.safeEmail}");
  print("ipv4 = ${FakeIt.localized.en_us.internet.ipv4}");
  print("domain_suffixes = ${FakeIt.localized.en_us.internet.domainSuffixes}");
  print("user_name = ${FakeIt.localized.en_us.internet.userName}");
  print(
      "disposable_email = ${FakeIt.localized.en_us.internet.disposableEmail}");
  print("mac_address = ${FakeIt.localized.en_us.internet.macAddress}");
  print("emoji = ${FakeIt.localized.en_us.internet.emoji}");
  print("ipv6 = ${FakeIt.localized.en_us.internet.ipv6}");
  print("mail_provider = ${FakeIt.localized.en_us.internet.mailProvider}");
  print("domain_name = ${FakeIt.localized.en_us.internet.domainName}");
  print(
      "disposable_mail_provider = ${FakeIt.localized.en_us.internet.disposableMailProvider}");

// en_us - image
  print("avatar_uri = ${FakeIt.localized.en_us.image.avatarUri}");

// en_us - location
  print("geo_location = ${FakeIt.localized.en_us.location.geoLocation}");
}
