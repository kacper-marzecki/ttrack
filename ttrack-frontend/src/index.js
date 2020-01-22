'use strict';

require("./styles.scss");
var Phoenix = require("../node_modules/phoenix/assets/js/phoenix")

const {Elm} = require('./Main');
var app = Elm.Main.init({flags: 6});

// let socket = new Phoenix.Socket("ws://ornery-stale-spittlebug.gigalixirapp.com/socket")
let socket = new Phoenix.Socket("ws://localhost:4000/socket")
socket.connect()
// app.ports.toJs.subscribe(data => {
//     console.log(data);
// })
// Use ES2015 syntax and let Babel compile it for you
var testFn = (inp) => {
    let a = inp + 1;
    return a;
}
