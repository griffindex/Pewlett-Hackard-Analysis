# Pewlett-Hackard-Analysis

## Overview of the analysis: Explain the purpose of this analysis.
The purpose of this analysis is to determine how many Pewlett Hackard employees are nearing retirement. An SQL database was created in PostgreSQL to to determine retiree information regarding the departments, positions, and eligibility for a potential mentorship program.


## Results: Provide a bulleted list with four major points from the two analysis deliverables. Use images as support where needed.
- There are 90,398 positions in which an employee can retire from.

- There are 1,549 employees eligible for the mentorship program under the provided parameters.

- Senior Engineer is the title with the most employees eligible for retirement.

- The Development department has the largest amount of retirement eligible staff.

## Summary: Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."
- 90,398 positions will be impacted by retirement. The Development department will need to fill 8561 roles. 

- There is no overlap between employees in the unique_titles table and mentorship_eligibilty table, so the criteria for the mentorship program should be expanded. The list of eligible employees can be expanded to include more employees with the following query:

- Each department should review the amount of employees that are nearing retirement. The department leaders should utilize these queries to enable senior staff to prepare current non-senior staff for senior roles and develop training for new hires.