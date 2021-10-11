# Pewlett-Hackard-Analysis

## Overview
The purpose of this analysis is to determine how many Pewlett Hackard employees are nearing retirement. An SQL database was created in PostgreSQL to to determine retiree information regarding the departments, positions, and eligibility for a potential mentorship program.


## Results
- There are 90,398 positions in which an employee can retire from.

- There are 1,549 employees eligible for the mentorship program under the provided parameters.

- Senior Engineer is the title with the most employees eligible for retirement.
  ![Image of retiring titles](/Resources/retiring_titles_count.png)
  
- The Development department has the largest amount of retirement eligible staff.
  ![Image of retiring departments](/Resources/retiring_dept_count.png)

## Summary
- 90,398 positions will be impacted by retirement. The Development department will need to fill 8561 roles. There are 430 Senior Staff members in the mentorship_eligibilty table.\ 
![Image of mentorship_titles_count](/Resources/mentorship_titles_count.png)

- There is no overlap between employees in the unique_titles table and mentorship_eligibilty table, so the criteria for the mentorship program should be expanded. The list of eligible employees can be expanded to include more employees with the following query: ![Image of overlap_query](/Resources/overlap_query.png)

- Each department should review the amount of employees that are nearing retirement. The department leaders should utilize these queries to enable senior staff to prepare current non-senior staff for senior roles and develop training for new hires.
