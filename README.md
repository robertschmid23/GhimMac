# GhimMac - **Gh**ost **i**n **m**y **Mac**

GhimMac is loosely based on the original Log4J and it's successor Logback.  Despite Log4J presenting an excellent logging framework before Java had it's own, the makers of Java felt, for some reason, that a lobotimized logging framework was what they wanted instead.  Naturally Android and Swift have followed suit with absurdly useless logging frameworks which encourage developers to simply avoid logging as much as possible.

In contrast Log4J and GhimMac are configurable and can be set to log as much or as little as needed before or, perhaps, during logging.  It can also be wholly deactivated to maximize performance on release.  

Beside configurability, Log4J allows the implementation of custom Loggers for special purposes like logging to a database or to different files.  GhimMac has just begun but is already significantly more advanced than debugPrint or XLogger.

To configure GhimMac in an app, place a GhimMac.config file in the Resources or DeveloperAssets directories.  The format is JSON and looks like;

```json
{
	"threshold": ["WARN", "TIME"],
	"subsystem": "XLogger Subsystem",
	"category": "XLogger Category"
}
```

The values for threshold are one of 

DEBUG, INFO, WARN, ERROR

and one or more of 

SESSION, TIME, DATA_DUMPS

DEBUG, INFO, WARN & ERROR each limit the logging of lower levels so WARN will log WARN & ERROR but not DEBUG or INFO.
SESSION, TIME & DATA_DUMPS serve special functions
OFF overrides all logging and prevents any logging from occurring

To use the default logger simple use the singleton - 

```
Log.debug("This is a debug statement")
```

The output is not simply the message but also shows the file and line where the log statement was made

```
2022-10-07 14:38:16.732975-0500 xctest[13136:190224] [category] Debug Statement (GhimMacTests.swift:9)
```

GhimMac includes special functions for timing blocks of code.  This is useful for finding bottlenecks.  To time section of code or a function use

```
Log.markTimerStart("Starting process")
myprocess()
Log.markTime("First process done.")
secondProcess()
Log.markTimerEnd("Finished both processes")
```

The output shows the times and the duration of time passed.

```
2022-10-07 14:38:16.733151-0500 xctest[13136:190224] [category] Starting process (GhimMacTests.swift:11)
2022-10-07 14:38:31.720943-0500 xctest[13136:190224] [category] First process done. at 19:38:16.733 (0.003 ms) (GhimMacTests.swift:12)
2022-10-07 14:38:31.721230-0500 xctest[13136:190224] [category] Finished both processes at 19:38:31.721 (14.988 sec) (GhimMacTests.swift:13)
```

The timer functions also allow for a blockId so you can run different timers together.

ADVANCED SETTING

Logging only works while running in XCode.  To log when running without XCode do the following;

First:  Build the app with a Build Configuration with the word "Debug" or "Development" in the name.  This allows DEBUG only functions to be accessed. https://www.sobyte.net/post/2022-10/spm-in-xcode/

Second: Add a setting to the config file called "backup" with a path to file you will be able to access.  e.g. /Users/you/Desktop/MyApp

Third: Build and run the app from XCode.  Then halt the app.

Now when you start the app from within the device/simulator it will log to the file you defined.  This is very useful for debugging push notifcations and startup processes.

=====

Admittedly, I hate writing documentation.  More later.
