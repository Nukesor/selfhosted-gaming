![Selfhosted-gaming](https://github.com/Nukesor/images/blob/master/selfhosted-gaming.png)

The official website can be found at [selfhosted-gaming.com](https://selfhosted-gaming.com).

The idea of this project is to create an **archive** and a well of knowledge for self-hosted game servers.

Looking for hints on how to set up a specific dedicated gaming server can be a real hassle.
It sometimes feels as if you're digging through archives to find some arcane knowledge for summoning a terrible abomination. 

The information you're looking for is are often spread among a variety of forums, Steam community posts, and blog posts.
These posts are often outdated or vague and on top of this old gaming forums and blogs keep going offline all the time.

That's why I decided to start this project.
Let's keep everything we learned in one place.
A place where everybody can easily contribute to it, where it's easy make a quick backup of **everything** and on a website that will most likely not go offline in the next 50+ years.

So, if you have some hidden knowledge on how to set up a specific game, please create an issue or pull request.
It's very much appreciated and it'll most likely help many other desperate and annoyed server operators out there.

This project is supposed to:

1. Show you how to install, configure and run certain game server.
2. Act as a consistent backup in an age of missing websites and disappearing gaming forums.
3. Enable others to easily contribute and add their own games.


# Building the project:

The project is build with the static site generator [zola](https://github.com/getzola/zola).

1. Install zola
2. Run `zola build`
4. Serve everything that's in the `public` folder
3. Done

For debugging purposes you can run `zola serve`, which starts a local server on `https://localhost:1111`
