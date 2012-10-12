# Cylinder [![Build Status](https://secure.travis-ci.org/tstachl/cylinder.png?branch=master)](http://travis-ci.org/tstachl/cylinder)

Cylinder is a very simple jQuery plugin that generates a cylinder graphic. This graphic is built using SVG and is therefor dynamically changeable. Apart from setting the current value you can also set the empty and fluid colors.

## Version

v0.1.0

## Website Url

https://github.com/tstachl/cylinder

## Bug tracker

If you find a bug, please raise it the [issue here](https://github.com/tstachl/cylinder/issues) on Github! 

## Documenation

- Basic usage

```javascript
$('#element').cylinder({
  colors: {
    container: {
      fill: '#e5e5e5',
      stroke: '#dcdada'
    },
    fluid: {
      fill: '#0051A6',
      stroke: '#003974'
    },
    // Accent is the color on the top of the fluid
    accent: {
      fill: '#5d98d7',
      stroke: '#4483c4'
    }
  },
  value: .3
});
```

## Developer

Developed by Thomas Stachl, http://stachl.me/

+ [Github Profile](http://github.com/tstachl)