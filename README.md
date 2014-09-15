# Draw UML

[![Gem Version](https://badge.fury.io/rb/draw_uml.png)](https://rubygems.org/gems/draw_uml) [![Build Status](https://travis-ci.org/ogom/draw_uml.png?branch=master)](https://travis-ci.org/ogom/draw_uml)

Drawing the Unified Modeling Language of Rack.

## Installation

Add this line to your application's Gemfile:

```
gem 'draw_uml'
```

And then execute:

```
$ bundle
```

## Usage

### Rack

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

Draw by selecting the model:

![sequence_diagram](http://ogom.github.io/draw_uml/assets/img/diagrams/sequence.png)

### Rails

Add this line to your `config/routes.rb`:

```
mount DrawUml::Engine, at: '/rails/draw/uml'
```

## Use

* [PlantUML](http://plantuml.sourceforge.net/)

## License

* MIT
