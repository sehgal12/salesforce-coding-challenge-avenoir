

# Coding Assessment Overview
This assessment requires you to complete 2 exercises in a Salesforce Developer org and submit your work via a pull request.

<u>**You have up to 3 hours to complete this assessment**</u>

### Suggestions

* Please organize your code well, it will be reviewed by humans
* Write test classes for all your APEX code
* Use this repository to store your work
* Do not use public libraries or packages which are not already in the org
* [Submit a pull request](https://help.github.com/articles/creating-a-pull-request/) once you are happy with your work.
* Treat this pull request as if you’re at work submitting it to your colleagues

### Getting Started

It's recommended that you use VSCode for your development, but you may use whichever IDE/dev tools you prefer.

Before starting the assessment there are a few things we need you to do:

1. [Setup a dev org](/DevOrgSetupInstructions.pdf)
2. Clone this repository
3. Using the credentials that have been emailed to you, authorize the salesforce org from VSCode or from the command line with:
`sfdx force:auth:web:login -a avenoir-coding-challenge`
4. Install this project in the org with the following command:
`sfdx force:source:deploy -u avenoir-coding-challenge -x manifest/package.xml`
5. You can then open the org in a browser with:
`sfdx force:org:open -u avenoir-coding-challenge`

Now you should be ready to begin the assessment
1.  You will receive a pdf at the start of exercise with the problem description
3.  After you're finished with the exercises, commit your code and open a pull request
4.  Finally, go back to the Test Panel, enter the link to the pull request, and click "End Assessment" 

That's it! Good luck!
