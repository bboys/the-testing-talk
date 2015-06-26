The Testing Talk
=================

Plan:
Ax = b oplossen,
generic solver maken die geunit test is

Unit tests op individual solvers
Integration test op solver

solve(A, b)

use acceptance tests to check if the correct solver was used


-----

A lot of software contains bugs and or is undocumented.
This talk aims to solve this problem by encouraging a test driven development.

Error driven development
- Zodra je een bug vind daar een test voor schrijven die eerst faalt en die je daarna fixt

pFunit - unit testing framework fortran

voorbeelden in werkende matlab code en online

Testing Jargon
Four types of tests:
- Unit testing
- Integration testing
- Acceptance testing
   peformance tests

- Mutation testing

Continuous integration

Mocks Stubs, Spies, Factories
