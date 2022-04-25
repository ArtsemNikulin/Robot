*** Settings ***
Documentation    Contains 6 Data Quality checks on "TRN" database.    #file description

Resource   ../Resources/variables_keywords.robot    #file for storing used libraries and common variables
Library    DatabaseLibrary
Library    pyodbc
Library    OperatingSystem
Library    Collections

Force Tags      DB_checks    #types of tags used for test types. Will have all test TestCases

Suite Setup  Connect To Database Using Custom Params   pyodbc    ${string}    #connection to DB
Suite Teardown    Disconnect From Database    #connection closing

*** Test Cases ***
Check columns count for employees table
    [Tags]    employees table checks    #pesonal tags
    column count verification for hr.employees table

Check columns types for employees table
    [Tags]    employees table checks    #pesonal tags
    columns types verification for hr.employees table

Check coutries and regions consistency    #test case name
    [Tags]    countries table checks    #pesonal tags
    comparing of region_id distinct values from hr.countries   #use keyword

Check total row count    #test case name
    [Tags]    countries table checks    #pesonal tags
    total count verification of hr.countries    #use keyword

Check MAX value    #test case name
    [Tags]    departments table checks    #pesonal tags
    max verification for departnment_id in hr.departments    #use keyword

Check MIN value    #test case name
    [Tags]    departments table checks    #pesonal tags
    min verification for departnment_id in hr.departments    #use keyword






