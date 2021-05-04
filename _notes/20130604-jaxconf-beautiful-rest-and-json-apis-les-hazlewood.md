---
layout: note
title: Beautiful REST + JSON APIs
event:
  name: JAXConf
  date: 2013-06-04
author:
  name: Les Hazlewood
  twitter: lhazlewood
created_at: 2014-02-24
date: 2021-04-26
video: https://www.youtube.com/watch?v=mZ8_QgJ5mbs
slides: http://www.slideshare.net/stormpath/rest-jsonapis
meta: 8 min read
categories: 
tags: [ API, REST, Design ]
---

Les Hazlewood, CTO @ [Stormpath](https://stormpath.com/) gives an in-depth
overview of what makes a RESTful API. The original video on which these notes
are based is not available any more. I fell back on the video of JAXConf.

---

HATEOAS: Hypermedia As The Engine Of Application State

==> further restriction on REST architectures

==> consumers of your REST API do know nothing about your application
Representing state in documents and linking these documents to other documents

Research by Roy Fielding:
[Architectural Styles and the Design of Network-based Software Architectures](https://www.ics.uci.edu/~fielding/pubs/dissertation/rest_arch_style.htm)

For consumers REST is easy

For providers REST is hard: is an architectural style. Not a standard. A set of conventions.

## Fundamentals

### Resources

Nouns, not verbs

Coarse grained, not fine grained: allows effort evolution over time (ex. Java method where parameters are added over time => work with a request object)

Do not add behaviour to your endpoint definitions ! This do not scale well over time. (Bad RPC)

2 types of resources:

- collections
- instances

collections: when searching  (passing queryparams) return the initial search parameters in the result

### Behaviour

Through 5 HTTP methods: `POST`, `GET`, `UPDATE`, `DELETE` and `HEAD`

There is not necessarily a 1-to-1 correspondence to
Create, Read, Update, Delete
according to the HTTP spec.

As expected:

- `GET` = Read
- `DELETE` = Delete
- `HEAD` = Headers, no body (do not return the resource, just metadata)

But:

`PUT` and `POST` can both be used for Create and Update

- `PUT` for Create: when the caller already knows the identifier (ex. create a user with that userid)
- `PUT` for Update: full replacement (all data must be provided)

`PUT` is an *Idempotent* operation (mandated by HTTP spec) => produces the same result regardless if it is called 1 time or 100 times

Whenever you use `PUT` either for Create or Update always send all data required by the server. Cannot be used for partial updates (see `PATCH` method, not yet approved)

- `POST` for Create: always on a parent resource

  Server response: 201 Created + Location header with the URL of the created resource

- `POST` for Update: on an instance resource and specify whatever property you want to change (partial update)

  Server response: 200 Ok

`POST` is the only method that is **NOT Idempotent**. POST is a server directive. You can really do whatever you want during a POST.

`POST` can therefore be used for partial updates to limit data traffic for example.

Blog post: [Create, Update and HTTP idempotence](http://www.stormpath.com/blog/put-or-post)

### Media Types

A lot of time overlooked when implementing a REST API.

A format specification with parsing rules.

Request: `Accept` header (comma separated list of accepted formats, with a preference for the first one)

Response: `Content-Type` header

You can create your own media type formats, ex

- `application/foo+json`: it is JSON but of the foo format, so you know what properties to expect
- `application/foo+json; application`: JSON of the foo format and it is an "application" resource.

Two take aways:

- REST is about media types and resources linked together.
- Distributed hypermedia, interlinking and media types are the most important things in your REST design.

## Design

### Base URL

URLs are not important in the world of REST. You should think about media types, collections and resources.

- http://api.foo.com

vs

- http://www.foo.com/dev/service/api/rest

Always make your rest api URLs as short as possible. Somehow self-documenting.

### REST Client vs Browser

There is value to allow developers to test your api through a browser. Do not redirect to a documentation site.
Otherwise developers need to use curl.

### Versioning

Two approaches:

- http://api.foo.com/v1
  
vs

- `Media-Type: application/json+foo;application&v=1`

First approach is concise, clear. It's the pragmatic approach. But your api must be stable, you do not want to see that version number increment a lot.

Do not use fine grained version numbers: 2.3.8. Not significant for data versions. Use whole numbers.

**Note:** JSON allows additions of properties without breaking the clients.

REST idealists want to use the media type because URLs do not matter. Thus clients need to send an `Accept` header requesting version 1 of the API and the server responds with version 1.

Server designers can thus increment the version number as much as they want. The URL does not change.

It takes a lot of time to design the Media Types.

### camelCase

JS in JSON = JavaScript

JavaScript is historically a **camelCase** language.

Underscores in properties and functions are unconventional in JavaScript. Stay consistent.

### Dates, Times and Timestamps

Use ISO8601.

Use UTC!!! It will make your life a lot easier.

### HREF

Every resource must have a globally unique URL. That URL replaces the notion of an id.
IDs still exist but should be opaque to the client.

```json
{
  "href": "http://api.foo.com/v1/resources/abc"
}
```

### Respond Body

Do I always need to return a body?

- `GET` is obvious.
- `POST`: recommendation where feasible return a pay load (a property timestamp could have been updated and the client immediately gets the updated version)

Add an override (?_body=false) for control (to limit data transfer)

### Content Negotiation

`Accept` header: Media Types listed in order of preference

Preferred way in REST apis to get the content back in the format you want.

Also possible though for convenience through the use of extensions on your resource URLs:

- /resources/abc.json
- /resources/abc.csv

Overrides the Accept header

### Resource Referencing aka Linking

Hypermedia is paramount.
Linking is fundamental to scalability (not performance but the ability for other systems to interact with you). You can grow your system through linking.

Tricky in JSON.
XML has it through XLink, JSON not (no standard).

Possible solution:

- instance reference
- collection reference

#### Instance Reference

```plain
GET /accounts/abc
200 OK
{
  "href": "http://api.stormpath.com/v1/accounts/abc",
  "name": ...,
  "directory": {
     "href": "http://API.stormpath.com/v1/directories/123"
  }
}
```

#### Collection Reference

```plain
GET /accounts/abc
200 OK
{
  "href": "http://api.stormpath.com/v1/accounts/abc",
  "name": ...,
  "groups": {
     "href": "http://api.stormpath.com/v1/accounts/abc/groups"
  }
}
```

### Reference Expansion aka Entity or Link Expansion

I have a resource with a couple of links, how do I expand those links to their resource definitions and get it all back in one document.

Example: "accounts" and "directory"

Add an `?expand=directory` as query parameter. This instructs the server to expand the "directory" in the response.

The proposed linking solution with `href` inside an object makes that "directory" is always an object even in its expanded form.
The client can discover if the object is expanded or not based on the presence of additional fields.

In addition you can have different caching and validation rules for the expanded version based on the presence of the query param.

From a REST perspective: these are separate resources

- /accounts/abc
- /accounts/abc?expand=directory

### Partial Representations

Add the name of the fields you want back as query param.

`GET /accounts/abc?fields=givenName,surName,directory(name)`

Allows clients to get whatever they need based on there requirements. Gives a lot of flexibility.

### Pagination

Support `Offset` and `Limit` query params for collection resources.

Your clients shouldn't know the usage of these query params. State is always in your documents and is all your clients need. Therefor add links to your collection resource.

```
GET /accounts/abc/groups
200 OK
{
  "href": "http://api.stormpath.com/v1/accounts/abc/groups",
  "offset": 0,
  "limit": 25,
  "first": { "href": "http://api.stormpath.com/v1/accounts/abc/groups?offset=0" },
  "previous": null,
  "next": { "href": "http://api.stormpath.com/v1/accounts/abc/groups?offset=25" },
  "last": { "href": "http://api.stormpath.com/v1/accounts/abc/groups?offset=100" },
  "items": [
  {
     "href": "http://api.stormpath.com/v1/accounts/abc/groups/1"
  },
  {
     "href": "http://api.stormpath.com/v1/accounts/abc/groups/1"
  },
  ]
}
```

**Note:** the children of the collection are just links. You can then request to expand items which avoids to perform 25 GET requests to expand the children.

**Note:** `offset` and `limit` could be integers (useful for RDBMS) but could also be something else like characters (usefull for NoSql).

### Many-to-Many

Example: "group" to "account"

Each mapping can be represented as it's own resource: GroupMembership

```plain
GET .../groupMemberships/231k3j2j3
200 OK
{
  "href": "http://api.stormpath.com/v1/groupMemberships/231k3j2j3",
  "account": {
     "href": "..."
  },
  "group": {
     "href": "..."
  },
  ...
}
```

This resource represents the link between the account and the group.

The benefit of this resource is that you can later expand it with i.e. a
timestamp of when it was created, the account responsible of its creation, ...

The representation of the account now has two collection links:
one to the groups and one to the groupMemberships.

```plain
GET /accounts/abc
200 OK
{
  "href": "http://api.stormpath.com/v1/accounts/abc",
  "name": ...,
  "groups": {
     "href": "http://api.stormpath.com/v1/accounts/abc/groups"
  },
  "groupMemberships": {
     "href": "http://api.stormpath.com/v1/groupMemberships?accountId=abc"
  }
}
```

### Errors

If something goes wrong, tell exactly what failed and how to fix it.

It should be as descriptive as possible.

It should deliver as much information as possible (where possible:
you don't inform if the password is wrong, this is security information)

See articles on Twilio and Apochy about this.

```plain
POST /directories
409 Conflict
{
  "status": 409,
  "code": 40924,
  "property": "name",
  "message": "",
  "developerMessage": "",
  "moreInfo": "http://www.stormpath.com/docs/api/errors/40924"
}
```

HTTP defines only 7 error codes for the server and 17 for the client. Thus have a separate `code` field to distinguish the different error conditions.

`property`: the name of the property on "directory" that caused the problem.

`message`: an end user friendly message.

`developerMessage`: a message targeted to the developer with a possible solution.

`moreInfo`: a link towards the documentation of the error code.

### Security

Avoid sessions, keep your REST API stateless ==> authenticate at each request if necessary

Even `sessionId` is not secure enough (copy it from one computer to another and all of a sudden you retrieve the same session)

Authorize based on the resource content not on a URL. Because URLs can change over time and then your security model is broken.

**Note:** in REST URLs play a very minor part.

Use existing protocols: OAuth1.0a, OAuth2, Basic only over SSL/TLS (because it is a very insecure protocol)

**Note:** OAuth2 is not more secure then OAuth1.0a. In fact OAuth1.0a is more secure as it uses encryption all over where OAuth2 starts over SSL and goes over to plaintext with the exchange of a bearer token that the client only has and gives to the server and trusts.

Use OAuth1.0a, much simpler.

Use custom authentication schemes if you really, really, really know what you are doing and provide an SDK.

Use API Keys instead of Username/Password.

#### 401 vs 403

`401 Unauthorized`: really means Unauthenticated (invalid credentials)

`403 Forbidden`: really means Unauthorized (valid credentials, but sorry you are not allowed)

#### HTTP Authentication Schemes

Server response: issues a challenge

`Header: WWW-Authenticate: <scheme-name> realm: "Application Name"`

Client request: submit credentials

`Header: Authorization: <scheme-name> <data>`

#### API Keys

Much more secure then username/password because of a much higher entropy (random machine generation)

Password Reset: breaks the clients as clients need to be updated

Speed: username/password need encryption using algorithm like bcrypt which slows down the authentication mechanism (do not use MD5 or SHA1, easily attack able with brute force). Perfectly acceptable for login, not for REST API.

Limited Exposure: generated on the fly and available for download (no copy paste from the screen)

Traceability: allows you to trace your clients usage of the API

### IDs

Should be globally unique

Avoid sequential numbers (contention: need one resource to generate these, fusking)

Good candidates: UUID (can be generated by a cluster, no contention), 'Url64' (128 bit random generated, base64 encoded)

### HTTP Method Overrides

Some clients support only GET and POST, not PUT and DELETE ==> add a query param `_method` on POST to indicate which method you really want to execute although this is a POST.

```
POST /accounts/abc?_method=DELETE
```

Only do this on POST not on GET, because POST is not Idempotent.

### Caching & Concurrency Control

Server: sends `ETag` header

Client: sends `If-None-Match` header with value of ETag to check if the resource was modified

Server: responds with `304 Not Modified`

**Note:** this does not work behind SSL, you then need to do your own caching

### Maintenance

Evolution on your API, how to handle this?

URL changes -> HTTP Redirects.

Create abstraction layer/endpoints when migrating.

Use well defined custom media types to indicate the version, or format.
