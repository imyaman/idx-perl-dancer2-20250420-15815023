* Use your cf API URL.
* Change the app name in manifest.yml. 
* The app name will be used for URL. Ex) http://perl-dancer2-imyaman.youre.space


```

$ cf login -a https://api.cf.youre.space    # Use your cf API URL

$ git clone https://github.com/imyaman/cf-sample-app-perl-dancer2

$ cd cf-sample-app-perl-dancer2

$ vi manifest.yml    # Change the app name

$ cf push
```
