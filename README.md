faker_x

No Docs yet:
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

Fake value generators marked in [<span style="color:black">black</span>] are available for all locales and generate the value differently according to that locale.
 Fake value generators marked in [<span style="color:green">green</span>] are globally shared between different locales and generate values using same methods for all locales.
Fake value generator marked in [<span style="color:blue">blue</span>] are the ones that are only available for that locale
<table>
<tr>
<th rowspan="12" scope="row">fa_ir</th>
<td><small>phone(2) </small></td>
<td><small><span style='color:black'>phone number</span> | <span style='color:black'>international phone number</span> </small></td>
</tr>
<tr>
<td><small>address(10) </small></td>
<td><small><span style='color:blue'>building name</span> | <span style='color:blue'>street suffix</span> | <span style='color:black'>state</span> | <span style='color:black'>address</span> | <span style='color:black'>city name</span> | <span style='color:black'>postcode</span> | <span style='color:black'>building number</span> | <span style='color:black'>street name</span> | <span style='color:blue'>alley</span> | <span style='color:blue'>street prefix</span></small></td>
</tr>
<tr>
<td><small>job(3) </small></td>
<td><small><span style='color:black'>job suffix</span> | <span style='color:black'>job title</span> | <span style='color:black'>job prefix</span></small></td>
</tr>
<tr>
<td><small>person(7) </small></td>
<td><small><span style='color:green'>last name en</span> | <span style='color:green'>first name en</span> | <span style='color:black'>first name male</span> | <span style='color:black'>full name</span> | <span style='color:black'>first name female</span> | <span style='color:black'>last name</span> | <span style='color:black'>first name</span></small></td>
</tr>
<tr>
<td><small>automotive(1) </small></td>
<td><small><span style='color:black'>license plate</span></small></td>
</tr>
<tr>
<td><small>color(2) </small></td>
<td><small><span style='color:green'>color hex</span> | <span style='color:black'>color name</span></small></td>
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
<td><small><span style='color:green'>http url</span> | <span style='color:green'>email</span> | <span style='color:green'>https url</span> | <span style='color:green'>password</span> | <span style='color:green'>safe email</span> | <span style='color:green'>ipv4</span> | <span style='color:green'>domain suffixes</span> | <span style='color:green'>user name</span> | <span style='color:green'>uri</span> | <span style='color:green'>disposable email</span> | <span style='color:green'>mac address</span> | <span style='color:green'>emoji</span> | <span style='color:green'>email from</span> | <span style='color:green'>ipv6</span> | <span style='color:green'>mail provider</span> | <span style='color:green'>domain name</span> | <span style='color:green'>disposable mail provider</span> | <span style='color:green'>user name from</span></small></td>
</tr>
<tr>
<td><small>image(2) </small></td>
<td><small><span style='color:green'>image</span> | <span style='color:green'>avatar uri</span></small></td>
</tr>
<tr>
<td><small>location(1) </small></td>
<td><small><span style='color:green'>geo location</span></small></td>
</tr>
<tr>
<th rowspan="12" scope="row">en_us</th>
<td><small>phone(2) </small></td>
<td><small><span style='color:black'>phone number</span> | <span style='color:black'>international phone number</span> </small></td>
</tr>
<tr>
<td><small>address(14) </small></td>
<td><small><span style='color:blue'>state abbr</span> | <span style='color:black'>state</span> | <span style='color:black'>address</span> | <span style='color:black'>city name</span> | <span style='color:blue'>neighborhood</span> | <span style='color:black'>building number</span> | <span style='color:blue'>city suffix</span> | <span style='color:blue'>street suffix</span> | <span style='color:blue'>street address</span> | <span style='color:black'>postcode</span> | <span style='color:black'>street name</span> | <span style='color:blue'>postcode format</span> | <span style='color:blue'>city prefix</span> | <span style='color:blue'>secondary address</span></small></td>
</tr>
<tr>
<td><small>job(3) </small></td>
<td><small><span style='color:black'>job suffix</span> | <span style='color:black'>job title</span> | <span style='color:black'>job prefix</span></small></td>
</tr>
<tr>
<td><small>person(7) </small></td>
<td><small><span style='color:green'>last name en</span> | <span style='color:green'>first name en</span> | <span style='color:black'>first name male</span> | <span style='color:black'>full name</span> | <span style='color:black'>first name female</span> | <span style='color:black'>last name</span> | <span style='color:black'>first name</span></small></td>
</tr>
<tr>
<td><small>automotive(1) </small></td>
<td><small><span style='color:black'>license plate</span></small></td>
</tr>
<tr>
<td><small>color(2) </small></td>
<td><small><span style='color:green'>color hex</span> | <span style='color:black'>color name</span></small></td>
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
<td><small><span style='color:green'>http url</span> | <span style='color:green'>email</span> | <span style='color:green'>https url</span> | <span style='color:green'>password</span> | <span style='color:green'>safe email</span> | <span style='color:green'>ipv4</span> | <span style='color:green'>domain suffixes</span> | <span style='color:green'>user name</span> | <span style='color:green'>uri</span> | <span style='color:green'>disposable email</span> | <span style='color:green'>mac address</span> | <span style='color:green'>emoji</span> | <span style='color:green'>email from</span> | <span style='color:green'>ipv6</span> | <span style='color:green'>mail provider</span> | <span style='color:green'>domain name</span> | <span style='color:green'>disposable mail provider</span> | <span style='color:green'>user name from</span></small></td>
</tr>
<tr>
<td><small>image(2) </small></td>
<td><small><span style='color:green'>image</span> | <span style='color:green'>avatar uri</span></small></td>
</tr>
<tr>
<td><small>location(1) </small></td>
<td><small><span style='color:green'>geo location</span></small></td>
</tr>
</table>



| Tables   |      Are      |  Cool |
|----------|:-------------:|------:|
| col 1 is |  left-aligned | $1600 |
| col 2 is |    centered   |   $12 |
| col 3 is | right-aligned |    $1 |