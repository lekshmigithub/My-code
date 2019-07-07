##Installation and Set up of Robert Framework for running the script

1. Install Python 2.7.14 or above. You can download it from (https://www.python.org/downloads/release/python-360/). There are two major versions of Python: 2.7.14 and 3.6.4. Code snippets in the blog post will be given for version 2.7.14. If there is any difference for version 3.6.4, a note will be made with appropriate changes to version 3.6.4. It's up to the reader to choose which version to install.

2. Install the python package manager [pip](https://pip.pypa.io/en/stable/installing/). It can be downloaded from its download page. All further installations in the blog post will make use of pip, so it's highly recommended to install it.

3. Download a development environment. The PyCharm Community edition will be used in the blog post. You can download it from the [Pycharm website] (https://www.jetbrains.com/pycharm/). You can use any IDE of your choice since code snippets are not IDE dependent.

Now, let's create our project.

1. Create the project in PyCharm IDE with File -> New Project.
2. Specify the location for the project (the last part of the path will be the project's name)

When developing a Python application, it's good practice to isolate its dependencies from others. With this, you can be sure that you are using the right version of the library in case there are multiple versions of it in your  PYTHON_PATH . (The PYTHON_PATH   variable is used in Python applications to find any dependency that is declared via import statement in python modules).

3. To do this, you need to install the virtual environment.

Install the Virtual Environment tool with the command  pip install virtualenv  in the prompt.
In the project root directory, create the environment with virtualenvvenv  in the prompt where venv  is the environment name.
4. If the environment is activated, your prompt will be prefixed with the environment's name as below:


5. If the environment has been activated successfully, install the Robot Framework with pip:


Once we are done with the prerequisites, let's choose an application that we are going to automate tests for. Check out a demo version of a Simple Travel Agency that allows you to search and book a flight.

We will create a simple test case that allows searching for any flight. This will be a UI test; hence, we need a tool that will help us manipulate with elements on a web page. Selenium WebDriver will suit this purpose as it's open-source, stable, and easy to use. Selenium WebDriver gives us as test developers a simple programming interface to interact with graphical elements on web pages. The only thing you need to do is to choose the appropriate WebDriver depending on the browser you would like to use.

In general, any test forms a test case. In the Robot Framework, test cases are created in test cases files that can have any extension from the following: .html, .xhtml, .htm, .tsv, .txt, .rst, .rest or .robot

Any test cases file forms a test suite file, regardless of the number of tests it has. Sometimes you need to group test suite files into higher-level suites. This can be achieved by creating directories. You can create a tree of directories with any depth by forming a logical structure. To do that, you should follow the application business logic or any other grouping criteria.

A test case is composed of keywords. We can use keywords created us (they are named as user keywords), or import keywords from Robot Framework libraries. It's up to a test developer to choose which one to use, but keep in mind the following recommendation: in a test case try to avoid any programming and low-level keywords by using high-level user keywords instead. It will make such a test case easy to read and easy to understand.


##Reference:

[https://dzone.com/articles/robot-framework-the-ultimate-guide-to-running-your]

## Run the code in your local

 ``` robot new.robot```



