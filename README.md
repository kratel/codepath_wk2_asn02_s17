# Project 2 - Input/Output Sanitization

Time spent: **10** hours spent in total

## User Stories

The following **required** functionality is completed:

1\. [x]  Required: Import the Starting Database

2\. [x]  Required: Set Up the Starting Code

3\. [x]  Required: Review code for Staff CMS for Users

4\. [x]  Required: Complete Staff CMS for Salespeople
  * [x]  Required: index.php
  * [x]  Required: show.php
  * [x]  Required: new.php
  * [x]  Required: edit.php

5\. [x]  Required: Complete Staff CMS for States
  * [x]  Required: index.php
  * [x]  Required: show.php
  * [x]  Required: new.php
  * [x]  Required: edit.php

6\. [x]  Required: Complete Staff CMS for Territories
  * [x]  Required: index.php
  * [x]  Required: show.php
  * [x]  Required: new.php
  * [x]  Required: edit.php

7\. [x]  Required: Add Data Validations
  * [x]  Required: Validate that no values are left blank.
  * [x]  Required: Validate that all string values are less than 255 characters.
  * [x]  Required: Validate that usernames contain only the whitelisted characters.
  * [x]  Required: Validate that phone numbers contain only the whitelisted characters.
  * [x]  Required: Validate that email addresses contain only whitelisted characters.
  * [x]  Required: Add *at least 5* other validations of your choosing.
      * [x] Names contain whitelisted characters: Letters, Whitespace, and Single Quotes.
          * **Reason**: Many names have this format. Prevent unwanted characters.
      * [x] State Names contain whitelisted characters: Letter and Whitespace.
          * **Reason**: Many state names follow this format. Prevent unwanted characters.
      * [x] State Codes contain whitelisted characters: Uppercase Letters.
          * **Reason**: State Codes follow this format. Prevent unwanted characters.
      * [x] Territory Positions  contain whitelisted characters: Numbers.
          * **Reason**: Database restriction. Prevent unwanted characters.
      * [x] Territory Positions must be between 1 and 11 digits.
          * **Reason**: Database restriction.
      * [x] Territory state_id must exist.
          * **Reason**: state_id can be easily changed through the new.php file. Territory will not be inserted unless the state_id already exists in the current states table.

8\. [x]  Required: Sanitization
  * [x]  Required: All input and dynamic output should be sanitized.
  * [x]  Required: Sanitize dynamic data for URLs
  * [x]  Required: Sanitize dynamic data for HTML
  * [x]  Required: Sanitize dynamic data for SQL

9\. [x]  Required: Penetration Testing
  * [x]  Required: Verify form inputs are not vulnerable to SQLI attacks.
  * [x]  Required: Verify query strings are not vulnerable to SQLI attacks.
  * [x]  Required: Verify form inputs are not vulnerable to XSS attacks.
  * [x]  Required: Verify query strings are not vulnerable to XSS attacks.
  * [x]  Required: Listed other bugs or security vulnerabilities


The following advanced user stories are optional:

- [x]  Bonus: On "public/staff/territories/show.php", display the name of the state.

- [x]  Bonus: Validate the uniqueness of `users.username`.

- [ ]  Bonus: Add a page for "public/staff/users/delete.php".

- [ ]  Bonus: Add a Staff CMS for countries.

- [ ]  Advanced: Nest the CMS for states inside of the Staff CMS for countries


## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/link/to/your/gif/file.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

I had a strange error in the skeleton code provided. There was an extra comma in a sql statement for insert_user. This was causing me an error I did not expect, and would not provide a file location of the error. I traced all the sql statements that would have had to been executed before I found the extra comma.

Bugs Found:
* Edit pages would change the page title and headings to the attempted update strings.
    * **Resolved**: Created a new variable to store the current database values that would be used for the titles and headings.

## License

    Copyright [2017] [Santiago Salas]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
