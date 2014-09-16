---
layout: default
title:  Documentation
---

## DrawUML by Rack

### Installation

```
gem install draw_uml
```

### Usage

Put this line to your `config.ru`:

```
require 'draw_uml'
use Rack::Static, urls: ['/images'], root: 'public'
run DrawUml::Engine
```

And then execute:

```
$ rackup
```

## PlantUML

### Installation

#### Mac

```
brew install graphviz
brew install plantuml
```
