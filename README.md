# RTS Game
As an exploratory project, we decided to create an [RTS game](https://en.wikipedia.org/wiki/Real-time_strategy) in [Ruby on Rails](https://www.rubyonrails.org/) ↴

![RTS Screenshot](https://wallpaperaccess.com/full/708596.jpg)

There are ***two*** aspects to this →

 - ***front-end*** (what the user interacts with)
 - ***back-end*** (how the game is managed)

The big difference with what we're trying to do is how the back-end is managed (Ruby on Rails).

We'll have the game engine in the front-end (JS), with the back-end being the equivalent of an API. The RoR app will have an admin area, into which you're able to manage / upload factions, units, vehicles & buildings, as well as being able to customize various UI elements of the game.

The goal is to get as close to "Red Alert 2" as possible. No, we won't achieve the same fidelity as the Westwood classic... but if we can get to a level where the gameplay, system and functionality seem as natural, we'll be doing well.

The following explains how it works...

----

1. [Engine][engine]
2. [Front-End][front-end]
3. [Back-End][back-end]
4. [Marketing][marketing]
5. [Contributions][contributions]

----

<!-- ################################### -->
<!--               Engine                -->
<!-- ################################### -->

# 1. Engine

The most important thing is the **engine**.

Engines (not just "game" engines, but generally) are transferrable between projects, and should be capable of being able to handle customized inputs (such as storylines etc), whilst rendering/managing the various assets made available in the system.

There are many ways to create engines for web-centric applications. However, with a game, you have to consider how the assets are going to be rendered. I will take some time to briefly explain how to do this here:

**1. 2.5D**<br />
When considering "game" engines is there are *two* ways to manage the clientside aspects of the game - 2D / 3D.

The way in which you render assets is of vital importance. It defines much of the scope of the game's engine, and allows you to determine exactly what you're offering to the buyer. The choice is basically between 2D and 3D.

 - [2D game engines](https://en.wikipedia.org/wiki/2D_computer_graphics) are driven by [sprites](https://en.wikipedia.org/wiki/Sprite_(computer_graphics)). Sprites are 2-dimensional images which are used to represent objects on a screen. Whilst early video games ([platformers](https://en.wikipedia.org/wiki/Platform_game), [scrollers](https://en.wikipedia.org/wiki/Side-scrolling_video_game) etc) were almost entirely driven by sprites.
 
 - [3D game engines](https://en.wikipedia.org/wiki/3D_computer_graphics) are completely different. Rather than sprites, they deal with polygons + texturemaps. Depending on the complexity of the engine (how much graphical fidelity it provides), there may be other effects provided, such as normal maps, bump maps, specularity and reflectance. 
  
Since 3D is *far* beyond my skill level presently, so we'll be pursuing a [2.5D](https://en.wikipedia.org/wiki/2.5D) engine. 
 
This uses sprites which have been previously mocked-up in a 3D modelling program to provide the illusion of 3D through "isometric" projection (no, it's not isometric but we'll call it that for the time being). The trick with this is to create a multitude of angles for the various assets (buildings don't need to move, so they will remain constant - but units/vehicles will need multiple directions).
 
 **2. HTML/CSS**<br />
I aspire to make the engine deliver HTML/CSS based assets (playable in a browser).

Whilst [WebGL](https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API) exists, and will likely be required for certain elements within the system, I want to make the system as natively-driven as possible. This means using HTML & CSS to create/manage the various assets - using CSS styling to manage the various states of objects, and JS to manage this.

**3. OOP**<br />
This goes without saying; if you're developing a game, you use an object-oriented pattern.

With Rails, this is fairly natural.

----

<!-- ################################### -->
<!--              Front-End              -->
<!-- ################################### -->

# 2. Front-End

----

<!-- ################################### -->
<!--              Back-End               -->
<!-- ################################### -->

# 3. Back-end

----

<!-- ################################### -->
<!--              Marketing              -->
<!-- ################################### -->

# 4. Marketing
Not so important, but would certainly open up a lot of potentialities for people.

When creating a "game" - beyond its technology & playability - you need to create a compelling story.

Only games which have a valid stoyline are adopted.

----

<!-- ################################### -->
<!--            Contributions            -->
<!-- ################################### -->

# 5. Contributions
Not so important, but would certainly open up a lot of potentialities for people.

When creating a "game" - beyond its technology & playability - you need to create a compelling story.

Only games which have a valid stoyline are adopted.

----

<!-- ################################### -->
<!--             Copyright               -->
<!-- ################################### -->

:copyright: <a href="http://www.fl.co.uk" align="absmiddle" ><img src="readme/fl.jpg" height="22" align="absmiddle" /></a> <a href="http://stackoverflow.com/users/1143732/richard-peck?tab=profile" align="absmiddle" ><img src="https://avatars0.githubusercontent.com/u/1104431" height="22" align="absmiddle" /></a>

<!-- ################################### -->
<!--               Setup                 -->
<!-- ################################### -->

<!-- Refs -->
<!-- Comments http://stackoverflow.com/a/20885980/1143732 -->
<!-- Images   https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#images -->

<!-- Images -->
[banner]:readme/banner.jpg

<!-- Links -->
[rubygems]: http://rubygems.org/gems/exception_handler

<!-- Local Links -->
[engine]:        #1-engine
[front-end]:     #2-front-end
[back-end]:      #3-back-end
[marketing]:     #4-marketing
[contributions]: #5-contributions

<!-- ################################### -->
<!-- ################################### -->
