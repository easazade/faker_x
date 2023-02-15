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