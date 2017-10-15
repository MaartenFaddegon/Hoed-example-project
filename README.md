# Hoed-example-project

This is an example project showing how to use Hoed to find a defect.

To get started clone this repository and set up a stack environment for the project:

    git clone https://github.com/MaartenFaddegon/Hoed-example-project
    cd Hoed-example-project && stack setup

Then start the repl with

    stack ghci
    
And enter main to evaluate the annotated program (defined in src/Example.hs):    
    
    *Example Example> main
    === program output ===
    
    False
    
    === program terminated ===
    Please wait while the computation tree is constructed...
    
    === Statistics ===
    
    28 events
    4 computation statements
    4 nodes + 1 virtual root node in the computation tree
    4 edges in computation tree
    computation tree has a branch factor of 1.3333333333333333 (i.e the average number of children of non-leaf nodes)
    
We are now greeted by the Hoed debugger prompt

    hdb>
    
There are two options: we can either list computation statements with observe or be guided by the algorithmic debugger to find the defect.

An algorithmic debugging session could be as follows:


    hdb> adb
    ======================================================================= [0-0/4]
    isOdd 3
      
      = False
    ? wrong
    ======================================================================= [1-0/4]
    plusOne 3
      
      = 4
    ? right
    ======================================================================= [1-1/4]
    isOdd 3
      
      = False
    ? wrong
    ======================================================================= [1-1/4]
    isEven 4
      
      = False
    wrong    
    ======================================================================= [2-1/4]
    mod2 4
      
      = 2
    ? wrong
    ======================================================================= [3-1/4]
    Fault located! In:
    mod2 4
      
      = 2

The observe command can be used together with a regular expression to get an overview of the statements that match the expression

    hdb> observe is*
    --- stmt-1 ------------------------------------------
    isEven 4
      
      = False
    --- stmt-2 ------------------------------------------
    isOdd 3
      
      = False
    
    
When no argument is given to observe it prints all computation statements:

    hdb> observe
    --- stmt-1 ------------------------------------------
    isEven 4
      
      = False
    --- stmt-2 ------------------------------------------
    isOdd 3
      
      = False
    --- stmt-3 ------------------------------------------
    mod2 4
      
      = 2
    --- stmt-4 ------------------------------------------
    plusOne 3
      
      = 4
 
