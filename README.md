# README

This repository contains some files related to our work on a physical informed simulation of a door-spring system which will eventually be used to drive a procedural audio model of the creaking hinge sound.

This project contains three folders for each software we used:

* `Processing` contains the files related to the first 2 Processing sketches we made;
* `PureData` contains all the patches for the procedurally generated sound;
* `Godot` contains the game project folder with all the scene and resources for the simulation to work;

## Processing

In order to use these _processing_ sketches you need to install [Processing](https://processing.org/). You need also some additional libraries by Andreas "soyamo" Schlegel like:
* the [controlP5](http://www.sojamo.de/libraries/controlP5/), for the GUI to work properly;
* and the [oscP5](http://www.sojamo.de/libraries/oscP5/) library, to send messages to the PureData patch.
Yuo can download and automatically install them directly from the Processing IDE ([here](https://processing.org/reference/libraries/) some useful instructions). 

Below are the descriptions for these two sketches:
1. The first one (`door-sim`) can work as a standalone sketch (you'll only need the _controlP5_ library). You can play with it pressing the `spacebar` in order to apply a force to the door and trigger the simulation. You can move the sliders to change some values of the physics like the _mass_ of the door, the _stiffness_ of the spring and so on;
2. The second one (`door-sim-osc`) is meant to work tandem with the associated _PureData_ patch, to add some sounds to the simulation (read below for more detailed information). In order for the two programs to communicate with eachother you need to have also the _oscP5_ library.

## PureData

In order to use these patches you need to have [Pure Data](http://puredata.info/) up and running and to install some additional libraries:
* _iemnet_;
* _osc_ by Martin Peach;
If you need more information on how to install the libraries please send us a line to the `info [at] limulo [dot] net`.

Inside the PureData folder you will find other three subfolders:

* `for_processing` : this is the patch devised to be used with the second _Processing_ sketch (`door-sim-osc`). Once you opened it, click on the `DSP` toggle to start the audio computations and on the `OSC` toggle to start the communication between the patch and the _processing_sketck. Then you can play with the _processing_ sketch the same way you did with the first one (`door-sim`);
* `for_heavy` : this is a modified version of the previous one in order to use it with the [Heavy sound tools](https://enzienaudio.com/) by _enzienaudio_. This tools have been used to obtain a VST2 and a JavaScritp version of the patch;
* `for_godot` : this is another modified version of the first patch, devised to be used with the _Godot game engine_ (see below);

## Godot

This folder contains the game project folder for a 3D version of the spring-door simulation. This game is meant to be used only for demonstrational purposes during the [Game Engines and Game sounds](https://limulo.github.io/game-sound-sae2017/) classes.

This project has been realized with a custom modification of the [Godot game engine](https://godotengine.org/) v2.1. The custom modifications we made integrates the [libpd](http://libpd.cc/) library in order for Godot to use PureData as its optional game audio engine.

This Godot integartion project is still a work-in-progress. You can find something on [this](https://github.com/Limulo/godot) repository (you will need to clone/download it and compile Godot from the source). For more information about that please feel free to drop us a line to the `info [at] limulo [dot]`. net`.

## Contacts
For more additional information about this project feel free to drop us a line to the `info [at] limulo [dot]`. net`. Enjoy!
