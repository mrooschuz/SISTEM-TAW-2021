# SISTEM-Test Automation Workshop-2021
Installation instructions and examples from the test automation with Robot Framework presented at [SISTEM 2021](https://sistemconf.com/)

## Installation
1. Install [Python 3](https://www.python.org/downloads/)
1. Add the explicit path to your python.exe file to your PATH environment variable [environment variables](https://stackoverflow.com/questions/44272416/how-to-add-a-folder-to-path-environment-variable-in-windows-10-with-screensho)
    1. Add another path that leads to Scripts folder in that same location
    ![Example](https://github.com/mrooschuz/SISTEM-TAW-2021/blob/main/EnvironmentVariables.png)
    3. Note: any CLI windows that are open will not automatically detect these changes. Close and re-open any command prompts or terminals
1. Create a folder called c:\WebDrivers
    1. Add this path to your PATH environment variable or create a new entry specifically for this
    1. Navigate to [Chrome WebDriver](https://chromedriver.chromium.org/) and download the latest webdriver to this location (extract the contents of the zip file to the root of this location)
    1. Do the same for any other web drivers for browsers you want to test with, such as Firefox or Edge
1. Run the following pip install commands:
    1. `pip install --upgrade robotframework`
    1. `pip install --upgrade robotframework-seleniumlibrary`
    1. `pip install --upgrade robotframework-debuglibrary`

### Test the installation
1. Clone or download this repo locally and navigate to the Swag Example folder.
1. Open a terminal or CLI at this location and run the following command: `robot --outputdir .\Output .\TestSuites`
1. The test run should be successful and the Output folder will contain the test reports

## Important Links
* https://robotframework.org/
* https://robotframework.org/robotframework/
* https://testautomationu.applitools.com/web-element-locator-strategies/
* https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
* https://github.com/fkromer/awesome-robotframework/blob/master/README.md
* https://github.com/adrianyorke/robotframework-cookbook
* https://ultimateqa.com/dummy-automation-websites/#9_Demoqa
