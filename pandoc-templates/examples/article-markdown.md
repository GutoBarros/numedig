---
title: Great Expectations
author:
- name: Sebastian Barfort 
  affiliation: University of Copenhagen 
  email: sebastian.barfort@econ.ku.dk
date: March 2014
abstract: Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enimad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
...

# 
hej hej hej polslsls olor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua [@fourcade13classsituat]. Notice that citation there [@healy02digittechnculturgoods]. Ut enimad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
$\varepsilon \epsilon$

![Tea and Biscuits are correlated but there may be identifiability issues.](figures/ols_75_redist_coefplot.png) 

# Theory
Hej @test Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enimad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enimad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla 

(@foo)  $I = \int \rho R^{2} dV$

Hej @foo pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enimad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.[^longnote]

(@joo)  $I = \int \rho R^{2} dV$

# Conclusion
Right now, your options for formatting bibliographies using Pandoc are to offload the work to biblatex (or natbib), or have pandoc handle everything via `citeproc` and CSL files. The latter way is simpler and cleaner, especially if we want to preserve the ability to easily generate both HTML and LaTeX/PDF outputs. You have to do two things. First, explicitly specify the "References" header. Second, pandoc does not (yet) support some standard layout options for bibliography entries---it will treat each entry like a regular paragraph, when we want the first lines of each bibliography entry to have no indentation, with subsequent lines (if any) to hang in from the margin. The LaTeX commands below the "References" header accomplish this . The LaTeX commands are ignored when HTML is produced, and do not show up in the output file.

Regression Results
==========================================================
                                Dependent variable:       
                         ---------------------------------
                                  Overall Rating          
                               (1)              (2)       
----------------------------------------------------------
Handling of Complaints       0.692***         0.682***    

                          (0.447, 0.937)   (0.470, 0.894) 
                                                          
No Special Privileges         -0.104           -0.103     
                         (-0.325, 0.118)  (-0.316, 0.109) 
                                                          
Opportunity to Learn          0.249            0.238*     
                         (-0.013, 0.512)   (0.009, 0.467) 
                                                          
Performance-Based Raises      -0.033                      
                         (-0.366, 0.299)                  
                                                          
Too Critical                  0.015                       
                         (-0.227, 0.258)                  
                                                          
Advancement                   11.011           11.258     
                         (-8.240, 30.262) (-0.779, 23.296)
                                                          
----------------------------------------------------------
Observations                    30               30       
R2                            0.715            0.715      
Adjusted R2                   0.656            0.682      
==========================================================
Note:                          *p<0.1; **p<0.05; ***p<0.01



[^longnote]: Here is one with multiple blocks.

# References
\setlength{\parindent}{-0.2in}
\setlength{\leftskip}{0.2in}
\setlength{\parskip}{8pt}
\vspace*{-0.2in}
\noindent
