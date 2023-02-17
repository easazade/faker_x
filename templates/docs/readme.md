{{tags}}
<br>
BEST faker package available for dart that generates fake data you need.
<br>

### 🚀 Before you start
faker_x was created not just to be a typicall faker library but a library that is easy to contribute. 

with faker libraries there are many localizations that need to be supported while each of them share many resources which fake values can be generated from, almost all of them will have different resources that only makes sence for that localization. being easy to change, contribute & maintain was one of the top metrics of development when I started creating this package. in order to give dart language a faker library it deserves while also valueing dart developers time, faker_x uses code generation to to generate its library code, so if you wish to add new resources and fake value generators you only focus on putting in the data instead of reading the source code trying to figure it out (which you are free to do so if you wish). please read the contribution guide to read the step by step guide on how to change or add new values and resources to faker_x.

### 🪄 Usage

Here is some of the values faker_x can generate. for complete details checkout Localizations

```dart
final phoneNumber = FakerX.localized.en_us.phone.phoneNumber;
final address = FakerX.localized.en_us.address.address;
final jobTitle = FakerX.localized.en_us.job.jobTitle;
final fullName = FakerX.localized.en_us.person.fullName;
final colorHex = FakerX.localized.en_us.color.colorHex;
final sentence = FakerX.localized.en_us.lorem.sentence;
final car = FakerX.localized.en_us.vehicle.car;
final email = FakerX.localized.en_us.internet.email;
final ipv4 = FakerX.localized.en_us.internet.ipv4;
final emoji = FakerX.localized.en_us.internet.emoji;
final avatarUri = FakerX.localized.en_us.image.avatarUri;
final geoLocation = FakerX.localized.en_us.location.geoLocation;

final emailFrom = FakerX.localized.en_us.internet.emailFrom(
      firstName: 'alireza',
      lastName: 'easazade',
      provider: 'gmail.com',
    );

final image = FakerX.localized.en_us.image.image(
          width: 300,
          height: 400,
          keywords: ['pet', 'dog'],
        );    
```

You can also 

### 💎 Resources

### 📜 Contribution Guide

Basically this is a library to generate fake data for dart language with ease.
The main reason I'm creating this library is to create a library that is very easy/fast to contribute when it 
comes to 
- add a new language support 
- add specific fake data providers for only certain locales without decreasing the maintainability of the project
- make fake data generation specific for each locale. ( eg addresses that are generated for en_US can be in different format from addresses that are generated for fa_IR, not necessarily but that feature should exist).


notes for later to be used in docs :
should run regenerate_base_classes when added a new datasoure file.

make read me nice look at https://www.npmjs.com/package/@faker-js/faker

remeber one of the most important thing about this library is that if a developer wants to add 
like a new fake value to a his/her locale it will be easy. since we support localized custom fake values. 

Add contribution guide to add a new fake value (datasource) to a locale or all locales

add fancy tags to readme

### 🌏 Localizations

{{table_of_locales}}