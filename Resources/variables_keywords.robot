*** Settings ***
Documentation   Robot resources and variables for all tests

Library    DatabaseLibrary
Library    pyodbc
Library    OperatingSystem
Library    Collections

*** Variables ***
${string} =    "Driver={SQL Server Native Client 11.0};Server=EPPLWARW009D\\SQLEXPRESS;Trusted_Connection=yes;TRN"

*** Keywords ***
comparing of region_id distinct values from hr.countries
    ${expected_result}=    set variable    4
    ${actual_result}=  set variable    select distinct region_id as region_consistency from TRN.hr.countries;
    row count is equal to x    ${actual_result}    ${expected_result}

total count verification of hr.countries
    ${expected_result}=    set variable    25
    ${actual_result}=  set variable    select * from TRN.hr.countries;
    row count is equal to x    ${actual_result}    ${expected_result}

max verification for departnment_id in hr.departments
    ${expected_result}=    set variable    [(11, )]
    ${query}    query    SELECT max(department_id) FROM TRN.hr.departments
    ${actual_result}=    convert to string    ${query}
    should be equal    ${actual_result}    ${expected_result}

min verification for departnment_id in hr.departments
    ${expected_result}=    set variable    [(1, )]
    ${query}    query    SELECT min(department_id) FROM TRN.hr.departments
    ${actual_result}=    convert to string    ${query}
    should be equal    ${actual_result}    ${expected_result}

column count verification for hr.employees table
    ${expected_result}=    set variable    [(10, )]
    ${script}=    get file    SQLScripts/SQLQuery_1.sql
    ${query_result}=    query    ${script}
    ${actual_result}=    convert to string    ${query_result}
    should be equal    ${actual_result}    ${expected_result}

columns types verification for hr.employees table
    ${expected_result}=    get file    Expected_results/employees_exp_resu.txt
    ${script}=    get file    SQLScripts/SQLQuery_2.sql
    ${query_result}=    query    ${script}
    ${actual_result}=    convert to string    ${query_result}
    should be equal    ${actual_result}    ${expected_result}