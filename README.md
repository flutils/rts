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
The front-end of the game is going to be built with `AngularJS` or some other front-end system.

The system will work by interfacing with the `back-end` and allowing users to send requests to the `Rails` application. These requests will be dependent on the front-end rules created as part of the application.

For example, if `Units` are moving between two co-ordinates, the `back-end` does not know about this. Only the `front-end` is able to manage the assets on the screen. This may change, but is how we'll define the scope between the two systems.

I have never designed something like this before, so will explain my overall thoughts:

**1. Pathfinding / Movement**<br />

   - Pathfinding
   - [Swarming (collision avoidance etc)](http://www.red3d.com/cwr/steer/)
   - Terrain management

As I've never designed anything like it, I don't know how to make the various objects move around on the screen. I anticipate that this JS engine will do all the heavy-lifting for the movement and interactivity.

**2. OOP**<br />
Object orientation is a programming design pattern centered around invoking "objects" into a worldview.

Whilst any seasoned developer will know this already, when it comes to managing this system - the underlying way I want to ensure it works is to create a "game" environment, and allow users to spawn in different objects is to build an entirely object oriented system.

The way it needs to work is to have a "game" scope/environment, through which each user is added and able to build units etc. The "game" scope will take the data from the `api` endpoint (back-end) and apply it to the rendered front-end.

Since we're using 2.5D, each object is going to have a "state" which will be represented by its image. The image will be managed by CSS:

```
# stylesheet.sass
.units
  .conscript
    background: [[ image ]]
    &.dead
      background: [[ image ]]
```

**3. sdf**<br />

----

<!-- ################################### -->
<!--              Back-End               -->
<!-- ################################### -->

# 3. Back-end
Ruby on Rails (`admin` endpoint ([`activeadmin`](https://activeadmin.info/)) + `API` for game creation/management (`nil` path)).

--

Will have the following data-structure:

1. `User` (users who are registered to play the game)
2. `Game` (games which have been run)
3. `Resource` (resources the users can use/collect within the game -- allows for perks such as supply drops etc)
4. `Map` (worldview which gets populated each time the game loads)
4. `Unit` (units the user can create during the game)
a) `Building` (should be sub-classed to `Unit` but without movement)
b) `Infantry` (should be sub-classed to `Unit` and focus on people-centric game activity)
c) `Vehicle`  (should be sub-classed to `Unit` and focus on vehicle-centric game activity)
5. `TechTree` (allows us to define relationships between `Unit` -- determining which will get built // for example, `Unit` `110` can only be built if `Unit 122` is present in the `Game`)

The back-end API should create the following:

```
-- Game (UUID)
--- Map
----- | spawns
------- | #1
------- | #2
------- | #3
----- | resources
----- | other_stuff_here (texturemap etc)
--- Users
----- | #user1
------- | resources
------- | buildings
---------- | command
---------- | barracks
---------- | shipyard
------- | units
---------- | #group1 (if groups are allocated)
------------ | conscript
------------ | conscript
------------ | conscript
----- | #user2
------- | resources
------- | buildings
------- | units
```

--

Works as follows:

 - Admin creates `factions`,`units`,`vehicles` and `resources` through admin panel
 - Each of the above is based on a number of "base classes" which can be completely customized
 - For example, maybe you want to add a unit which is only able to go on water. The base class would be `Unit`, but will have a large number of customization options that the admin will add through the admin panel:

 [[ admin panel ]]

  - For any "games" the user partakes in, a new `Game` will be created in the database. This `Game` will have a number of `Users` which will be allocated a number of `resources`,`units` depending on the type of `Game` created. For example, maybe the game begins with `20` units, or `1,000,000` resources.

  - Each `User` will be registered users and will be required to have an account on the system. The account signup process will be handled by `Devise` and reside at `https://www.game.com/signup` / `https://www.game.com/login`.

  - Every input the `user` makes in the game will be sent to the server (`https://www.game.com/:id/:user/units/new`) and a response formed by Rails. This response will be delivered back to the `front-end` and the engine will calculate the next steps.

  - The back-end will not calculate `front-end` stuff. For example, if the user sends units over a piece of land, the `back-end` will not track this. The `back-end` is only for managing `resources`, `units` and `vehicles` etc.

  - Users will not see the `back-end` - only the `front-end`. Admin panel users will be able to use it, but only in a secret capacity. The `front-end` (Angular) needs to handle all of the game UI etc.

----

<!-- ################################### -->
<!--              Marketing              -->
<!-- ################################### -->

# 4. Marketing
Not so important, but would certainly open up a lot of potentialities for people.

When creating a "game" - beyond its technology & playability - you need to create a compelling story.

Might not seem that big of a deal, but it's actually quite interesting -- if you take [Age of Empires](https://en.wikipedia.org/wiki/Age_of_Empires) or [C&C](https://en.wikipedia.org/wiki/Command_%26_Conquer), their "stories" are all at the core of the game itself.

Having a story - no matter how trivial - gives you the ability to create a "campaign" mode, and a number of other features that add depth to the experience. Whilst I'm not overly concerned about creating something substantive here, I am interested in building out something that users will be able to relate to.

If you were to market this thing as a real product, what you'd do is focus it heavily around a central storyline. The "factions" within the game would represent two sides, who are at war with each other for some reason. The heroes of each side will have their own

----

<!-- ################################### -->
<!--            Contributions            -->
<!-- ################################### -->

# 5. Contributions
You're free to download and contribute to the code however you wish.

Licensed under [MIT license][license].

----

<!-- ################################### -->
<!--             Copyright               -->
<!-- ################################### -->

:copyright: <a href="http://www.fl.co.uk" align="absmiddle" ><img src="private/readme/fl.jpg" height="22" align="absmiddle" /></a> <a href="http://stackoverflow.com/users/1143732/richard-peck?tab=profile" align="absmiddle" ><img src="https://avatars0.githubusercontent.com/u/1104431" height="22" align="absmiddle" /></a>

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

[license]: LICENSE

<!-- ################################### -->
<!-- ################################### -->
