# PerlMUSH
PerlMUSH MUD like

Source: http://purlmush.blogspot.com

Some notes on the internal architecture:

Okay, so there's been a lot of talk about "objects" in relation to PurlMUSH. They've been talked about as if they are the greatest thing since sliced bread(they are) and as if they are going to save the world(virtually speaking) and butter toast(not a chance). This is going to be my attempt to communicate what objects are and what they aren't, and why Phoenyx and I are charging forward with the object-oriented banner held high and proud.

So, in typically "me" style, let me make an analogy for you. Let's take a clock radio as our example. Now, 75 years ago, if you had wanted a clock radio, you would have had to make a circuit board. You would have had to solder the components to the board. You would have had to make a case for it. You would have had to fashion buttons. You would have had to connect the wire. And it would have worked. It would tell time, it would broadcast radio stations, it might even have an alarm if you decided that you wanted it to.

Now, if you want a clock radio, you can go down to Sears and buy a pre-built, ready-to-use, no-soldering-required clock radio. This "object" that you just bought would work just fine, right out of the box. It already has all the components of a clock radio, is aware of what it needs to do in order to fulfill its role as a clock radio, and all you have to do is take this "object" and put it wherever a clock radio is needed.

The first clock radio, the one lovingly soldered together and carefully assembled? That's the original code, and the way a lot of code is written. All of the component parts assembled together carefully putting each piece in place. It's functional, maybe not the easiest thing to use, and unless you have a well-made box to put it in, you can see all of its parts. (And who likes to let their parts hang out for everyone to see?)

The second one, the one you bought at Sears? It is the new version of the code on which Phoenyx and I are working diligently. It has everything packaged up into a nice object, with which we can work.
Each "object" will represent an object in the database. In the original implementation, the database was what is called 'an array of hashes'.

So, here's how that worked. An array is a numbered list of items. For example:
Bob
Suzie
Charles
Diana
That is an array. Array element #1 is Bob. #3 is Charles. Etc. Because it's numbered, and because the default standard in MUSH is to reference things by what is called a 'database reference number' or dbref, an array is a logical way to organize things.

A hash is a referenced list. For example, if I was going to make a hash about this blog, it might look something like this:
Name = Culturing a Purl
URL = http://purlmush.blogspot.com
Started = February 2008
The words 'name', 'url', and 'started' are called the keys of the hash. And everything on the right-hand side of the = sign are called the values of the hash. Now, every object on a MUSH has attributes. These attributes have a name (Description, Alias, cmd_where) and a value. So, a hash makes a lot of sense as a way to organize the attributes.

If you put the two together, you are going to get an array of hashes. So, in the current implementation, I can refer to the name of room #10 like this:

$db[10]{"name"}

The $ tells Perl that it's a variable. Meaning a label that holds stuff. The [10] part tells the code what number in the array to look for. The {"name"} tells it which key in the hash to retrieve the value for. Now, you might ask yourself: But Santiago, this makes so much sense, why would you want to go and change that? Yes, it makes sense, but to a coder, it's cumbersome and in-elegant. Elegance is everything to a coder.

Under the new system, the arrays of hashes and all of that will be contained within an object. And the whole db will be inside one object. So, if we want the name of object #3, we'll do this:

$db->name(3)

Nicer, eh? An object is a piece of data that includes the methods we will need to be able to manipulate or report that data. So, with this object-oriented method, we can do things like the following. Let's say object #12 wants to set an attribute on #3:

$db->setAttr(12, 3, "foo", "You're a foo master!");

And that will set an attribute named foo on #3 with the value 'You're a foo master!". This attribute will be recorded as having been set by #12. Previously, we would have had to do this:

$db[3]{"foo"} = "You're a foo master!";

And that's just to set the attribute. That doesn't take into account keeping track of who set it, when, or anything else. The other nice thing is that setAttr, as a method of the $db object, will know whether #12 is even allowed to set attributes on #3. Previously, the code had to do all the tests for this in the main body of the code. Now, it's a matter of the object knowing how to do it, instead.

Does that mean we don't have to code those tests anymore? No, not at all. They will be built into the object instead of the main code. What it DOES mean though is that our objects will be handling the work load instead of the main body of the code. This will be easier to maintain, easier to manage, and easier to extend.

I hope this helps you understand what some of this rambling has been about. If you don't, e-mail me. :)
