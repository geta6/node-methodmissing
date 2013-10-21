node-methodmissing
==================

capture method missing in node.js

install
-------

```
npm i methodmissing
```

usage
-----

### inherits method missing

```javascript
mm = require('methodmissing');
fs = require('fs');
mmfs = mm(fs);

mmfs.existsSync('.');  // true
mmfs.existSync('.');   // missing
```

### require with method missing

```javascript
mm = require('methodmissing');
fs = mm('fs');

fs.existsSync('.');  // true
fs.existSync('.');   // missing
```

mm(object, callback)
--------------------

#### object [ string | object ]

* `string`: returns required object inherited method missing
* `object`: returns object inherited method missing

#### callback [ function (key, arg) ]

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
