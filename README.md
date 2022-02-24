# AUTOMATED PLANNING: THEORY AND PRACTICE FINAL PROJECT
## Acknowledgements
I would like to express my gratitude to all those who gave me possibility to complete this project in specific as well as academic supporting in general that I received during the time of our studying at the Trento University. I wish to express my sincere thanks to *Professor Marco Roveri* for providing us with all the necessary facilities for the research.

## Introduction
This repository is dedicated to the final project of the courses *Automated Planning: Theory and Practice* from *professor Marco Roveri* from *Trento University*. This repository contains 4 different problems which is divided into each coresponding folder. Inside each folder you can find 2 *pddl files* (domain and problem) , a *txt file* which has the command line to run and a *txt file* which show the output after executed. For the *problem 4* it's about the *plansys2* problem which contain the *.cpp, .py and pddl* to demonstrate the plan on Plansys2. Fore more detail , please refer to the report pdf file inside this repo.

## Requirements
This projec is represent the *AI Planning field - a sub field of Artificial Intelligence*. The requirements and the install guide link (if necessary) is show below: 
- Ubuntu 20.04
- Planutils - [Installation link](https://github.com/AI-Planning/planutils)
- ROS2 - [Installation link](https://docs.ros.org/en/rolling/Installation.html)
- Plansys2 - [Installation link](https://intelligentroboticslab.gsyc.urjc.es/ros2_planning_system.github.io/build_instructions/index.html)

## Planner declared for each problem
Each problem may has different planner to executed. The list of planner is below:
- problem1 - **fast downward**
- problem2 - **fast downward**
- problem3 - **optic** or **smtplan** depend on the coresponding folder
Problem 4 is using **plansys2** so it will not need any planner declare here.
## How to run?
When you already have all the requirements above please go to each folder and executed plan follow the *cmd.txt* file of each folder. For example: 
Problem 1:
> & downward --alias lama-first domain.pddl problem.pddl

For problem 4, please refer to the **README.md** file inside the folder.

