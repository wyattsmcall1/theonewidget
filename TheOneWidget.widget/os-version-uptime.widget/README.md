# macOS Version with upTime
#### Ready for macOS Catalina!
Übersicht widget to display the macOS name, version and build on the desktop.  
Additionally it shows the system uptime.  
The Build number can be hidden and the widget is theme-able.  
Four themes are included: mono, paper, dark and color.

The widget is available as a REACT and CoffeeScript version. Both versions are essentially identical, **BUT** the CoffeeScript version is more reliable updating the upTime. Somehow, for no reason, the REACT version stops updating after a couple of hours.   
If anyone can tell me the reason for that behavior, I would be thankful and update the REACT version.

## Screenshots
##### Theme: color  

![3][image-3]  
![1][image-1]  

##### Theme: dark  

![2][image-2]

## Version
2.1

## History
- 2.1 
    - ready for macOS Catalina
    - switched to a more reliable command in the bash file to read the OS and Build version. No more hanging or error message while updating the data to display
    - cleaned up the code to follow better the REACT code rules
    - added auto switch icon depending on dark-/light-mode (Mojave and Catalina, only)
- 2.0.1 better error handling
- 2.0   updated to REACT
- 1.0   written in CoffeeScript  

## Acknowledgement

This widget is mostly based on Mike Panella's "[OS Version Pro](https://github.com/mpen01/os-version-pro)" widget. 

[image-1]:screenshots/myDark.png?raw=true
[image-2]:screenshots/dark.png?raw=true
[image-3]:screenshots/catalina.png?raw=true