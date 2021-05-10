---
layout: note
title: Continuous Delivery and Conway’s Law
author:
  name: Allan Kelly
  twitter: allankellynet
event:
  name: LondonCD
  date: 2014-01-23
slides: https://www.slideshare.net/allankellynet/conways-law-continuous-delivery
video: https://www.youtube.com/watch?v=Cu0AU8vw3xw
created_at: 2018-04-03
meta: 23 min read
category: notes
tags: [ Conway's Law, Continuous Delivery ]
---

This is a full transcript of [Allan Kelly](https://twitter.com/allankellynet)'s
"*Continuous Delivery and Conway's Law*" at the LondonCD Meetup. It gives an
in-depth overview of what Conway's Law is, how it impacts organisational and
system design and how it relates to Continuous Delivery.

---

The laws that govern your life as a software engineer:

- Moore’s Law: computing power doubles every 18-24 months
- Metcalf’s Law: the network becomes more useful the more devices are connected to it
- Conway’s Law: organisations design systems which copy the organisation
- Brooke’s Law: adding more people to a late project makes it  later
- Goodhart’s Law: making a target from a measure changes the measure (people will cut corners in an awful way to achieve the target)

**Conway’s Law**:

> organisations which design systems are constrained to produce designs which are copies of the communication structures of these organisations
>
> -— Melvin Conway, [How Do Committees Invent?](https://www.melconway.com/Home/Committees_Paper.html), 1968

Rephrased by Eric Raymond:

> If you have 4 groups working on a compiler, you’ll get a 4-pass compiler.
>
> -— The New Hacker's Dictionary, 1996

Coplien and Harrison:

> Make sure the organisation is compatible with the product architecture.
>
> -— Organisation patterns of agile software development, 2004

This is the key bit: **the organisation and the software must be in harmony**.
If the organisation and the software aren’t in harmony one of them will impose their will on the other.

Underlying Conway’s Law is the **Homomorphic Force**:

> Homomorphism is a structure-preserving map between 2 structures.
>
> -— taken from Algebra

This is what makes Conway’s Law: it is the power of what makes one system, one structure to bring itself about in another system. The force creates the same structure. The structures copy each other. It preserves the structure.

This means if you have 4 teams maintaining a 4-pass compiler. Over time you find the 4-pass compiler asserts itself on the organisation. The organisation cannot have 1 team maintaining the compiler. They need 4 teams.

Leads to the **Reverse Conway’s Law**:

> Organisations with long-lived systems will adopt a structure modelled on the system.

=> the system imposes itself on the organisation

If you have a 3 tier system - UI, business layer and DB - that will impose itself on the organisation. It will mirror itself back. And you see this with long lived software in long lived organisations. Which is fine as long as it allows you to continue. It might be a bit expensive, it might not be the most efficient way of working.

Where all hell really breaks loose is when management decides to reorganise things. And they send one of those layers to another country perhaps, or they decide we don’t need a database team - the database is done -, or the management decided to reorganise the organisation so the organisation is not compatible any more with the architecture.

The *Homomorphic Force* will be trying to reassert itself. Both sides gonna push on each other. If your software is around long enough, I would bet on the software.

That is why COBOL organisations find it very difficult to do anything approaching agile because their organisation is now in harmony with the software. The organisation designed the software. The software now imposes an organisational structure on the organisation. And if you try to change the organisation, the software won’t let it happen.

**Kelly’s Corollary**:

> Organisational design is system design.
>
> -— Allan Kelly, many times since 2005

I sometimes look at books about architecture, I hear Simon Brown talk about architecture and I think: what’s the freaking point. The organisation will create the software design.

=> architect the organisation to architect the system

- separate teams => separate modules

  If you have 2 distinct pieces of functionality, then separate them in 2 separate teams. Get each team to optimise around its own module.

  If you get 2 teams that are too tightly coupled, then separate the teams. Put them on different floors and they will separate the code.

  Conversely, if you ram 2 teams together, you find the modules become intertwined.

- collective code ownership leads to more integrated team and code

  It might be a good thing, it might be a bad thing.

  If you want the code to be more separated, separate the teams.

  But if you got lots and lots of layers, lots and lots of objects that are superfluous, bring the code together, bring the people together and the architecture will reflect that.

Back in Conway’s article (45 years ago, scary isn’t it):

Why do large systems disintegrate?

3 steps to disintegrate (from Conway):

1. > Designers realise the system will be large ... irresistible to assign too many people to a design effort

   => lets say we want to implement universal credit. We need to hire more people and create dedicated teams to manage the database, to implement different parts of the system, because we hire that many people we need a jobseeker platform, ...

   Just by saying it is a big system, you start to fold the design of the system. You also start to fold the hierarchy of the organisation.

2. > Conventional management of large design organisation causes its communication structure to disintegrate

   Conventional (hierarchical) management (I’m the general and I say what you need to do and you pass the word down) doesn’t allow for the communication you need. Because our database designer is sitting over here in the database silo hierarchy and the jobseeker designer is sitting over here in this silo    hierarchy. And they don’t talk. They don’t know each other. At best they have some paperwork that tell them how they should talk to each other.

   Because of that hierarchical structure you don’t get the communication structure. As a result homomorphism cuts in.

3. > Homomorphism: system structure disintegrates to reflect design organisation

   The people don’t talk, the code doesn’t talk. So you end up with a mini database schema over here at the jobseeker silo. So you end up duplicating work. You end up repeating work. You end up working in a less efficient manner.

   Over time this function in the organisation is reflected by this function in the code.

Conway’s Law cuts both ways. If you ignore it, it will have its way.

If you ignore Conway’s Law, the homomorphic force will cut in. The organisation will design the software and then the software will design the organisation.

If you pay attention to it, maybe you can’t control it, but at least you can work with it. Use it to your own advantage.

**Kelly’s Laws**:

> Project scope will always increase in proportion to resources
>
> -— Kelly’s First Law of Project Complexity

Did anyone ever thing universal credit could be a small system? No. Once start thinking it is a big system,  we start employing a lot of people. Once you start employing a lot of people, they start justifying themselves in the modules and areas they are gonna design. Once they start doing that, you get a lot of functionality.

> Inside every large project there is a small one struggling to get out
>
> -— Kelly’s Second Law of Project Complexity

When I joined RailTrack Prioritisation, there were a 120 people on the team trying to develop the new timetable software. Only about 10 of us actually cut code.

There is obviously a small system in there. As it got bigger and bigger and bigger, it became self-justifying.

You need to scale it back, trim it back, go for something small. If you start off small, if you think small, you can think perhaps you have a slightest chance for designing the right architecture. If you think big from the outset, you gonna get something big.

Question: **Can you break Conway's Law ? No**

I don't think you can. You can use it to your advantage, you can use it against you.

Ultimately, the [homomorphic] force is stronger than you. You cannot break the force. The force is there.
With a bit of knowledge you can start to use the force to your advantage.

Actually the force is more important than Conway's Law. **Conway's Law is the symptom of the Homomorphic Force**. It is the homomorphic force which is the thing creating these effects. And again, we have these 2 systems and with the homomorphic force it flows both ways.

The other way to look at it:

You are craftspeople, you know what to do don't you ?
Go against it and you'll get a mess.
Use the force. Work with it.

This is where you start to see craft in software design. Go with the force. Learn what is the right thing.

You can craft wood in all sorts of things. Only people that find the gray in the wood stop them to build what they want. People don't really understand wood.

Unfortunately in software terms that goes for a lot of managers and other organisational people that don't really understand how software is developed, how software development process flows.

> Software people, IT people don't appreciate the degree to which managing software projects is the same as managing any other piece of work.
>
> -- Fred Brooks

> People who haven't worked with software before are surprised on how managing software development is different to managing other types of work.
>
> -- Fred Brooks

Unless you appreciate that, you will go against the force. You will go across the homomorphic force and the force will come back. The force will win in the end.

**So what advise can I give you ?** Particularly what advise can I give you in terms of Continuous Delivery?

**You don't want to be cutting across the gray if you want to continuously deliver. You need everything to go into the right direction.**

## Whole team: include everyone

- developers, testers, analysts, product managers, etc. ...
  
  every time you introduce division within your organisation: there's the testers, there's the developers, there's the DBAs, you create an organisational boundary

  every time you create the need for more communication, there is more places for the homomorphic force to get in and starts to align

  don't add communication barriers

- absorb/embed the business

  keep communication paths short

  if you do continuous delivery this is one of the big once. You haven't got time to find THE business. You are THE business.

  at Financial Times: 400 IT staff - 600 journalists (almost a 1-to-1 ratio)

  increasingly businesses are IT businesses if they recognise it or not

  The companies with the highest growth rate are technology companies. Which isn't surprising cause they are shackled to Moore's Law - doubles computing power every 18 month to 2 years - and as the Internet has more and more nodes Metcalf's Law makes it more and more valuable.
  
  So if you are on the IT bandwagon, if  you have connected your growth prospects to Moore's Law and Metcalf's Law, you have a better chance to growing. If you are a newspaper, or a bank why wouldn't  you try to exploit this growth train.

  This means: their is no such thing as THE business and IT. They are one and the same. The IT staff is integral to the modern newspaper like the printers were decades ago. So why is the business sitting over here and the IT department over there?

  When I try to help organisation to adopt agile (or whatever it is called), you know what the most difficult thing to do is ? Getting people to move desks.
  
  The business is IT. And if you are doing Continuous Delivery you don't have time to find the business and ask their opinion on it.

- one team to rule them all

  - no communication divide
  - no "us & them"
  - one shared goal

## Start small: Delay staffing

Hold off delaying staff for as long as possible.

When you add staff you are adding more communication. When you add staff you are adding more nodes on the hierarchy. That will change your software. That will make your software get bigger. It will add more nodes to the software. It will change the design of your software. Particularly if you go get hiring the black arts specialist (DBAs and people like that).

- minimise communication boundaries

- start with smallest team possible

  - Minimally Viable Team

    that is how you get control of your architecture. The bigger your team, the more the team, the organisational structure will dictate your software structure.

  - slightly smaller than you think you need (to paraphrase Kent Beck)

    when you feel the pain, when you can justify getting somebody, then go hire them.

    There is a bigger problem in here. Software development does not have economies of scale. When you go buy milk, it is cheaper to buy the 4 pints carton of milk then to buy 4 one pint carton of milk. That is true for some industries. Not in software. **In software we have diseconomies of scale**. As you get bigger, as you get **bigger teams, bigger codebases**, more dependencies, more UI, more users the software **gets more expensive**. Keep it small. Rid yourself of economies of scale thinking. Unfortunately, going back to Conway's Law's point about management, most management economics trainings assume economies of scale whether they are there or not. It's assumed. People come to belief they are there. Everybody, you and management (but their the ones taking the decisions), have internalised economies of scale. We do not have economies of scale. It gets more expensive when you get more.

  - co-locate!

    I have nothing against off-shoring, but do it properly. Co-locate people, communication barriers. It is very unfashionable to say but co-located teams are still best and always will be best. If you have to put a phone call in somebody else, there is a communication divide. That will be reflected into your software somewhere. He'll have his function, you'll have your function, you have to call out the other function. If you are sitting at a desk next to each other, and maybe you pair-program, you maybe have 1 function.

- get a small system working

  - piecemeal growth

  - grow the team with the system

    small teams, small systems, piecemeal growth.

    Start as small as you can and grow as you need too. Don't start thinking big.

    instead of thinking Universal Credit is going to be a big system, you think Universal Credit could be small (like a small app on a phone). I think you'll have more success.

    But one of the first things you'll see is: you have to think about simplifying the rules, you have to think about changing the business to replicate it in software in the simplest smallest kind of way. This is not a message businesses want to here from IT teams.

    story: you are going to marry, and you go to your tailor to have the best looking suite for your marriage, the tailor measures you and says: well it would be really good if you could loose some pounds. Do you wanna here this from your tailor? Is that you've employed your tailor for?

    An awful lot of corporate groups consider the IT department as a service function. The service function ain't supposed to answer back. It is supposed to do what is being told and deliver. Actually IT departments have a lot of brains in them. And actually more and more companies are dependent on software. More and more the business relies on software. The business and the software are the same thing. If you put a communication divide in their it is reflected in your architecture.

## Multi-skilled Willing Staff

- all hands, one team

  - minimise title
  
  Chris Oldwood: "*Debbie does development*"

  US Marine Corps: "*Every man a rifle man*": whether you are a pilot or a ships captain you are also expected to know how to use an M16

- don't use technologies that require black arts specialists (e.g. databases which need DBA)

  DBAs are perhaps the best example of this [Conway's Law]. If you have a DBA that is the only one who is blessed to touch the database. Why do DBA dislike source control that much?
  
  If you channel all through the DBA that really affects your architecture. It's a bottleneck.

  When developers are allowed to develop SQL, even the DBA reviews it, even the DBA modifies it. It's a more coherent architecture.
  
  How much often you see systems where so much logic is stored in stored procedures for no bloody good reason. Actually I don't think stored procedures are a good idea for what so ever.

  You all need to go over all the system otherwise you are introducing hierarchy. You are introducing communication path. And that will be reflected in your software. Your software will be more complicated. It'll be the model of the more complex organisation you are in. You make the organisation more complex. You put in organisational boundaries. You put in specialism. It will be modelled in your software.

## Amoeba Teams

- start small

  1. prototype or research
  2. get going: Engineering & BA

- Grow
- Slit as appropriate

  - focus team
  - 1 project or area

- Fully staff each team - stand alone  

Start small, grow the team.

When the team gets to a critical mass, split it. But split it along architectural lines.

When you reach the point where you can split your software team, look at your software. Where are the natural divisions in the software. Or where should the natural divisions be.

If you take a large team and you are going to split it in 2, the software is going to reflect that. So make it one decision. Where do you want to split the software.

- Do you want the database and business logic divide ? Hmmm ...
- Or do you want a US and Europe divide ?
- Or perhaps we want a team having a common thing here ?

Team size ? 15 ? Or the magic number 7.

The magic number 7 paper. The author writes all the benefits of the magic number 7 to finally conclude he can't find any evidence of the magic number 7, he can't proof all of this.

I think it's about that point that you start thinking about whether this team should split or not. But certainly when you get into a mid team size it is a good time to split.

What I want from each team is each team to be coherent. Each team to be highly cohesive and decoupled from the other teams around it with a well defined interface. This means a team needs developers, testers, analysts/product managers/product owners and any other people you need to have in that team to make it coherent.

For me this usually means a ratio of one requirements type person to between 3 and 7 developers. And about 3 developers to a tester. Until you get to a team of about 10 it becomes worth splitting.

But off course if you decide to make an architectural split. You deliberately want to make these things more different. You might split on a smaller size.

Focus each team on one functional area. And fully staff each team. Each team is fully staffed to do what it needs to do. It's the old vertical team stuff. You want each team to stand alone.

So you grow a team until you can successfully split it. And these do not need to be equal sizes. You could grow a team say 12 and split it and have a team of 4 and have a team of 8. And then you can grow again the main team and split it again ... => you grow them, you split them

And if you need to you can always go in reverse. You can always shrink them back in to one another.

## Teams & Duration

prefer:

- short and fast (for short and fat (staffing))

over:

- long and thin

because:

- faster time to market
- higher rate on investment
- less resource contention
- requires clear prioritisation and closure

Do a little bit of work and deliver it. Move on to the next thing.

Don't do these long running, lightly staffed initiatives: one developer, one developer, one developer. I know 9 women do not have a baby in one month. But the other team is working well together, doing collective code ownership, you have a good test base and you have all that other good stuff, it is easier to move people behind.

When you have 3 developers working on this and then you deliver, you get immediate value from it. You have your continuous delivery and you drop this.
More resources work on the next thing and you drop this again. You start getting some value again. You do the next one and you get some value from that.

Often you see in organisation each developer got there own one man project, there own one-man team. That is a really a smelly anti-pattern. Unfortunately in one of Capers John's books he says he thinks over 50% of all software projects worldwide are one-man projects. That's incredibly sad. And I think this is just leaving money on the table. Cause if you take these one-man projects and you bundle them together and you deliver them fast, you can get a result faster.

What it does require, it requires from management to say to a customer: sorry you will have to wait until we have finished this next thing.
I think so often we have these multiple projects going on slowly in parallel because we can't just say no to people.

## NoProjects

- keep the team together
  - grow them, shrink them,
  - bend them, shake them,
  - but *never* disband them
- why break up a performing team ?
  - flow the work to the team
  - continuous flow

This idea of projects where you destroy the teams.

Again think about this in a Conway's Law context: they bring a team together, they develop some software and then they destroy it. You send the teams into the 4 winds, you turn them to recruitment agencies. The knowledge is lost. You cannot maintain software. The Homomorphic Force runs wild. You have to hire the people that goes with the architecture. Your chances to change the architecture are gone.

Keep your team together. Grow them ... but just don't disband them. Disband them is corporate psychopathy: killing successful teams. Successful software lives and changes. The only software that doesn't change is death software. Go to source forge and search for projects that have no changes since the last 6 months. You will find projects with no downloads. When people use software it needs changing.

If you kill the team, you don't let the software change. As a result the Homomorphic Force cuts in and the organisation can't change. The software has to live for the organisation to live. You kill the team, you kill the software, you'll cripple the organisation's ability to move on and change. And increasingly the more organisations are dependent on software changes the more they are suffering that.

Don't disband the team. Flow the work to the team. Why break up a team ? It's continuous. Does Manchester United at the end of the season say: "*season's over guys, go and get a summer job we see you in august ?*"

## Avoid Rock Stars

Rock Stars leave their marks on your software.

- expensive (but talented)
- temperamental
- unpredictable
- prone to outages
- demand flowers
  - and chocolates

=> are these attributes you want for your system ?

A customer showed me what they had: they had all sorts of bits of languages in there because they had different people working on it.
The Homomorphic Force again: you hire somebody, they come in, they impose their desires, their design on the system and then they go on.
Rock Stars may be talented but are expensive. Can be temperamental. They tend to be unpredictable.
Flowers and chocolates: comes from what venture capitalists found on the expensive accounts of EMI. They asked themselves: How can rock bands spend so much on flowers and chocolates ? It's drugs and prostitutes.
And that is what it'll do to your software. Your software will be temperamental, unpredictable, prone to outages.

If you got a team that lives with the software. If you have a team that have to live the consequences of their choices, they are gonna fix those problems. Software developers are engineers. Engineers are proud of their work.

## Conway's Second Law ?

Hidden in the Conway's Law paper, there is another law. He doesn't call it out. When I was preparing this talk, it came out in a google search result.

When you ignore the Homomorphic Force and you take a different point of view you end up with the fact that:

> There is never enough time to do the thing right, but there is always enough time to do it over.
>
> -- Melvin Conway, [How Do Committees Invent?](https://www.melconway.com/Home/Committees_Paper.html), 1968

We like to call them bugs.

How often do we see that: we've got to have this system out the door now. We got the developers and fast. Therefore let's employ a team of 20 people and really hit it, hit it hard. Rather than employing a team of 2. Do a prototype. Then build up, and then we'll spin up the team slowly until we get it out of the door.

You'll get a team of 20. They'll come in. They'll do something but organisational structure will impose the codebase that doesn't talk to each other. It'll take its time and a lot of it will need rework for the people who came afterwards. Things can't be hurried. Now the promise of continuous delivery is: you can deliver something, and you can deliver something again, and you can deliver something again, ... You can build up, build up and build up.

When people view this as there is only 1 delivery, there is an end-date. We've got to do it as fast as possible. We've got to staff it as much as possible. The staffing dictates your organisation such that the staffing dictates your software architecture. It is very unlikely to be optimal. Why would the software architecture be optimal if it is just a copy of the organisational architecture?

## Conclusion

As a move to the end, there is one thing I want you to remember: **whatever you do, start small and grow**.

Continuous Delivery is the way of doing that. Continuous Delivery is starting small and growing. It is the way of working with the Homomorphic Force. It is the way of bringing it to you. It is the way of not mastering Conway's Law at least working with it.

Incremental is not a dirty word.

If you want to read more about it:

- [original paper by Mel Conway](https://www.melconway.com/Home/Committees_Paper.html) (a paper that half of the business reviewers rejected because there are no studies in it that approved it)
- [*What do I think about Conway's Law now?*](https://www.allankellyassociates.co.uk/static/presentations/EuroPLoP2005/ConwaysLawFocusGroup.pdf), Hvatum & Kelly at EuroPLoP 2005

## Questions

### Team size

Find a productivity measure. Not lines of code, but what ever: function points, money, ...

A team of 2-3 developers will cut far more code than a team of 20.

A small team will be really, really productive. As add more and more. The productivity per person tails off very, very fast.

If we add more and more features, more people will buy it. Not necessarily. Think simple (see the iPod, iPhone).

When you add more and more people to a team, you get what the military calls "hungry mice": managers, business analysts who don't actively contribute to these things.

## Big Bang Organisational Change

Big Bang organisational changes have a poor success rate. Which is typified by organisations that have annually bing bang organisational changes. Part of the reason why the organisational change will not work (in technology organisations) is because the software will try imposing an architecture on the organisation.

Expect fluidity, the old emerge design type thing. Do you need to draw hierarchy charts? Can you let people write their own roles and responsibilities? I don't have any time for these roles and responsibilities documents where so many people have their job descriptions. They are pointless. You define your own roles and responsibilities. And it is far more useful. Ask people: would you write your own role description. Because people do the job they think they are employed to do, they feel capable of and they feel need doing.

It would be far better to ask every 12 month everybody to rewrite their job description. And that would probably reflect the software changes.

Suppose you now start doing JavaScript. 12 month ago nobody had JavaScript on their job description. Along the way you have introduced some JavaScript. Hopefully nobody said: not in my job description. Somebody is doing the JavaScript. Let them add this to their job description. Allow the job descriptions to evolve and move on.

Organisations exist to bring order in a chaotic environment. However, they value to be able to change and be flexible. Despite these are contractions. You have to build processes, activities, things into the structure of those organisations that allows them to change.

### ???

Maria Cavener, PhD on how the Design Patterns of the Gang of Four applies also to logistics firm. She found these patterns were equally applicable in logistics. Which is not surprising.

Chain of Responsibility pattern is actually based on what people used to do. In the old days, when there was a fire, people passed buckets full of water down the line.

A lot of the design patterns we use in our software are actually based on things that happened before.

Token-ring architecture is a very old one. Publish and Subscribe.

The delivery one: pushing out batches is a good one for the diseconomies of scale.

Because deliveries are expensive, we try to put more functionality into it. But that requires even more testing, more interactions. As a result the next release becomes more expensive. And we finally push it out. And because the last release was so expensive and so difficult, we try to put even more into the next release.

This is the opposite of Continuous Delivery: Make delivery cheap, so we can do it regularly. Do it often. Deliver early, deliver often. Keep pushing out. Make it bare cheap.

The real value of Continuous Delivery is not that it gives you continuous value. It is that it forces you to change the organisation. Being able to do a delivery every single day forces you to get good at all those things that you normally do every so quarter. And you batch it up and it becomes more expensive.

Conway's Law: Systems in the broadest sense. This is systems thinking. This applies to all systems. It is not different for the JavaScript world or the Java world or the logistics world. You see the same kind of things coming up again and again: bottlenecks, queuing theory. Whether it is in software or in the real world it is the same stuff.

### ???

...

Kevlin Henney: Code is not an asset. Functionality is an asset. Code is a liability.

More code has to be maintained.

The less code you have and the more functionality you have the better you are.

The ultimate asset is the capability to produce functionality. Having a team that can just turn the handle and produce functionality.

### More skills are needed today than before

The key skill for developers is to be able to learn rapidly. Nothing has changed in regard to the old days before 2000. As new technology is being added, other technology drop off at the end.

Organisations that are able to learn fastest are the organisations that will win.

Things haven't really changed over the years.

The biggest problem in our industry is the recruitment model. Something that is getting worse. A good example of Conway's Law: how we do recruitment in the industry. A lot of our problems in the industry go down to our recruitment model. Part is the shortterminism: working with contracts.

But more problematic are the recruitment agents. For a starter you have to write a recruitment description. You have to get it approved by the HR department. Which gets communicated to a recruitment agency. Who has a hierarchy of the guy who gets the deal, the guys who get to talk to the resources and the guys who make the phone calls at the bottom. And the guy who does the phone call at the bottom they couldn't get a job as a second hand sales agent. So they get a junior position at a recruitment agent. And if they hang in long enough, they might just get moved up a bit. They don't understand what Visual Basic is. These are the guys who call you and say: oh you have Informix on your CV and you say: euh ??? I used Informix once 10 years ago. I still get emails for C++ jobs although I didn't do for 10 years. And I know if I call them they will be the first to say: you haven't done some for 10 years. I know, you called me.
The recruitment model is fundamentally broken.

Get recruitment agents out of the picture. They are part of the problem. And I think all companies that are regarded as good are very proactive in their recruitment practices. They may use recruitment agents. But they use particular recruitment agents and they use them over a long period of time.
Companies that are able to hire the good people and build good teams are more proactive. They don't only use LinkedIn. Their own people use LinkedIn to choose the people they want to work there.

A San Francisco company: when they see the need for another person, they go out and they talk to people. They work out recommendations. They ask if you would get to work here, what would you do, what kind of job would you do here. And they build a job around that person. Which is very much what startups do. Corporations find this incredibly difficult. That is one advantage small companies have against big ones. As Paul Graham says: "*do the small things only the small can do*".

As skills-wise it is not much different then it ever was.
