# Robotlegs and Starling example

Simple example project to present Robotlegs "bender" and Starling integration.

# TODO

- comment example

## Overview

This example is demonstrating integration between [Starling](https://github.com/PrimaryFeather/Starling-Framework) and [Robotlegs 2](https://github.com/robotlegs/robotlegs-framework). It is using [robotlegs-extensions-starling](https://github.com/Vj3k0/robotlegs-extensions-starling) extension for connecting those 2 frameworks.

Example means to provide information on how to use context, views and mediators.

## Usage instructions

Example will create simple rectangular object and place it on sceen. Click on object to change its color.

## How it works

First of, create instance of Starling and pass the start class and reference to stage. 

Then context is created, using `StarlingBundle` for initialization:

	context = new Context().extend(StarlingBundle).configure(GameConfig, _starling.stage);

It is relevant to note that `MainView` that is Starling starting class needs to have mediator assigned:

	mediatorMap
		.map(MainView)
		.toMediator(MainViewMediator);

This is because it will be used to listen to when `MainView` is finished initializing and then relay the event to trigger `SetupCommand`. In that command, sample object is placed on stage and its mediator is created.

Clicking on an object on scene will dispatch custom view event which is caught in its mediator. Mediator will then dispatch `SampleEvent` which is in turn tied to `SampleCommand`.Then, event is dispatched for mediator to catch and instruct view to update color.