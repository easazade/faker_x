<p align="center">

<img alt="CI Build Checks" src="https://img.shields.io/github/actions/workflow/status/easazade/faker_x/test.yaml?branch=master&style=flat">

<img alt="Package Version" src="https://img.shields.io/badge/pub-0.4.10-blue?style=flat">

<img alt="Pub Popularity" src="https://img.shields.io/pub/popularity/faker_x?style=flat">

<img alt="Pub Likes" src="https://img.shields.io/pub/likes/faker_x?style=flat">

<img alt="GitHub Repo stars" src="https://img.shields.io/github/stars/easazade/faker_x?style=flat">

<img alt="Pub Points" src="https://img.shields.io/pub/points/faker_x?style=flat">

<img alt="Pub Publisher" src="https://img.shields.io/pub/publisher/faker_x?style=flat">

<img alt="GitHub" src="https://img.shields.io/github/license/easazade/faker_x?style=flat">

</p>

<br>
BEST faker package available for dart that generates fake data you need.
<br>

## 🚀 Before you start
**faker_x** was not create just to be a typicall faker library but a library that is easy to contribute and grow. 

with faker libraries there are many localizations that need to be supported while each of them share many resources which fake values can be generated from, almost all of them will have different resources that only makes sence for that localization. being easy to change, contribute & maintain was one of the top metrics of development when I started creating this package. in order to give dart language a faker library it deserves while also valueing dart developers time, faker_x uses code generation to to generate its library code, so if you wish to add new resources or fake value generators, you only need focus on putting in the data instead of reading the source code and trying to figure it out (which you are free to do so if you wish). please read the contribution guide to read the step by step guide on how to change or add new values and resources to faker_x.

## 🪄 Usage

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


## 📜 Contribution Guide
Please Read [Contribution Guide](CONTRIBUTING.md). It is written in details to avoid any confusions and help you understand what you need to do to make your contributions. If there is any confusion or question you can open an issue or ask your question on your open pull request.


## 💎 Resources & 🌏 Localizations

Below you can see a table of all the locales and all the resource and values that are available for them.<br><br>
- Fake value generators marked in [<span style="color:black">black</span>] are available for all locales and generate the value differently according to that locale.<br>
 - Fake value generators marked in [<span style="color:green">green</span>]🟢 are globally shared between different locales and generate values using same methods for all locales.<br>
- Fake value generator marked in [<span style="color:blue">blue</span>]🔵 are the ones that are only available for that locale<br>
<table>
<tr>
<th rowspan="12" scope="row">fa_ir</th>
<td><small>phone(2) </small></td>
<td><small><span style='color:black'>phone number</span> | <span style='color:black'>international phone number</span> </small></td>
</tr>
<tr>
<td><small>address(10) </small></td>
<td><small><span style='color:blue'>building name 🔵</span> | <span style='color:blue'>street suffix 🔵</span> | <span style='color:black'>state</span> | <span style='color:black'>address</span> | <span style='color:black'>city name</span> | <span style='color:black'>postcode</span> | <span style='color:black'>building number</span> | <span style='color:black'>street name</span> | <span style='color:blue'>alley 🔵</span> | <span style='color:blue'>street prefix 🔵</span></small></td>
</tr>
<tr>
<td><small>job(1) </small></td>
<td><small><span style='color:black'>job title</span></small></td>
</tr>
<tr>
<td><small>person(7) </small></td>
<td><small><span style='color:green'>last name en 🟢</span> | <span style='color:green'>first name en 🟢</span> | <span style='color:black'>first name male</span> | <span style='color:black'>full name</span> | <span style='color:black'>first name female</span> | <span style='color:black'>last name</span> | <span style='color:black'>first name</span></small></td>
</tr>
<tr>
<td><small>automotive(1) </small></td>
<td><small><span style='color:black'>license plate</span></small></td>
</tr>
<tr>
<td><small>color(2) </small></td>
<td><small><span style='color:green'>color hex 🟢</span> | <span style='color:black'>color name</span></small></td>
</tr>
<tr>
<td><small>lorem(2) </small></td>
<td><small><span style='color:black'>sentence</span> | <span style='color:black'>word</span></small></td>
</tr>
<tr>
<td><small>animal(1) </small></td>
<td><small><span style='color:black'>animal name</span></small></td>
</tr>
<tr>
<td><small>vehicle(1) </small></td>
<td><small><span style='color:black'>car</span></small></td>
</tr>
<tr>
<td><small>internet(18) </small></td>
<td><small><span style='color:green'>http url 🟢</span> | <span style='color:green'>email 🟢</span> | <span style='color:green'>https url 🟢</span> | <span style='color:green'>password 🟢</span> | <span style='color:green'>safe email 🟢</span> | <span style='color:green'>ipv4 🟢</span> | <span style='color:green'>domain suffixes 🟢</span> | <span style='color:green'>user name 🟢</span> | <span style='color:green'>uri 🟢</span> | <span style='color:green'>disposable email 🟢</span> | <span style='color:green'>mac address 🟢</span> | <span style='color:green'>emoji 🟢</span> | <span style='color:green'>email from 🟢</span> | <span style='color:green'>ipv6 🟢</span> | <span style='color:green'>mail provider 🟢</span> | <span style='color:green'>domain name 🟢</span> | <span style='color:green'>disposable mail provider 🟢</span> | <span style='color:green'>user name from 🟢</span></small></td>
</tr>
<tr>
<td><small>image(2) </small></td>
<td><small><span style='color:green'>image 🟢</span> | <span style='color:green'>avatar uri 🟢</span></small></td>
</tr>
<tr>
<td><small>location(1) </small></td>
<td><small><span style='color:green'>geo location 🟢</span></small></td>
</tr>
<tr>
<th rowspan="12" scope="row">en_us</th>
<td><small>phone(2) </small></td>
<td><small><span style='color:black'>phone number</span> | <span style='color:black'>international phone number</span> </small></td>
</tr>
<tr>
<td><small>address(14) </small></td>
<td><small><span style='color:blue'>state abbr 🔵</span> | <span style='color:black'>state</span> | <span style='color:black'>address</span> | <span style='color:black'>city name</span> | <span style='color:blue'>neighborhood 🔵</span> | <span style='color:black'>building number</span> | <span style='color:blue'>city suffix 🔵</span> | <span style='color:blue'>street suffix 🔵</span> | <span style='color:blue'>street address 🔵</span> | <span style='color:black'>postcode</span> | <span style='color:black'>street name</span> | <span style='color:blue'>postcode format 🔵</span> | <span style='color:blue'>city prefix 🔵</span> | <span style='color:blue'>secondary address 🔵</span></small></td>
</tr>
<tr>
<td><small>job(3) </small></td>
<td><small><span style='color:blue'>job suffix 🔵</span> | <span style='color:black'>job title</span> | <span style='color:blue'>job prefix 🔵</span></small></td>
</tr>
<tr>
<td><small>person(7) </small></td>
<td><small><span style='color:green'>last name en 🟢</span> | <span style='color:green'>first name en 🟢</span> | <span style='color:black'>first name male</span> | <span style='color:black'>full name</span> | <span style='color:black'>first name female</span> | <span style='color:black'>last name</span> | <span style='color:black'>first name</span></small></td>
</tr>
<tr>
<td><small>automotive(1) </small></td>
<td><small><span style='color:black'>license plate</span></small></td>
</tr>
<tr>
<td><small>color(2) </small></td>
<td><small><span style='color:green'>color hex 🟢</span> | <span style='color:black'>color name</span></small></td>
</tr>
<tr>
<td><small>lorem(2) </small></td>
<td><small><span style='color:black'>sentence</span> | <span style='color:black'>word</span></small></td>
</tr>
<tr>
<td><small>animal(1) </small></td>
<td><small><span style='color:black'>animal name</span></small></td>
</tr>
<tr>
<td><small>vehicle(1) </small></td>
<td><small><span style='color:black'>car</span></small></td>
</tr>
<tr>
<td><small>internet(18) </small></td>
<td><small><span style='color:green'>http url 🟢</span> | <span style='color:green'>email 🟢</span> | <span style='color:green'>https url 🟢</span> | <span style='color:green'>password 🟢</span> | <span style='color:green'>safe email 🟢</span> | <span style='color:green'>ipv4 🟢</span> | <span style='color:green'>domain suffixes 🟢</span> | <span style='color:green'>user name 🟢</span> | <span style='color:green'>uri 🟢</span> | <span style='color:green'>disposable email 🟢</span> | <span style='color:green'>mac address 🟢</span> | <span style='color:green'>emoji 🟢</span> | <span style='color:green'>email from 🟢</span> | <span style='color:green'>ipv6 🟢</span> | <span style='color:green'>mail provider 🟢</span> | <span style='color:green'>domain name 🟢</span> | <span style='color:green'>disposable mail provider 🟢</span> | <span style='color:green'>user name from 🟢</span></small></td>
</tr>
<tr>
<td><small>image(2) </small></td>
<td><small><span style='color:green'>image 🟢</span> | <span style='color:green'>avatar uri 🟢</span></small></td>
</tr>
<tr>
<td><small>location(1) </small></td>
<td><small><span style='color:green'>geo location 🟢</span></small></td>
</tr>
</table>


