# Contribution Guide

Reading this document will help you understand:
- Basic structure of the faker_x package
- How to add a single new value generator to existing resources. for example adding `cat_image` value generator to resource `image` whether you want to add it `globally` for all existing `locales` or just to a specific locale like `en_us`.
- How to localize global value generators. 
- How to add support for a new locale that doesn't exist for example `en_uk`.

## (TLDR) But First Let's See a Quick Example:
Let's say we want to add a new fake value generator to our `FakerX` class called `pet_name` that generates random pet names . this is going to be done in 3 steps

- Define a static String key in `DataKeys` class called `pet_name`
- Define a new datasource in the `animal.dart` resource file

```dart
const pet_name = StringDataSource(
  locale: Locales.en_us,
  dataKey: DataKeys.pet_name,
  values: [
    'Bucky',
    'Sparky',
    'Coco',
    'Wolfy',
    .
    .
  ]
);  
```
- run `./generate_and_test.sh` script. this script will create required code, tests & docs and will format, analyze code and run tests at the end.

##### DONE
Now there will be a new getter method that generates fake pet names in our `FakerX` class.

```dart
final myPetName = FakerX.defaultInstance.animal.petName;
```

### Understanding Package Structure
faker_x contains a `lib/src/locales` directory; this is where changes need to be added. 
in `lib/src/locales` you will find different locales like `en_us`, `fa_ir` etc including a `global`. 

in each locale directory there is structure like below. a datasources directory that contains a dart file for each `resource` like `job.dart` in each of these resource files there are one or several `DataSource` variables. these datasources are fake value generators. they will generate fake values for that resource.
```
├── en_us
    ├── datasources
    │   ├── address.dart
    │   ├── animal.dart
    │   ├── automotive.dart
    │   ├── color.dart
    │   ├── job.dart
    │   ├── lorem.dart
    │   ├── person.dart
    │   ├── phone.dart
    │   └── vehicle.dart
    └── en_us.dart
```

For example below you can see the code in `en/datasources/phone.dart` resource file with all the datasources in it. faker_x library uses `phone_number` and `international_phone_number` DataSources to generate those fake values for resource `phone` and locale `en_us`.

```dart

import 'package:faker_x/src/base/base.dart';

final phone_number = StringDataSource(
  dataKey: DataKeys.phone_number,
  locale: Locales.en_us,
  values: [],
  formats: [
    Format('##########'),
  ],
);

final international_phone_number = StringDataSource(
  dataKey: DataKeys.international_phone_number,
  locale: Locales.en_us,
  values: [],
  formats: [
    Format('+1##########'),
    Format('001##########'),
  ],
);

```

when we run code generation scripts result in our generated `FakerX` class will be seen like below example: 

```dart
final phoneNumber = FakerX.localized.en_us.phone.phoneNumber;
final international = FakerX.localized.en_us.phone.internationalPhoneNumber;
```

#### Explaining DataSources

a `DataSource` is basically a fake value provider. it either provides a fake value through a list of hardcoded values or a builder method (or a list of `Formats` in case of `StringDataSource`). 

There are 2 kinds of `DataSources` that we have `StringDataSource`, `TypeDataSource`
each `DataSource` must contain a dataKey defined in `DataKeys` class and a locale defined in `Locales` class.

Each `DataSource` can use either a list of `values` or a `builder` method to provide fake values.

##### StringDataSource

`StringDataSource` can be used to generate string values like names, urls and so forth. Below there are multiple examples of how StringDataSource can be used to generate fake string values.

- Using StringDataSource to generate string values from a list of string

```dart
const color_name = StringDataSource(
  locale: Locales.en_us,
  dataKey: DataKeys.color_name,
  values: [
    'AliceBlue',
    'AntiqueWhite',
    'Aqua',
    'Aquamarine',
    .
    .
  ]
);  
```

- Using StringDataSource to generate fake string values using builder method

```dart
final avatar_uri = StringDataSource.withBuilder(
  dataKey: DataKeys.avatar_uri,
  locale: Locales.en_us,
  builder: (_, __) =>
      'https://cloudflare-ipfs.com/avatar/${randomInt(1249)}.jpg',
);
```

NOTE: multiple types can be returned from `StringDataSource` which are `String`, `Format`, `StringOrFormat`

If the builder function needs to accept arguments by the user, the Below example suits that purpose.

```dart
class ImageArgs {
  final int width;
  final int height;
  final List<String> keywords;

  ImageArgs({
    @nonNullable required this.width,
    @nonNullable required this.height,
    @nonNullable required this.keywords,
  });
}

final image = StringDataSource<ImageArgs>.withBuilder(
  dataKey: DataKeys.image,
  locale: Locales.en_us,
  builder: (ImageArgs args, FakerXLocale locale) {
    return _imageUrl(args.width, args.height, args.keywords);
  },
);
```

first an `ImageArgs` class is defined then we define our datasource class as `StringDataSource<ImageArgs>` and then in our builder method parameter we define arguments as `(ImageArgs args, FakerXLocale locale) {...}`. 

**NOTE:** when defining an `Args` class like `ImageArgs` above 
- make sure to define constructor arguments as named arguments.
- If the argument is required make sure to add `@nonNullable` annotation on that argument. (this is because dart:mirror api does not support null safty)

- Using StringDataSource to generate fake values using formats.
alternatively you can use `formats` to generate fake values 

```dart



// In formats all # characters are converted into random int and all ? characters are converted into random letters and returned for 
// example below format can be used to generate fake values like : 1AL3456

const license_plate = StringDataSource(
  dataKey: DataKeys.license_plate,
  locale: Locales.en_us,
  values: [],
  formats: [
    // Alabama
    Format("#??####"), // 1AL3456
    Format("##??###"), // 32OL456
    // Alaska
    Format("### ???"), // 120 ALO
    // American Samoa
    Format("####"), // 9536
    // Arizona
    .
    .
  ],
);    

```

Also with Formats we can use string interpolation to get a random value from another DataSource that generates string values. Here is an example of `full_name` DataSource. we just need to put the `dataKey` of that `DataSource` inside `{{}}` like `{{first_name}}`.
make sure its not hardcoded meaning instead of using `{{first_name}}` you use this `{{${DataKeys.first_name}}}`

```dart
const full_name = StringDataSource(
  dataKey: DataKeys.full_name,
  locale: Locales.en_us,
  formats: [
    Format('{{${DataKeys.first_name_female}}} {{${DataKeys.last_name}}}', chance: 10),
    Format('{{${DataKeys.first_name_male}}} {{${DataKeys.last_name}}}', chance: 1),
  ],
  values: [],
);
```

In formats we can define chance occurrences for that format. to specify what are the chances we get a fake value from that format object as opposed to others in the same list. For example, in the above example, getting a fake value of `full_name` generated using the first format is 10 times more than the second format.

##### TypeDataSource

With TypeDataSources we can define a datasource that returns a value of the Type that we have defined for it

```dart
final geo_location = TypeDataSource<GeoLocation, dynamic>.withBuilder(
  dataKey: DataKeys.geo_location,
  locale: Locales.en_us,
  builder: (_, __) => GeoLocation(
    -90 + randomDouble() * 90 * 2,
    -180 + randomDouble() * 180 * 2,
  ),
);
```

define the return type in `lib/src/base/types.dart`

```dart

class GeoLocation {
  final double latitude;
  final double longitude;

  GeoLocation(this.latitude, this.longitude);

  @override
  String toString() => '$latitude - $longitude';
}
```

- In defining our datasource above `TypeDataSource<GeoLocation, dynamic>` we have set the value type to `GeoLocation` and builder method's argument type to `dynamic` since we don't require an argument from the user in our builder method.
- type `GeoLocation` must be defined in `lib/src/base/value_types.dart`

Alternatively we can use a list of values 

```dart
final product = TypeDataSource<Product, dynamic>(
  dataKey: DataKeys.geo_location,
  locale: Locales.en_us,
  values: [
    Product(...),
    Product(...),
    Product(...),
    Product(...),
    Product(...),
    .
    .
    .
  ],
);
```



### Add a new DataSource 
Let's say we want to add a new `DataSource` to generate cat images. we need to add it to the relevent resource. in this case we are going to add a new `cat_image` datasource to the `image` resource, so in our generated `FakerX` class we can have a getter method that generates cat images like below

```dart
final newCatImage = FakerX.defaultInstance.image.catImage;
```



Now that we want to add the Datasource we should decide whether we want to add it as a global datasource or only for a specific locale. if we add it as a global DataSource it will be available for all generated locales. all global DataSources are marked green in Resources and Localizations in docs.

For example DataSource `ipv4` for resource `internet` is defined globally. That means resource `internet` has a getter method `ipv4`, for all locales.

```dart
final i1 = FakerX.localized.fa_ir.internet.ipv4;
final i2 = FakerX.localized.en_us.internet.ipv4;
final i3 = FakerX.localized.es.internet.ipv4;
```

but if we define it only for a specific locale the generator getter method will only appear for that locale. For example, getter method `neighborhood` for resource `address` is only available for `en_us` locale.

Let's add `cat_image` datasource globally 

first we define a new datakey called `cat_image` in `DataKeys` class in `lib/src/base/keys.dart`

NOTE: Make sure the data key you use for the datasources are not plural. for example use `cat_image` instead of `cat_images` for datakey value

```dart
class DataKeys{
    // rest of the keys ...
    static const cat_image = 'cat_image';
}
```

Then we the `cat_image` datasource the resource file in global directory in `lib/src/locales/global/datasources/image.dart` 
```dart
final cat_image = StringDataSource.withBuilder(
  dataKey: DataKeys.cat_image,
  locale: Locales.en_us,
  builder: (_, __) => 'https://cci.com/cats/${randomInt(550)}.jpg',
);
```

If we want to add it only to a specific locale like `en_us` we add the datasource code above in `lib/src/locales/en_us/datasources/image.dart`

Now all we need to do is run the command bash script `generate_and_test.sh`. This script will generate `code`, `tests`, `example` & `runs` dart `format`, `analyze` & `test` commands. So run command.

`$ bash generate_and_test.sh`
**NOTE:** read the console logs it might tell you to run it again.


### Add a new locale
Let's say we want to add a new locale that does not exist in our library and so that we can generate fake values localized for that locale. let's try adding `en_uk` locale 

- First we need to run a script to create empty resource files and generate basic classes required. run below script

`$ dart scripts/create_locale.dart en_uk`

**NOTE:** read the console logs it might tell you to run it again.

- New files will be generated in the project with empty datasources that are required for each locale. you need to fill out these datasources with values (and more if you wish so).

```
├── en_uk
    ├── datasources
    │   ├── address.dart
    │   ├── animal.dart
    │   ├── automotive.dart
    │   ├── color.dart
    │   ├── job.dart
    │   ├── lorem.dart
    │   ├── person.dart
    │   ├── phone.dart
    │   └── vehicle.dart
    └── en_uk.dart
```

- then when you're done adding values you only need to run the generate command again.

`$ bash generate_and_test.sh`
**NOTE:** read the console logs it might tell you to run it again.

### Side Notes :
**NOTE:** With DataSources that use builder methods to generate the value we can use builder methods of other DataSources in them. for example:


```dart
final uri = StringDataSource<UriArgs>.withBuilder(
  dataKey: DataKeys.uri,
  locale: Locales.en_us,
  builder: (UriArgs args, _) {
    return Format('${args.protocol}://{{${DataKeys.domain_name}}}');
  },
);

final https_url = StringDataSource.withBuilder(
  dataKey: DataKeys.https_url,
  locale: Locales.en_us,
  builder: (_, __) {
    // here we are calling build method on uri DataSource defined above 
    // to return an https url
    // ! NOTE: call build method not builder callback
    return uri.build(UriArgs(protocol: 'https')),
  }
);
```

**NOTE:** There are a lot of warning and error messages to notify you if you have done something wrong and how you should fix them. so if you ever ran the generation command and saw an error or warning in the terminal just fix the code and rerun the command.

**NOTE:** even though a lot of checks have been set in scripts to predict and prevent if code is going to be generated incorrectly or with syntax error messages. this might happen. if you ran a generation command and there was syntax error in generated code in `lib/` directory just silence the syntax error by commenting them out or removing them so you can run generate command again without dart telling you there are syntax errors need to be fixed. doesn't matter if you change generated files manually to silence syntax errors, because they will be regenerated. then change your code if necessary and rerun the generation command.