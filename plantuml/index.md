---
layout: default
title:  PlantUML
---

[PlantUML](http://plantuml.sourceforge.net/) is a component that allows to quickly write.
This is cheat sheet of PlantUML to use frequently.

# Basic

## Common

Notes and Comments.

| keyword        | usage               | image
|:--------------:|:-------------------:|
| `title`        | Title               | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/title.png)
| `note left :`  | Notes Left          | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/note_left.png)
| `note right :` | Notes Right         | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/note_right.png)
| `' `           | Single-line Comment |
| `/' '/`        | Block Comment       |

### Code

```
title Title

( )
note left : Note

[  ]
note right : Note

' single-line comment

/'
  block comment
'/
```

### Draw

![basic_common]({{ site.baseurl }}/assets/img/diagrams/basic/common.png)

## Participant

Participant actors.

| keyword    | usage    | image
|:----------:|:--------:|
| `actor`    | Actor    | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/actor.png)
| `boundary` | Boundary | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/boundary.png)
| `control`  | Control  | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/control.png)
| `entity`   | Entity   | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/entity.png)
| `database` | Database | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/database.png)

### Code

```
actor Actor
boundary Boundary
control Control
entity Entity
database Database

:Actor alias:
```

### Draw

![basic_participant]({{ site.baseurl }}/assets/img/diagrams/basic/participant.png)


## Arrow

Arrow direction.

| keyword    | usage   | image
|:----------:|:-------:|
| `-up->`    | Up      | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/up_line.png)
| `-down->`  | Down    | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/down_line.png)
| `-left->`  | Left    | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/left_line.png)
| `-right->` | Right   | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/right_line.png)

### Code

```
up -up-> right
-right-> down
-down-> left
-left-> up
```

### Draw

![basic_participant]({{ site.baseurl }}/assets/img/diagrams/basic/arrow.png)


# UML

## Use Case

Represent the required functions.

| keyword | usage    | image
|:-------:|:--------:|
|  `( )`  | Use Case | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/usecase.png)
|  `->`   | Use      | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/use_line.png)
|  `.>`   | Extend, Include | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/ext_line.png)

* [others](http://plantuml.sourceforge.net/usecase.html)

### Code

```
actor Promoter
actor Entrant

Promoter --> (Create Event)
Promoter -> (Attend Event)

Entrant --> (Find Event)
(Attend Event) <- Entrant

(Attend Event) <.. (Create Member)  : <<include>>
```

### Draw

![usecase_diagram]({{ site.baseurl }}/assets/img/diagrams/usecase.png)

## Activity

Represent the state of the process.

| keyword   | usage    | image
|:---------:|:--------:|
|  `" "`    | Activity | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/activity.png)
|  `(*) ->` | Initial  | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/initial_line.png)
|  `-> (*)` | Final    | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/final_line.png)

* [others](http://plantuml.sourceforge.net/activity.html)

### Code

```
(*) --> "Find Event"
"Find Event" -> "Attend Event"

if "Capacity?" then
  ->[ok] "Create Ticket"
else
  -->[full] if "Standby?" then
    ->[ok] "Standby Ticket"
  else
    -->[no] "Cancel Ticket"
    "Cancel Ticket" --> (*)
  endif
endif

"Create Ticket" --> ==show==
"Standby Ticket" --> ==show==
==show== --> "Show Ticket"
"Show Ticket" --> (*)
```

### Draw

![activity_diagram]({{ site.baseurl }}/assets/img/diagrams/activity.png)

## State

Represent the state of the objects.

| keyword    | usage   | image
|:----------:|:-------:|
|  `[*] ->`  | Initial | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/initial_line.png)
|  `-> [*]`  | Final   | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/final_line.png)

* [others](http://plantuml.sourceforge.net/state.html)

### Code

```
[*] --> active

active -right-> inactive : disable
inactive -left-> active  : enable

inactive --> closed  : close
active --> closed  : close

closed --> [*]
```

### Draw

![state_diagram]({{ site.baseurl }}/assets/img/diagrams/state.png)

## Sequence

Represent the messages and  orders of the interacts.

| keyword  | usage   | image
|:--------:|:-------:|
| `->`     | Message | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/message_line.png)
| `<--`    | Return  | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/return_line.png)

* [others](http://plantuml.sourceforge.net/sequence.html)

### Code

```
actor Entrant

Entrant -> Ticket : Attend Event Request

activate Ticket
Ticket -> Member : Create Member Request

activate Member
Member -> Member : Create Member
Ticket <-- Member : Create Member Response
deactivate Member

Ticket -> Ticket : Create Ticket
Entrant <-- Ticket : Attend Event Response
deactivate Ticket
```

### Draw

![sequence_diagram]({{ site.baseurl }}/assets/img/diagrams/sequence.png)

## Object

Represent the logical view of the object.

| keyword  | usage       | image
|:--------:|:-----------:|
| `object` | Object      | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/object.png)
| `<|-`    | Extension   | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/extension_line.png)
| `*-`     | Composition | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/composition_line.png)
| `o-`     | Agregation  | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/agregation_line.png)

* [others](http://plantuml.sourceforge.net/objects.html)

### Code

```
object User
object Group
object Member

object Event
object Ticket

User . Group
User o.. Member
Group o.. Member

Group o. Event
Event o.. Ticket
Member . Ticket
```

### Draw

![object_diagram]({{ site.baseurl }}/assets/img/diagrams/object.png)

## Class

Represent the logical view of the class.

| keyword | usage     | image
|:-------:|:---------:|
| `class` | Class     | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/class.png)
| `+`     | Public    | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/public_visibility.png)
| `-`     | Private   | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/private_visibility.png)
| `#`     | Protected | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/protected_visibility.png)
| `~`     | Package   | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/package_visibility.png)

* [others](http://plantuml.sourceforge.net/class.html)

### Code

```
class User {
  username
  password
  +sign_in()
}

class Group {
  name
}

class Member {
  roles
}

User .. Member
Group .. Member
```

### Draw

![class_diagram]({{ site.baseurl }}/assets/img/diagrams/class.png)

## Component

Represent the dependency of the components.

| keyword    | usage      | image
|:----------:|:----------:|
| `[ ]`      | Component  | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/component.png)
| `package`  | Package    | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/package.png)
| `frame`    | Frame      | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/frame.png)
| `folder`   | Folder     | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/folder.png)
| `database` | Database   | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/database.png)
| `node`     | Node       | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/node.png)
| `cloud`    | Cloud      | ![parts_usecase]({{ site.baseurl }}/assets/img/diagrams/parts/cloud.png)

* [others](http://plantuml.sourceforge.net/component.html)

### Code

```
cloud "Cloud" {
  package "Package" {
    [register]
    frame "frame" {
      [backup]
    }
  }
}

node "Node" {
  database "Database" {
    [store]
  }
  folder "Folder" {
    [File]
  }
}

[register] .. [store] : HTTP
[backup] .. [File] : FTP
```

### Draw

![component_diagram]({{ site.baseurl }}/assets/img/diagrams/component.png)
