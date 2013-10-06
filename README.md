node-methodmissing
==================

capture method missing in node.js

usage
-----

### require with method missing

```javascript
mm = require('methodmissing');
fs = mm('fs');

fs.existsSync('.');  // true
fs.existSync('.');   // missing
```

### inherits method missing

```javascript
mm = require('methodmissing');
fs = require('fs');
mmfs = mm(fs);

mmfs.existsSync('.');  // true
mmfs.existSync('.');   // missing
```

options
-------

```javascript
mm = require('methodmissing');
```

### mm(object, callback)

#### object [string|object]

* on type of `string`
  * returns required object inherited method missing
* on type of `object`
  * returns object inherited method missing

#### callback [function(key, arg){}]

* called on missing method called

```js
var mm = require('methodmissing');
var fs = mm('fs', function (key, arg) {
  console.log(key + " missing");
});

fs.existsSync('.');  // true, callback not called

fs.existSync('.');   // undefined, callback called [1]

// key:  'existSync'
// arg:  { '0': '.' }
```
