importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");

firebase.initializeApp({
    apiKey: "AIzaSyALQsK3VSz1_R9x8TJmw6uO7lwqRyhAJTs",
    authDomain: "smile-front.firebaseapp.com",
    projectId: "smile-front",
    storageBucket: "smile-front.appspot.com",
    messagingSenderId: "272148621093",
    appId: "1:272148621093:web:21e6054d9a5e31e7e95ccc",
    measurementId: "G-7XWJZ0CP9H"
});
// Necessary to receive background messages:
const messaging = firebase.messaging();